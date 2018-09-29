
set prompt "#"
set address [lindex $argv 0]

spawn sudo bluetoothctl -a
expect -re $prompt
send "connect 70:F0:87:26:09:30\r"
sleep 1
expect -re $prompt
send "connect E4:8B:7F:09:B6:45\r"
sleep 1
expect -re $prompt
