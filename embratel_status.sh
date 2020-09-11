root@REDE-MPLS01:/opt/monit# cat embratel_status.sh
#!/usr/bin/expect

set timeout 2

spawn telnet 10.63.135.253
expect "User Access Verification"
expect "Password:"
send "R3deL!nk2\n"
expect "*#"
send "en\r"
expect "Password:"
send "R3deL!nk2\n"
expect "*#"
send "sh standby brief | inc Gi0\n"
expect "*#"
send "exit\n"
