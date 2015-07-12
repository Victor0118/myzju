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
static const char *ng0 = "G:/mips_pipeline2/code/alt_ctl.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {32U, 0U};
static int ng3[] = {0, 0};
static unsigned int ng4[] = {34U, 0U};
static int ng5[] = {1, 0};
static unsigned int ng6[] = {36U, 0U};
static int ng7[] = {2, 0};
static unsigned int ng8[] = {37U, 0U};
static int ng9[] = {3, 0};
static unsigned int ng10[] = {38U, 0U};
static int ng11[] = {4, 0};
static unsigned int ng12[] = {42U, 0U};
static int ng13[] = {5, 0};
static int ng14[] = {6, 0};
static unsigned int ng15[] = {4U, 0U};
static int ng16[] = {7, 0};
static unsigned int ng17[] = {3U, 0U};
static int ng18[] = {8, 0};
static unsigned int ng19[] = {7U, 0U};
static int ng20[] = {9, 0};
static unsigned int ng21[] = {2U, 0U};
static int ng22[] = {10, 0};
static unsigned int ng23[] = {6U, 0U};
static int ng24[] = {11, 0};
static unsigned int ng25[] = {1U, 0U};
static int ng26[] = {12, 0};
static int ng27[] = {13, 0};
static unsigned int ng28[] = {39U, 0U};
static int ng29[] = {14, 0};
static unsigned int ng30[] = {8U, 0U};
static unsigned int ng31[] = {12U, 0U};
static unsigned int ng32[] = {13U, 0U};
static unsigned int ng33[] = {10U, 0U};
static unsigned int ng34[] = {15U, 0U};



static void Always_25_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    char *t11;

LAB0:    t1 = (t0 + 2528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 2848);
    *((int *)t2) = 1;
    t3 = (t0 + 2560);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(26, ng0);

LAB5:    xsi_set_current_line(27, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t4, 6);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng30)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng31)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng32)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng33)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng34)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB17;

LAB18:
LAB20:
LAB19:    xsi_set_current_line(53, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);

LAB21:    goto LAB2;

LAB7:    xsi_set_current_line(28, ng0);

LAB22:    xsi_set_current_line(29, ng0);
    t7 = (t0 + 1208U);
    t8 = *((char **)t7);

LAB23:    t7 = ((char*)((ng2)));
    t9 = xsi_vlog_unsigned_case_compare(t8, 6, t7, 6);
    if (t9 == 1)
        goto LAB24;

LAB25:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB26;

LAB27:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB28;

LAB29:    t2 = ((char*)((ng8)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB30;

LAB31:    t2 = ((char*)((ng10)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB32;

LAB33:    t2 = ((char*)((ng12)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB34;

LAB35:    t2 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB36;

LAB37:    t2 = ((char*)((ng15)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB38;

LAB39:    t2 = ((char*)((ng17)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB40;

LAB41:    t2 = ((char*)((ng19)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB42;

LAB43:    t2 = ((char*)((ng21)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB44;

LAB45:    t2 = ((char*)((ng23)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB46;

LAB47:    t2 = ((char*)((ng25)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB48;

LAB49:    t2 = ((char*)((ng21)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB50;

LAB51:    t2 = ((char*)((ng28)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB52;

LAB53:
LAB55:
LAB54:    xsi_set_current_line(45, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);

LAB56:    goto LAB21;

LAB9:    xsi_set_current_line(48, ng0);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 5);
    goto LAB21;

LAB11:    xsi_set_current_line(49, ng0);
    t3 = ((char*)((ng7)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 5);
    goto LAB21;

LAB13:    xsi_set_current_line(50, ng0);
    t3 = ((char*)((ng9)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 5);
    goto LAB21;

LAB15:    xsi_set_current_line(51, ng0);
    t3 = ((char*)((ng13)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 5);
    goto LAB21;

LAB17:    xsi_set_current_line(52, ng0);
    t3 = ((char*)((ng27)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 5);
    goto LAB21;

LAB24:    xsi_set_current_line(30, ng0);
    t10 = ((char*)((ng3)));
    t11 = (t0 + 1608);
    xsi_vlogvar_assign_value(t11, t10, 0, 0, 5);
    goto LAB56;

LAB26:    xsi_set_current_line(31, ng0);
    t3 = ((char*)((ng5)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 5);
    goto LAB56;

LAB28:    xsi_set_current_line(32, ng0);
    t3 = ((char*)((ng7)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 5);
    goto LAB56;

LAB30:    xsi_set_current_line(33, ng0);
    t3 = ((char*)((ng9)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 5);
    goto LAB56;

LAB32:    xsi_set_current_line(34, ng0);
    t3 = ((char*)((ng11)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 5);
    goto LAB56;

LAB34:    xsi_set_current_line(35, ng0);
    t3 = ((char*)((ng13)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 5);
    goto LAB56;

LAB36:    xsi_set_current_line(36, ng0);
    t3 = ((char*)((ng14)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 5);
    goto LAB56;

LAB38:    xsi_set_current_line(37, ng0);
    t3 = ((char*)((ng16)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 5);
    goto LAB56;

LAB40:    xsi_set_current_line(38, ng0);
    t3 = ((char*)((ng18)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 5);
    goto LAB56;

LAB42:    xsi_set_current_line(39, ng0);
    t3 = ((char*)((ng20)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 5);
    goto LAB56;

LAB44:    xsi_set_current_line(40, ng0);
    t3 = ((char*)((ng22)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 5);
    goto LAB56;

LAB46:    xsi_set_current_line(41, ng0);
    t3 = ((char*)((ng24)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 5);
    goto LAB56;

LAB48:    xsi_set_current_line(42, ng0);
    t3 = ((char*)((ng26)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 5);
    goto LAB56;

LAB50:    xsi_set_current_line(43, ng0);
    t3 = ((char*)((ng27)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 5);
    goto LAB56;

LAB52:    xsi_set_current_line(44, ng0);
    t3 = ((char*)((ng29)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 5);
    goto LAB56;

}


extern void work_m_00000000002448287902_1302989821_init()
{
	static char *pe[] = {(void *)Always_25_0};
	xsi_register_didat("work_m_00000000002448287902_1302989821", "isim/test_top_isim_beh.exe.sim/work/m_00000000002448287902_1302989821.didat");
	xsi_register_executes(pe);
}
