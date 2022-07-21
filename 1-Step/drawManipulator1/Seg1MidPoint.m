function point = Seg1MidPoint(q, p)
global d L0;

deltaX1=q(1)/2; deltaY1=q(2)/2; deltaL0=q(3)/2;

delta1 = sqrt(deltaX1^2+deltaY1^2);

H1 = [ 1 + deltaX1^2 / delta1^2 * (cos(delta1/d) - 1), deltaX1 * deltaY1 / delta1^2 * (cos(delta1/d) - 1), deltaX1 / delta1 * sin(delta1/d), d * (L0/2+deltaL0) / delta1^2 * deltaX1 * (1 - cos(delta1/d));
       deltaX1 * deltaY1 / delta1^2 * (cos(delta1/d) - 1), deltaX1^2 / delta1^2 * (1 - cos(delta1/d)) + cos(delta1/d), deltaY1 / delta1 * sin(delta1/d), d * (L0/2+deltaL0) / delta1^2 * deltaY1 * (1 - cos(delta1/d));
       -deltaX1 / delta1 * sin(delta1/d), -deltaY1 / delta1 * sin(delta1/d), cos(delta1/d), d * (L0/2+deltaL0) / delta1 * sin(delta1/d);
       0, 0, 0, 1];
P1 = H1*[p;1];

point = P1(1:3);
end