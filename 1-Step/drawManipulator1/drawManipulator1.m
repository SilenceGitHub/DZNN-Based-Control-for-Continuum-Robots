function drawManipulator1(q, color)
global d L0

p1 = [0, 0, 0];
p2 = calculateP2(q)';
p3 = calculateP3(q)';


actuator1 = [d;0;0];
actuator2 = [-d;0;0];
actuator3 = [0;d;0];
actuator4 = [0;-d;0];

% base cirlce
baseCircleP1 = actuator1;
baseCircleP2 = actuator3;
baseCircleP3 = actuator2;
baseCircleP4 = actuator4;
% baseCirclePoints = [baseCircleP1'; baseCircleP2'; baseCircleP3'];
% arcPlot(baseCirclePoints, 1, color);
baseCirclePoints = [baseCircleP1'; baseCircleP2'; baseCircleP3'; baseCircleP4'];
fill3(baseCirclePoints(:,1),baseCirclePoints(:,2),baseCirclePoints(:,3),[0.5,0.5,0.5]);

% segment 1
% the top point of each actuator
Seg1Actu1TopPoint = Seg1TopPoint(q,actuator1);
Seg1Actu2TopPoint = Seg1TopPoint(q,actuator2);
Seg1Actu3TopPoint = Seg1TopPoint(q,actuator3);
Seg1Actu4TopPoint = Seg1TopPoint(q,actuator4);
% Seg1CirclePoints = [Seg1Actu1TopPoint'; Seg1Actu3TopPoint'; Seg1Actu2TopPoint'];
% segment 1 circle
% arcPlot(Seg1CirclePoints, 1, color);
Seg1CirclePoints = [Seg1Actu1TopPoint'; Seg1Actu3TopPoint'; Seg1Actu2TopPoint'; Seg1Actu4TopPoint'];
fill3(Seg1CirclePoints(:,1),Seg1CirclePoints(:,2),Seg1CirclePoints(:,3),[0.5,0.5,0.5]);

% the midpoint of each actuator
Seg1Actu1MidPoint = Seg1MidPoint(q,actuator1);
Seg1Actu2MidPoint = Seg1MidPoint(q,actuator2);
Seg1Actu3MidPoint = Seg1MidPoint(q,actuator3);
Seg1Actu4MidPoint = Seg1MidPoint(q,actuator4);
%segment 1 actuator1
Seg1Actu1Points = [actuator1'; Seg1Actu1MidPoint'; Seg1Actu1TopPoint'];
arcPlot(Seg1Actu1Points, 0, color);
%segment 1 actuator2
Seg1Actu2Points = [actuator2'; Seg1Actu2MidPoint'; Seg1Actu2TopPoint'];
arcPlot(Seg1Actu2Points, 0, color);
%segment 1 actuator3
Seg1Actu3Points = [actuator3'; Seg1Actu3MidPoint'; Seg1Actu3TopPoint'];
arcPlot(Seg1Actu3Points, 0, color);
%segment 1 actuator3
Seg1Actu4Points = [actuator4'; Seg1Actu4MidPoint'; Seg1Actu4TopPoint'];
arcPlot(Seg1Actu4Points, 0, color);

% % plot3(actuator1(1), actuator1(2), actuator1(3),'b*');
% plot3(Seg1Actu1MidPoint(1), Seg1Actu1MidPoint(2), Seg1Actu1MidPoint(3),'b*');
% % plot3(Seg1Actu1TopPoint(1), Seg1Actu1TopPoint(2), Seg1Actu1TopPoint(3),'b*');

scatter3(p3(1), p3(2), p3(3),'k','filled');
hold on;
end