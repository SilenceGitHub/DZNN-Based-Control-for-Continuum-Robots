function arcPlot(pos,arcFlag,colour)

hold on
p1=pos(1,:);
p2=pos(2,:);
p3=pos(3,:);

p1p2=p2-p1;
u1=p1p2/sum(p1p2.^2);

p2p3=p3-p2;
u2=unitVec(p2p3);

normal=cross(p1p2,p2p3);
normal=unitVec(normal);


per2=cross(normal,u2);
per2=unitVec(per2);

mid1=(p1+p2)/2;
mid2=(p2+p3)/2;
dis2=sqrt(sum(p2p3.^2));
L=(vecDot(mid1,u1)-vecDot(mid2,u1))/vecDot(per2,u1);

arc_R=sqrt(L^2+1.0/4*dis2^2);

C=mid2+L*per2;


    vec1=p1-C;
    vec1=unitVec(vec1);
    vec2=p3-C;
    vec2=unitVec(vec2);
    theta=vecDot(vec1,vec2);
    normal2=cross(vec1,vec2);
if(arcFlag==0)
    theta=acos(theta);
    if(sqrt(sum((normal-normal2).^2))>1.0e-5)
%         theta=2*pi-theta;
    end
else
    theta=2*pi;
end

vx=[1,0,0];
vy=[0,1,0];
vz=[0,0,1];
v1=vec1;
v3=normal;
v2=cross(v3,v1);
v2=unitVec(v2);

r11=vecDot(v1,vx);r12=vecDot(v2,vx);r13=vecDot(v3,vx);
r21=vecDot(v1,vy);r22=vecDot(v2,vy);r23=vecDot(v3,vy);
r31=vecDot(v1,vz);r32=vecDot(v2,vz);r33=vecDot(v3,vz);
Tr=[r11,r12,r13,0;
    r21,r22,r23,0;
    r31,r32,r33,0;
    0,0,0,1];
Tt=[1,0,0,C(1);
    0,1,0,C(2);
    0,0,1,C(3);
    0,0,0,1];

t=0:(theta)/100:theta;
x1=arc_R*cos(t);
y1=arc_R*sin(t);
z1=t*0;
pt=[x1;y1;z1;ones(size(x1))];

pt=Tt*Tr*pt;

if colour == 1
    color = [0.25, 0.41, 0.88];
elseif colour ==2
    color = [0.20, 0.63, 0.79];
elseif colour ==3
    color = [0.7, 0.7, 0.7];
elseif colour ==4
    color = [0.6, 0.6, 0.6];
elseif colour ==5
    color = [0.5, 0.5, 0.5];
elseif colour ==6
    color = [0.4, 0.4, 0.4];
elseif colour ==7
    color = [0, 0.4470, 0.7410];
elseif colour ==8
    color = [0.2, 0.2, 0.2];
elseif colour ==9
    color = [0.1, 0.1, 0.1];
elseif colour ==10
    color = [0, 0, 0];
end
plot3(pt(1,:),pt(2,:),pt(3,:),'color',color, 'linewidth',3);
if arcFlag ==1
    fill3(pt(1,:),pt(2,:),pt(3,:),[0.5,0.5,0.5]);
end

end