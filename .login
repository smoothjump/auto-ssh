#!/usr/bin/expect
set timeout 6
set username [lindex $argv 0]
set password [lindex $argv 2]
set hostname [lindex $argv 1]
set port [lindex $argv 3]
spawn ssh -p ${port} ${username}@${hostname}
expect {
"*yes/no" {send "yes\r"; exp_continue}
"*ssword:" {send "${password}\r"}
}
interact
