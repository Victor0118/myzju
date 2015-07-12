//============================================================================
// Name        : task2.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include <stdlib.h>
#include<sstream>
#include<fstream>
using namespace std;

int main() {
	system("arp -a > a.txt");
	string duinomac="4c-53-1f-13-59-d4";
	//duinomac="01-00-5e-00-00-02";
	ifstream fin("a.txt");
	if(!fin)
	{
		cout<<"can't open file a.txt"<<endl;
		exit(-1);
	}
	string duinoip="";
	string readmac;
	fin>>duinoip;
	while(!fin.eof())
	{

		fin>>readmac;
		if(readmac==duinomac)
		{	cout<<"pcDuino IP: "<<duinoip<<endl;break;}
		else
			duinoip=readmac;
	}
	fin.close();
	string command="ping "+duinoip;
	system(command.c_str());
}
