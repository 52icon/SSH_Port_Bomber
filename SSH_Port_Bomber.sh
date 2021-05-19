#!/bin/bash
ips=108.61.13.174   #输入你的目标IP地址

for((Q=1;Q<=65535;Q++));   #端口范围
do   
for(( i=0;i<${#ips[*]};i++))
do
    expect <<EOF                       
    set timeout 3     #超时时间，如果延迟较大，建议调高
    spawn ssh -p${Q}  root@${ips[i]}
    expect {
        "*yes/no" { send "no\r" }
    }
    expect eof
EOF
done
done 
