#include <iostream>
#include <stdlib.h>
#include <sstream>
#include <fstream>
using namespace std;

int main() {
	system("arp -a > a.txt");
	string mac="64-51-7e-80-1b-0c";

	ifstream fin("a.txt");
	if(!fin)
	{
		cout<<"Cannot open file!"<<endl;
		exit(-1);
	}
	string ip="";
	string readmac;
	fin >> ip;
	while(!fin.eof())
	{

		fin >> readmac;
		if(readmac==mac)
		{
			cout<<"IP: "<< ip <<endl;
			break;
		}
		else
			ip = readmac;
	}
	fin.close();
	string command = "ping " + ip;
	system(command.c_str());
}
