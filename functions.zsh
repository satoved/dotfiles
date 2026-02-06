function commit() {
  commitMessage="$*"

  git add .

  if [ "$commitMessage" = "" ]; then
     # Start spinner in background
     {
       spinner="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
       while true; do
         for (( i=0; i<${#spinner}; i++ )); do
           printf "\r${spinner:$i:1} Generating commit message..."
           sleep 0.1
         done
       done
     } &!
     spinner_pid=$!

     # Cleanup function for interrupt
     cleanup() {
       { kill $spinner_pid; wait $spinner_pid; } 2>/dev/null
       printf "\r\033[K"
       trap - INT
       return 1
     }
     trap cleanup INT

     # Get diff and generate message
     diff_input=$(echo "=== Summary ===" && git diff --cached --stat && echo -e "\n=== Diff (truncated if large) ===" && git diff --cached | head -c 50000)
     commitMessage=$(echo "$diff_input" | claude -p "Write a single-line commit message for this diff. Output ONLY the message, no quotes, no explanation, no markdown.")

     # Stop spinner and clear line
     trap - INT
     { kill $spinner_pid; wait $spinner_pid; } 2>/dev/null
     printf "\r\033[K"

     git commit -m "$commitMessage"
     return
  fi

  eval "git commit -a -m '${commitMessage}'"
}
