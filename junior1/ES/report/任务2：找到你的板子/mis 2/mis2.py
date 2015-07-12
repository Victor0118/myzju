#-*-coding:utf-8 -*-
import os
import urllib
arp = os.popen('arp -a').readlines()	#get info by arp -a
i = 0
mac = '4c-53-53-c4-b5-69'				#puDuino's IP address
arplis = []								#list of mac and IP address
for ip in arp:
	ip=ip.strip('\n')
	if i > 2:
		t = ip.split(' ')
		tmp = []
		for l in t:
			if l != '':
				tmp.append(l)			#get mac and IP
		arplis.append(tmp)
	i = i + 1

for ip in arplis:						#find IP of pcDuinod
	if len(ip) > 1:
		if ip[1] == mac:
			pcDuino_ip = ip[0]

print ('IP address of pcDuino: ' + pcDuino_ip)

res_ping = os.popen('ping ' + pcDuino_ip).readlines()	#ping pcDuino
for l in res_ping:
	l = l.strip('\n')
	print (l)
raw_input() #