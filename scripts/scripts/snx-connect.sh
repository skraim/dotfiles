#!/usr/bin/expect -f

set timeout 10
set password [exec pass $env(SNX_PASS_KEY)]
set otp [exec pass otp $env(SNX_OTP_KEY)]

spawn snxctl connect

expect "Password:"
send "$password\r"

expect "Enter Your Microsoft verification code"
send "$otp\r"

expect {
    -re "Server name: (\[^\r\n\]*)\r\n.*?Tunnel type: (\[^\r\n\]*)" {
        set server [string trim $expect_out(1,string)]
        set tunnel [string trim $expect_out(2,string)]
        exec dunstify -t 2000 -a "SNX" "Connected" "Server: $server\nTunnel: $tunnel"
    }
    timeout {
        exec dunstify -t 2000 -u critical -a "SNX" "Failed to get connection details"
        exit 1
    }
}

interact
