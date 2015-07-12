/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "G:/mips_pipeline2/code/imm_addr.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {8, 0};



static void Cont_8_0(char *t0)
{
    char t3[8];
    char t12[8];
    char t14[8];
    char t25[8];
    char t27[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t13;
    char *t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t26;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;

LAB0:    t1 = (t0 + 2528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(8, ng0);
    t2 = (t0 + 1208U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    *((unsigned int *)t3) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t10 & 4294967295U);
    t11 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t11 & 4294967295U);
    t13 = ((char*)((ng1)));
    t15 = (t0 + 1048U);
    t16 = *((char **)t15);
    memset(t14, 0, 8);
    t15 = (t14 + 4);
    t17 = (t16 + 4);
    t18 = *((unsigned int *)t16);
    t19 = (t18 >> 0);
    *((unsigned int *)t14) = t19;
    t20 = *((unsigned int *)t17);
    t21 = (t20 >> 0);
    *((unsigned int *)t15) = t21;
    t22 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t22 & 65535U);
    t23 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t23 & 65535U);
    t24 = ((char*)((ng1)));
    xsi_vlogtype_concat(t12, 32, 32, 3U, t24, 14, t14, 16, t13, 2);
    memset(t25, 0, 8);
    xsi_vlog_unsigned_add(t25, 32, t3, 32, t12, 32);
    t26 = ((char*)((ng2)));
    memset(t27, 0, 8);
    xsi_vlog_unsigned_minus(t27, 32, t25, 32, t26, 32);
    t28 = (t0 + 2928);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    memcpy(t32, t27, 8);
    xsi_driver_vfirst_trans(t28, 0, 31);
    t33 = (t0 + 2848);
    *((int *)t33) = 1;

LAB1:    return;
}


extern void work_m_00000000002820534030_2346157239_init()
{
	static char *pe[] = {(void *)Cont_8_0};
	xsi_register_didat("work_m_00000000002820534030_2346157239", "isim/test_top_isim_beh.exe.sim/work/m_00000000002820534030_2346157239.didat");
	xsi_register_executes(pe);
}
