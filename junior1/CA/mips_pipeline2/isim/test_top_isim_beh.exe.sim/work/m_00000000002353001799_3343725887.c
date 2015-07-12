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
static const char *ng0 = "G:/mips_pipeline2/code/exin.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {32U, 0U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {34U, 0U};
static unsigned int ng5[] = {2U, 0U};
static unsigned int ng6[] = {36U, 0U};
static unsigned int ng7[] = {3U, 0U};
static unsigned int ng8[] = {37U, 0U};
static unsigned int ng9[] = {4U, 0U};
static unsigned int ng10[] = {5U, 0U};
static unsigned int ng11[] = {6U, 0U};
static unsigned int ng12[] = {7U, 0U};
static unsigned int ng13[] = {8U, 0U};
static unsigned int ng14[] = {12U, 0U};
static unsigned int ng15[] = {9U, 0U};
static unsigned int ng16[] = {13U, 0U};
static unsigned int ng17[] = {10U, 0U};
static unsigned int ng18[] = {35U, 0U};
static unsigned int ng19[] = {11U, 0U};
static unsigned int ng20[] = {43U, 0U};
static unsigned int ng21[] = {14U, 0U};
static unsigned int ng22[] = {15U, 0U};



static void Always_26_0(char *t0)
{
    char t13[8];
    char t16[8];
    char t26[8];
    char t27[8];
    char t28[8];
    char t29[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t14;
    int t15;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    int t25;
    char *t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    char *t62;
    char *t63;

LAB0:    t1 = (t0 + 2688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 3008);
    *((int *)t2) = 1;
    t3 = (t0 + 2720);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(27, ng0);

LAB5:    xsi_set_current_line(28, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t13 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 26);
    *((unsigned int *)t13) = t7;
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 26);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t10 & 63U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 63U);

LAB9:    t5 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 6, t5, 6);
    if (t15 == 1)
        goto LAB10;

LAB11:    t2 = ((char*)((ng13)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 6, t2, 6);
    if (t15 == 1)
        goto LAB12;

LAB13:    t2 = ((char*)((ng14)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 6, t2, 6);
    if (t15 == 1)
        goto LAB14;

LAB15:    t2 = ((char*)((ng16)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 6, t2, 6);
    if (t15 == 1)
        goto LAB16;

LAB17:    t2 = ((char*)((ng18)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 6, t2, 6);
    if (t15 == 1)
        goto LAB18;

LAB19:    t2 = ((char*)((ng20)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 6, t2, 6);
    if (t15 == 1)
        goto LAB20;

LAB21:    t2 = ((char*)((ng9)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 6, t2, 6);
    if (t15 == 1)
        goto LAB22;

LAB23:    t2 = ((char*)((ng10)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 6, t2, 6);
    if (t15 == 1)
        goto LAB24;

LAB25:    t2 = ((char*)((ng5)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 6, t2, 6);
    if (t15 == 1)
        goto LAB26;

LAB27:
LAB29:
LAB28:    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 8);

LAB30:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(29, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 1768);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 8);
    goto LAB8;

LAB10:    xsi_set_current_line(33, ng0);

LAB31:    xsi_set_current_line(34, ng0);
    t11 = (t0 + 1368U);
    t12 = *((char **)t11);
    memset(t16, 0, 8);
    t11 = (t16 + 4);
    t17 = (t12 + 4);
    t18 = *((unsigned int *)t12);
    t19 = (t18 >> 0);
    *((unsigned int *)t16) = t19;
    t20 = *((unsigned int *)t17);
    t21 = (t20 >> 0);
    *((unsigned int *)t11) = t21;
    t22 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t22 & 63U);
    t23 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t23 & 63U);

LAB32:    t24 = ((char*)((ng2)));
    t25 = xsi_vlog_unsigned_case_compare(t16, 6, t24, 6);
    if (t25 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB35;

LAB36:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB37;

LAB38:    t2 = ((char*)((ng8)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB39;

LAB40:    t2 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB41;

LAB42:    t2 = ((char*)((ng5)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB43;

LAB44:    t2 = ((char*)((ng7)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB45;

LAB46:
LAB47:    goto LAB30;

LAB12:    xsi_set_current_line(47, ng0);
    t3 = ((char*)((ng13)));
    t4 = (t0 + 1768);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 8);
    goto LAB30;

LAB14:    xsi_set_current_line(48, ng0);
    t3 = ((char*)((ng15)));
    t4 = (t0 + 1768);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 8);
    goto LAB30;

LAB16:    xsi_set_current_line(49, ng0);
    t3 = ((char*)((ng17)));
    t4 = (t0 + 1768);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 8);
    goto LAB30;

LAB18:    xsi_set_current_line(50, ng0);
    t3 = ((char*)((ng19)));
    t4 = (t0 + 1768);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 8);
    goto LAB30;

LAB20:    xsi_set_current_line(51, ng0);
    t3 = ((char*)((ng14)));
    t4 = (t0 + 1768);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 8);
    goto LAB30;

LAB22:    xsi_set_current_line(52, ng0);
    t3 = ((char*)((ng16)));
    t4 = (t0 + 1768);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 8);
    goto LAB30;

LAB24:    xsi_set_current_line(53, ng0);
    t3 = ((char*)((ng21)));
    t4 = (t0 + 1768);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 8);
    goto LAB30;

LAB26:    xsi_set_current_line(54, ng0);
    t3 = ((char*)((ng22)));
    t4 = (t0 + 1768);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 8);
    goto LAB30;

LAB33:    xsi_set_current_line(36, ng0);

LAB48:    xsi_set_current_line(37, ng0);
    t30 = (t0 + 1368U);
    t31 = *((char **)t30);
    memset(t29, 0, 8);
    t30 = (t29 + 4);
    t32 = (t31 + 4);
    t33 = *((unsigned int *)t31);
    t34 = (t33 >> 11);
    *((unsigned int *)t29) = t34;
    t35 = *((unsigned int *)t32);
    t36 = (t35 >> 11);
    *((unsigned int *)t30) = t36;
    t37 = *((unsigned int *)t29);
    *((unsigned int *)t29) = (t37 & 31U);
    t38 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t38 & 31U);
    memset(t28, 0, 8);
    t39 = (t29 + 4);
    t40 = *((unsigned int *)t39);
    t41 = (~(t40));
    t42 = *((unsigned int *)t29);
    t43 = (t42 & t41);
    t44 = (t43 & 31U);
    if (t44 != 0)
        goto LAB49;

LAB50:    if (*((unsigned int *)t39) != 0)
        goto LAB51;

LAB52:    memset(t27, 0, 8);
    t46 = (t28 + 4);
    t47 = *((unsigned int *)t46);
    t48 = (~(t47));
    t49 = *((unsigned int *)t28);
    t50 = (t49 & t48);
    t51 = (t50 & 1U);
    if (t51 != 0)
        goto LAB53;

LAB54:    if (*((unsigned int *)t46) != 0)
        goto LAB55;

LAB56:    t53 = (t27 + 4);
    t54 = *((unsigned int *)t27);
    t55 = *((unsigned int *)t53);
    t56 = (t54 || t55);
    if (t56 > 0)
        goto LAB57;

LAB58:    t58 = *((unsigned int *)t27);
    t59 = (~(t58));
    t60 = *((unsigned int *)t53);
    t61 = (t59 || t60);
    if (t61 > 0)
        goto LAB59;

LAB60:    if (*((unsigned int *)t53) > 0)
        goto LAB61;

LAB62:    if (*((unsigned int *)t27) > 0)
        goto LAB63;

LAB64:    memcpy(t26, t62, 8);

LAB65:    t63 = (t0 + 1768);
    xsi_vlogvar_assign_value(t63, t26, 0, 0, 8);
    goto LAB47;

LAB35:    xsi_set_current_line(39, ng0);
    t3 = ((char*)((ng5)));
    t4 = (t0 + 1768);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 8);
    goto LAB47;

LAB37:    xsi_set_current_line(40, ng0);
    t3 = ((char*)((ng7)));
    t4 = (t0 + 1768);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 8);
    goto LAB47;

LAB39:    xsi_set_current_line(41, ng0);
    t3 = ((char*)((ng9)));
    t4 = (t0 + 1768);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 8);
    goto LAB47;

LAB41:    xsi_set_current_line(42, ng0);
    t3 = ((char*)((ng10)));
    t4 = (t0 + 1768);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 8);
    goto LAB47;

LAB43:    xsi_set_current_line(43, ng0);
    t3 = ((char*)((ng11)));
    t4 = (t0 + 1768);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 8);
    goto LAB47;

LAB45:    xsi_set_current_line(44, ng0);
    t3 = ((char*)((ng12)));
    t4 = (t0 + 1768);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 8);
    goto LAB47;

LAB49:    *((unsigned int *)t28) = 1;
    goto LAB52;

LAB51:    t45 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t45) = 1;
    goto LAB52;

LAB53:    *((unsigned int *)t27) = 1;
    goto LAB56;

LAB55:    t52 = (t27 + 4);
    *((unsigned int *)t27) = 1;
    *((unsigned int *)t52) = 1;
    goto LAB56;

LAB57:    t57 = ((char*)((ng3)));
    goto LAB58;

LAB59:    t62 = ((char*)((ng1)));
    goto LAB60;

LAB61:    xsi_vlog_unsigned_bit_combine(t26, 8, t57, 8, t62, 8);
    goto LAB65;

LAB63:    memcpy(t26, t57, 8);
    goto LAB65;

}


extern void work_m_00000000002353001799_3343725887_init()
{
	static char *pe[] = {(void *)Always_26_0};
	xsi_register_didat("work_m_00000000002353001799_3343725887", "isim/test_top_isim_beh.exe.sim/work/m_00000000002353001799_3343725887.didat");
	xsi_register_executes(pe);
}
