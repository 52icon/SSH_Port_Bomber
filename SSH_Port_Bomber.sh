#!/bin/bash
ips=108.61.13.174 

for((Q=1;Q<=65535;Q++)); 
do   
for(( i=0;i<${#ips[*]};i++))
do
    expect <<EOF                       
    set timeout 3    
    spawn ssh -p${Q}  root@${ips[i]}
    expect {
        "*yes/no" { send "no\r" }
    }
    expect eof
EOF
done
done 
