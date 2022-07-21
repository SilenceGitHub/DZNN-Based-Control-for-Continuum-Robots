clear all;
format long;
load data/3step1te-2.mat;
addpath('functions','drawManipulator1');
global d L0;

inteval = 1;
number = fix(length(t)/inteval);
pos = zeros(number,3);
Error = zeros(number,3);
index = 0;

xMax = 70; xMin = -60; yMax = 70; yMin = -60; zMin = 0; zMax = 140;
figure;
set(gcf, 'position', [300,300,400,400]);
j = 1;

i = 2001;
color = 7;
scatter3(0,0,0,'k','filled');hold on;
drawManipulator1(q(:,i),color);
h1 = plot3(xd(1, 1:10:number), xd(2, 1:10:number), xd(3, 1:10:number),'-r','linewidth',1); grid on;
h2 = plot3(xa(1, 1:40:i)', xa(2, 1:40:i)', xa(3, 1:40:i)','-.o','color',[0, 0.4470, 0.7410],'linewidth',1);
if i ==1
    legend([h1, h2],'Desired path','Actual trajectory','Location','best','fontsize', 22, 'FontName', 'times new Roman', 'NumColumns',2);
end
axis equal;
hold off;


set(gca,'FontSize',22);
axis([xMin xMax yMin yMax zMin zMax]);
set(gca, 'xtick', xMin:40:xMax);
set(gca, 'ytick', yMin:40:yMax);
set(gca, 'ztick', zMin:40:zMax);
xlabel('X (mm)','FontName', 'times new Roman','fontsize', 22);
ylabel('Y (mm)','FontName', 'times new Roman','fontsize', 22);
zlabel('Z (mm)','FontName', 'times new Roman','fontsize', 22);


