clear all;
format long;
load data/3step1te-2.mat;
addpath('functions');
global d L0;

number = length(t);
actualPosition = zeros(number,3);
Error = zeros(number,3);

interval = 10;
figure;
p1 = plot3(xd(1,1:interval:end)/1000, xd(2,1:interval:end)/1000, xd(3,1:interval:end)/1000,'k-','linewidth',2);grid on;
hold on;
p2 =plot3(xa(1,1:interval:end)/1000, xa(2,1:interval:end)/1000, xa(3,1:interval:end)/1000,'-','color',[0.7,0.7,0.7]','linewidth',2); 

legend([p1, p2], 'Desired path','Actual trajectory','Location','best', 'FontName', 'times new Roman','fontsize',22);
hold off;
set(gca,'FontSize',20);
xlabel('X (m)', 'FontName', 'times new Roman','fontsize',22);
ylabel('Y (m)', 'FontName', 'times new Roman','fontsize',22);


Error = (xd - xa)/1000;

figure;
p1 = plot(t(1:interval:end),Error(1,1:interval:end),'-.', 'linewidth', 3);
hold on;
p2 = plot(t(1:interval:end),Error(2,1:interval:end)','--', 'linewidth', 3);
p3 = plot(t(1:interval:end),Error(3,1:interval:end)','-', 'linewidth', 3);
grid on; hold off;
RMSE = round(sqrt(sum(Error(1,:).^2 + Error(2,:).^2 + Error(3,:).^2)/number), 8);
annotation = strcat('RMSE=',mat2str(RMSE),' m');
text(5, 0.8, annotation, 'fontsize', 20,'FontName', 'times new Roman');
legend('$\gamma_x$','$\gamma_y$','$\gamma_z$','interpreter','latex','fontsize',22);
set(gca,'FontSize',22);
xlabel('$t$ (s)', 'FontName', 'times new Roman','fontsize',22,'interpreter','latex');
ylabel('Error (m)', 'FontName', 'times new Roman','fontsize',22);


figure;
plot(t(1:interval:end), q(1,1:interval:end)/1000, 'r-', 'linewidth', 3);
hold on;
plot(t(1:interval:end), q(2,1:interval:end)/1000, 'b--', 'linewidth', 3);
plot(t(1:interval:end), q(3,1:interval:end)/1000, 'g:', 'linewidth', 3);
hold off;
grid on;
set(gca,'FontSize',22);
xlabel('$t$ (s)', 'FontName', 'times new Roman','fontsize',22,'interpreter','latex');
ylabel('Actuation input (m)', 'FontName', 'times new Roman','fontsize',22);
legend('$l_1$', '$l_2$', '$l_3$','interpreter','latex','fontsize',22,'NumColumns',3);
