#!/usr/bin/expect

set timeout 4

spawn telnet 10.63.135.254
expect "User Access Verification"
expect "Password:"
send "hyfo@9876\r"
expect "*#"
send "en\r"
expect "Password:"
send "hyfo@9876\n"
expect "*#"
send "sh standby brief | inc Gi0\n"
expect "*#"
send "exit\n"