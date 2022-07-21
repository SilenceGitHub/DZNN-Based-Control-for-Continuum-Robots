function point = calculateP3(q)
global d L0;
deltaX1=q(1); deltaY1=q(2); deltaL1=q(3); 

delta1 = sqrt(deltaX1^2+deltaY1^2);
x = d * (L0+deltaL1) / delta1^2 * deltaX1 * (1 - cos(delta1/d));
y = d * (L0+deltaL1) / delta1^2 * deltaY1 * (1 - cos(delta1/d));
z = d * (L0+deltaL1) / delta1 * sin(delta1/d);
point = [x; y; z];
end