#!/bin/sh
echo "My DHCP ip pool is in the range of 100 and 199."
echo "The MAC od my WRTNode is 66:51:7e:80:1b:fa."
echo "I'll found the ip address through the following shell script."
for i in `seq 100 199`
do
        ip=192.168.1.$i
        ping -c1 $ip > /dev/null 2>&1
        if [ $? -eq 0 ]
        then
		echo "$ip is tesing"
                WRTinfo=`arp -a $ip | grep 66:51:7e:80:1b:fa`
		if [ -n "$WRTinfo" ]
		then
			echo "The ip of WRTNode is found!"
			echo $WRTinfo
			WRTip=`echo $WRTinfo | grep -Eo '([0-9]*\.){3}[0-9]*'`
			echo "The ip op WRTNode is $WRTip "
			break
		fi
        fi
done
