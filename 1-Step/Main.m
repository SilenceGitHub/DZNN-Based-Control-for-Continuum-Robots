close all;
clear; 
addpath('functions');
global zeta eta iota Td d L0 

zeta = 1; % Convergence rate
eta = 1;
iota = 0.04 *1000; % Scale of the desired path, unit: mm
Td = 20; % Duration of the task
step = 0.01;

d = 0.040 *1000; % Parameter of the continuum robot
L0 = 0.100 *1000;

r = 3; % Number of input;
s = 3; % Number of task space dimension

% Initial value of actuation signal
q0 = [0.03; 0; 0;] *1000;

JHat0 = zeros(s, r);
incrementalAmount = 0.001 *1000;
for j = 1:r
    q1 = q0;
    q2 = q0;
    q2(j) = q2(j) + incrementalAmount;
    pos1 = position1(q1);
    pos2 = position1(q2);
    deltaPos = pos2 - pos1;
    JHat0(:,j) = deltaPos / incrementalAmount;
end
initPos = pos1;
% Desired path
t = 0:step:Td;
xdx = iota*cos(2*pi*(sin(0.5*pi*t/Td)).^2)-iota+initPos(1);
xdy = cos(pi/6)*iota*sin(2*pi*(sin(0.5*pi*t/Td)).^2)+initPos(2);
xdz = sin(pi/6)*iota*sin(2*pi*(sin(0.5*pi*t/Td)).^2)+initPos(3);
dotx = -(2*iota*pi^2*cos((pi*t)/(2*Td)).*sin((pi*t)/(2*Td)).*sin(2*pi*sin((pi*t)/(2*Td)).^2))/Td;
doty = (3^(1/2)*iota*pi^2*cos((pi*t)/(2*Td)).*sin((pi*t)/(2*Td)).*cos(2*pi*sin((pi*t)/(2*Td)).^2))/Td;
dotz = (iota*pi^2*cos((pi*t)/(2*Td)).*sin((pi*t)/(2*Td)).*cos(2*pi*sin((pi*t)/(2*Td)).^2))/Td;
xd = [xdx; xdy; xdz] ;
dxd = [dotx; doty; dotz];

numSteps = round(Td/step) + 1;
JHat = zeros(s,r,numSteps);
dJHat = zeros(s,r,numSteps);
xa = zeros(s, numSteps); % Actual path
dxa = zeros(s, numSteps); % Actual velocity
ddxa = zeros(s, numSteps); % Actual acceleration
q = zeros(r, numSteps); % actuator state
dq = zeros(r, numSteps); % Actuator change rate
ddq = zeros(r, numSteps); % Actuator change rate

JHat(:,:,1) = JHat0;
xa(:,1) = initPos;
q(:,1) = q0;


for idx = 1:numSteps-1
    xa(:,idx) = position1(q(:,idx));
    dq(:,idx) = pinv(JHat(:,:,idx)) * (dxd(:,idx) + eta * (xd(:,idx) - xa(:,idx)));
    
    if idx == 1
        ddq(:,idx) = zeros(r,1);
    else
        ddq(:,idx) = (dq(:,idx) - dq(:,idx-1)) / step;
    end
    
    % simulate the robot
    [J, DJ] = Jacobian1(q(:,idx), dq(:,idx));
    dxa(:,idx) = J*dq(:,idx); % actual end-effector velocity
    ddxa(:,idx) = DJ*dq(:,idx) + J*ddq(:,idx); % actual end-effector acceleration
    
    dJHat(:,:,idx) = (ddxa(:,idx) - JHat(:,:,idx)*ddq(:,idx) + zeta*(dxa(:,idx) - JHat(:,:,idx)*dq(:,idx))) * pinv(dq(:,idx));
    
 
    q(:,idx+1) = q(:,idx) + step * dq(:,idx);
    JHat(:,:,idx+1) = JHat(:,:,idx) + step*dJHat(:,:,idx);

    idx
end
xa(:,end) = position1(q(:,end));


save (['data/1step',num2str(eta),'te-2'], 't', 'zeta', 'eta', 'iota', 'Td', 'd','L0','step','initPos','q','dq','JHat','xd','xa');