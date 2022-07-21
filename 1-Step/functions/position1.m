function pos = position1(q)
% p-parametrization
global d L0;
deltaX1 = q(1);
deltaY1 = q(2);
deltaL1 = q(3);

delta1 = sqrt(deltaX1^2+deltaY1^2);
H1 = [ 1 + deltaX1^2 / delta1^2 * (cos(delta1/d) - 1), deltaX1 * deltaY1 / delta1^2 * (cos(delta1/d) - 1), deltaX1 / delta1 * sin(delta1/d), d * (L0+deltaL1) / delta1^2 * deltaX1 * (1 - cos(delta1/d));
       deltaX1 * deltaY1 / delta1^2 * (cos(delta1/d) - 1), deltaX1^2 / delta1^2 * (1 - cos(delta1/d)) + cos(delta1/d), deltaY1 / delta1 * sin(delta1/d), d * (L0+deltaL1) / delta1^2 * deltaY1 * (1 - cos(delta1/d));
       -deltaX1 / delta1 * sin(delta1/d), -deltaY1 / delta1 * sin(delta1/d), cos(delta1/d), d * (L0+deltaL1) / delta1 * sin(delta1/d);
       0, 0, 0, 1];

pe = [0;0;0;1];
pw = H1 * pe;
pos = pw(1:3);