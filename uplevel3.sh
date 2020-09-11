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
send "conf t\r"
expect "*#"
send "standby 1 priority 105\n"
expect "*#"
send "wr\n"
expect "*#"
send "exit\n"