// task2.cpp : 定义控制台应用程序的入口点。
//
#include <iostream>
#include <stdlib.h>
#include<sstream>
#include<fstream>
using namespace std;

int main() {
	system("arp -a > a.txt");
	string pimac="b8-27-eb-b7-7c-49";
	ifstream fin("a.txt");
	if(!fin)
	{
		cout<<"can't open file a.txt"<<endl;
		exit(-1);
	}
	string pi_ip="";
	string readmac;
	fin>>pi_ip;
	while(!fin.eof())
	{

		fin>>readmac;
		if(readmac==pimac)
		{	cout<<"raspberrypi IP: "<<pi_ip<<endl;break;}
		else
			pi_ip=readmac;
	}
	fin.close();
	string command="ping "+pi_ip;
	system(command.c_str());
	int a;
	cin>>a;
}
