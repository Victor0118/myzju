#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>
#include <wiringPi.h>
// What GPIO input are we using?
//      This is a wiringPi pin number
#define BUTTON_PIN  1   //18
#define PIN1        5   //24
#define PIN2        6   //25
#define PIN3        26  //12
#define PIN4        27  //16
#define PIN5        28  //20
#define PIN6        29  //21
#define PIN7        25  //26
#define PIN8        24  //19
#define PIN9        23  //13
#define PIN10       22  //6
#define PIN11       21  //5
#define PIN12       7   //4
#define D1      PIN1
#define A       PIN2
#define F       PIN3
#define D2      PIN4
#define D3      PIN5
#define B       PIN6
#define D4      PIN7
#define G       PIN8
#define C       PIN9
#define DP      PIN10
#define D       PIN11
#define E       PIN12
#define DIGIT       4
#define SEGMENT     8
#define NUM0        0xfc
#define NUM1        0x60
#define NUM2        0xda
#define NUM3        0xf2
#define NUM4        0x66
#define NUM5        0xb6
#define NUM6        0xbe
#define NUM7        0xe0
#define NUM8        0xfe
#define NUM9        0xf6
#define DELTA       500

#define MTOP        0x80

#define RTOP        0x40
#define RBOT        0x20
#define MBOT        0x10

#define LBOT        0x08
#define LTOP        0x04

#define MMID        0x02

#define POINT       0x01
