function [J, DJ] = Jacobian1(q, dq)

load data/JacobianData1_1s.mat
load data/JacobianData2_1s.mat


syms q1 q2 q3

q1 = q(1);q2=q(2);q3=q(3);

DJ11 = [eval(DJ11_1Char),eval(DJ11_2Char), eval(DJ11_3Char)]*dq;
DJ12 = [eval(DJ12_1Char),eval(DJ12_2Char), eval(DJ12_3Char)]*dq;
DJ13 = [eval(DJ13_1Char),eval(DJ13_2Char), eval(DJ13_3Char)]*dq;
DJ21 = [eval(DJ21_1Char),eval(DJ21_2Char), eval(DJ21_3Char)]*dq;
DJ22 = [eval(DJ22_1Char),eval(DJ22_2Char), eval(DJ22_3Char)]*dq;
DJ23 = [eval(DJ23_1Char),eval(DJ23_2Char), eval(DJ23_3Char)]*dq;
DJ31 = [eval(DJ31_1Char),eval(DJ31_2Char), eval(DJ31_3Char)]*dq;
DJ32 = [eval(DJ32_1Char),eval(DJ32_2Char), eval(DJ32_3Char)]*dq;
DJ33 = [eval(DJ33_1Char),eval(DJ33_2Char), eval(DJ33_3Char)]*dq;


dxdq = [eval(dxdq1Char), eval(dxdq2Char), eval(dxdq3Char)];
dydq = [eval(dydq1Char), eval(dydq2Char), eval(dydq3Char)];
dzdq = [eval(dzdq1Char), eval(dzdq2Char), eval(dzdq3Char)];

J = [dxdq; dydq; dzdq];
DJ = [DJ11, DJ12, DJ13;
      DJ21, DJ22, DJ23;
      DJ31, DJ32, DJ33];