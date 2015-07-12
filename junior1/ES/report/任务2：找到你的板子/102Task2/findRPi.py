# coding: utf-8
import os, re, sys
# IP address r.e.
reip = re.compile(r'(?<![\.\d])(?:\d{1,3}\.){3}\d{1,3}(?![\.\d])')

# execute cmd
def execCmd(cmd):
	r = os.popen(cmd)
	text = r.read()
	r.close()
	return text

def findip(line):
	# print line
	if line.find("b8-27-eb-ea-99-e9") != -1:
		print reip.findall(line)[0]

if __name__ == '__main__':
	cmd = "arp -a"
	result = execCmd(cmd)
	lines = result.split('\n')
	for line in lines:
		findip(line)