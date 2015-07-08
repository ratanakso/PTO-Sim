%Example of user input MATLAB file for post processing

%Plot heave response for body 1
output.plotResponse(1,3);

%Plot heave response for body 2
output.plotResponse(2,3);

%Plot heave forces for body 1
output.plotForces(1,3);

%Plot pitch moments for body 2
output.plotForces(2,5);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % PTO-Sim Plots
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% time = output.ptos.time;
% pos = logsout.getElement('pos').Values.Data;
% vel = logsout.getElement('vel').Values.Data;
% force = logsout.getElement('force').Values.Data;
% highPressure = logsout.getElement('highPressure').Values.Data;
% lowPressure = logsout.getElement('lowPressure').Values.Data;
% topPressure = logsout.getElement('topPressure').Values.Data; 
% bottomPressure = logsout.getElement('bottomPressure').Values.Data;
% volFlowP = logsout.getElement('volFlowP').Values.Data;
% volFlow1 = logsout.getElement('volFlow1').Values.Data;
% volFlow2 = logsout.getElement('volFlow2').Values.Data;
% volFlow3 = logsout.getElement('volFlow3').Values.Data;
% volFlow4 = logsout.getElement('volFlow4').Values.Data;
% volFlowM = logsout.getElement('volFlowM').Values.Data;
% %volFlowC = logsout.getElement('volFlowC').Values.Data;
% %volC = logsout.getElement('volC').Values.Data;
% %volFlowD = logsout.getElement('volFlowD').Values.Data;
% %volD = logsout.getElement('volD').Values.Data;
% angVel = logsout.getElement('angVel').Values.Data;
% torque = logsout.getElement('torque').Values.Data;
% absPower = logsout.getElement('absPower').Values.Data;
% absPower = -absPower;
% genPower = logsout.getElement('genPower').Values.Data;
% %genPower = -genPower;
% torquePU = logsout.getElement('torquePU').Values.Data;  
% omegaPU = logsout.getElement('omegaPU').Values.Data;
% genEff = logsout.getElement('genEff').Values.Data;
% elecPower = logsout.getElement('elecPower').Values.Data;
% Av1 = logsout.getElement('Av1').Values.Data;
% Av2 = logsout.getElement('Av2').Values.Data;
% Av3 = logsout.getElement('Av3').Values.Data;
% Av4 = logsout.getElement('Av4').Values.Data;
% 
% %highAccumPower = highPressure.*volFlowC;
% %lowAccumPower = lowPressure.*volFlowD;
% fricPower = motor.bf*angVel.^2;
% motorPower = (highPressure - lowPressure).*volFlowM;
% %mechPower = highAccumPower + lowAccumPower + motorPower;
% %valvePower = absPower - mechPower;
% 
% set(0,'DefaultFigureWindowStyle','docked')
% 
% f = figure;
% plot(time,pos,time,vel);
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Position (m), Velocity (m/s)')
% title('Relative Position and Velocity')
% legend('zRel','zDotRel')
% grid on
% % set(f,'PaperPosition',[0 0 3.8 3.0])
% % print(f,'-depsc','zRelzDotRel.eps')
% 
% f = figure;
% plot(time,topPressure/1e6,time,bottomPressure/1e6,time,highPressure/1e6,time,lowPressure/1e6);
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Pressure (MPa)')
% title('Piston Pump and Accumulators Pressures')
% legend('TopPistonPressure','BottomPistonPressure','HighPressure','LowPressure');
% %axis([200 300 5 35]) 
% grid on
% % set(f,'PaperPosition',[0 0 3.8 3.0])
% % print(f,'-depsc','Pressures.eps')
% 
% % f = figure;
% % plot(time,volC,time,volD)
% % set(findall(gcf,'type','axes'),'fontsize',16)
% % xlabel('Time (s)')
% % ylabel('Volume (m^3)')
% % title('Fluid Volume Inside Each Accumulator')
% % legend('High Pressure Accumulator','Low Pressure Accumulator')
% % grid on
% 
% f = figure;
% plot(time,volFlow1.*(topPressure-highPressure)/1e6+volFlow2.*(bottomPressure-highPressure)/1e6+volFlow3.*(lowPressure-bottomPressure)/1e6+volFlow4.*(lowPressure-topPressure)/1e6)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Power (MW)')
% title('Valves Power')
% grid on
% 
% f = figure;
% plot(time,force/1e6);
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Force (MN)')
% title('PTO Force')
% grid on
% 
% f = figure;
% plot(time,volFlowP,time,volFlowM)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Volumetric Flow (m^3/s)')
% title('Piston and Motor Volumetric Flows')
% legend('Vdot_{piston}','Vdot_{motor}')
% grid on
% 
% f = figure;
% plot(time,volFlow1,time,volFlow2,time,-volFlow3,time,-volFlow4)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Volumetric Flow (m^3/s)')
% title('Valves Volumetric Flows')
% legend('Vdot_1','Vdot_2','Vdot_3','Vdot_4')  
% grid on
%  
% f = figure;
% plot(time,Av1,time,Av2,time,-Av3,time,-Av4)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% title('Valve Area')
% legend('Av1','Av2','Av3','Av4')
% grid on
% 
% f = figure;
% subplot(211)
% plot(time,angVel)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Speed (rad/s)')
% title('Generator Speed') 
% grid on
% subplot(212)
% plot(time,torque)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Generator Torque (N-m)')
% title('Generator Torque')
% grid on
% 
% f = figure;
% plot(time,absPower/1e3,time,genPower/1e3,time,elecPower/1e3)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Power (kW)')
% title('Absorbed, Genenator and Electrical Power')
% legend('absPower','genPower','elecPower')
% grid on
% 
% f = figure;
% plot(time,vel,time,force/1e6)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Speed (m/s), Force (MN)')
% title('Relative Velocity and PTO Force')
% legend('zDotRel','F_{pto}')
% grid on

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Direct Drive
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% time = output.ptos.time;
% zRel = logsout.getElement('zRel').Values.Data;
% vel = logsout.getElement('vel').Values.Data;
% force = logsout.getElement('force').Values.Data;
% Vabc = logsout.getElement('Vabc').Values.Data;
% Iabc = logsout.getElement('Iabc').Values.Data;
% absPower = logsout.getElement('absPower').Values.Data;
% elecPower = logsout.getElement('elecPower').Values.Data;
% fricForce = logsout.getElement('fricForce').Values.Data;
% 
% 
% set(0,'DefaultFigureWindowStyle','docked')
% 
% 
% f = figure;
% plot(time,zRel,time,vel)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Position (m), Velocity (m/s)')
% title('Buoy Position and Velocity')
% legend('zRel','zDotRel')
% 
% f = figure;
% subplot(211)
% plot(time,Vabc(:,1))
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Voltage (V)')
% title('A Phase Line to Neutral Load Voltage')
% %axis([392 400 -300 300])
% subplot(212)
% plot(time,Vabc)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Voltage (V)')
% title('3-Phase Line to Neutral Load Voltage')
% legend('V_a','V_b','V_c')
% %axis([392 400 -300 300])
% 
% f = figure;
% subplot(211)
% plot(time,Vabc(:,1))
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Voltage (V)')
% title('A Phase Line to Neutral Load Voltage')
% axis([392 400 -300 300])
% subplot(212)
% plot(time,Vabc)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Voltage (V)')
% title('3-Phase Line to Neutral Load Voltage')
% legend('V_a','V_b','V_c')
% axis([392 400 -300 300])
% 
% f = figure;
% subplot(211)
% plot(time,Iabc(:,1))
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Current (A)')
% title('A Phase Line Current')
% %axis([392 400 -2.5 2.5])
% subplot(212)
% plot(time,Iabc)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (sec)')
% ylabel('Current (A)')
% title('3-Phase Line Current')
% legend('I_a','I_b','I_c')
% %axis([392 400 -2.5 2.5])
% 
% f = figure;
% subplot(211)
% plot(time,Iabc(:,1))
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Current (A)')
% title('A Phase Line Current')
% axis([392 400 -2.5 2.5])
% subplot(212)
% plot(time,Iabc)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (sec)')
% ylabel('Current (A)')
% title('3-Phase Line Current')
% legend('I_a','I_b','I_c')
% axis([392 400 -2.5 2.5])
% 
% f = figure;
% plot(time,force/1e3)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Force (kN)')
% title('PTO Force')
% 
% f = figure;
% plot(time,(force-fricForce)/1e3,time,fricForce/1e3,time,force/1e3)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Force (kN)')
% title('Electromagnetic Force, Friction Force and PTO Force')
% legend('Fem','Ffric','Fpto')
% 
% f = figure;
% plot(time,absPower/1e3,time,elecPower/1e3)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Power (kW)')
% title('Absorbed Power and Electrical Power')
% legend('Pabs','Pelec')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kelley PTO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time = output.ptos.time;
pos = logsout.getElement('pos').Values.Data;
vel = logsout.getElement('vel').Values.Data;
force = logsout.getElement('force').Values.Data;
highPressure = logsout.getElement('highPressure').Values.Data;
lowPressure = logsout.getElement('lowPressure').Values.Data;
topPressure = logsout.getElement('topPressure').Values.Data;
bottomPressure = logsout.getElement('bottomPressure').Values.Data;
volFlow = logsout.getElement('volFlow').Values.Data;
volFlowM = logsout.getElement('volFlowM').Values.Data;
absPower = logsout.getElement('absPower').Values.Data;
genPower = logsout.getElement('genPower').Values.Data;
elecPower = logsout.getElement('elecPower').Values.Data;
angVel = logsout.getElement('angVel').Values.Data;
torque = logsout.getElement('torque').Values.Data;

set(0,'DefaultFigureWindowStyle','docked')

f = figure;
plot(time,pos,time,vel);
set(findall(gcf,'type','axes'),'fontsize',16)
xlabel('Time (s)')
ylabel('Position (m), Velocity (m/s)')
title('Relative Position and Velocity')
legend('Position','Velocity')
grid on

f = figure;
plot(time,force/1e6)
set(findall(gcf,'type','axes'),'fontsize',16)
xlabel('Time (s)')
ylabel('Force (MN)')
title('PTO Force')
grid on

f = figure;
plot(time,force/1e5,time,vel)
set(findall(gcf,'type','axes'),'fontsize',16)
xlabel('Time (s)')
title('PTO Force and Piston Velocity')
legend('force','vel')
grid on

f = figure;
plot(time,topPressure/1e6,time,bottomPressure/1e6)
set(findall(gcf,'type','axes'),'fontsize',16)
xlabel('Time (s)')
ylabel('Pressure (MPa)')
title('Pressure')
legend('topPressure','bottomPressure')
grid on

f = figure;
plot(time,topPressure/1e6,time,bottomPressure/1e6,time,highPressure/1e6,time,lowPressure/1e6)
set(findall(gcf,'type','axes'),'fontsize',16)
xlabel('Time (s)')
ylabel('Pressure (MPa)')
title('Pressure')
legend('topPressure','bottomPressure','highPressure','lowPressure')
grid on

f = figure;
plot(time,volFlow,time,volFlowM)
set(findall(gcf,'type','axes'),'fontsize',16)
xlabel('Time (s)')
ylabel('Volumetric Flow (m^3/s)')
title('Piston and Motor Volumetric Flows')
grid on

f = figure;
subplot(211)
plot(time,angVel)
set(findall(gcf,'type','axes'),'fontsize',16)
xlabel('Time (s)')
ylabel('Speed (rad/s)')
title('Hydraulic Motor Speed')
grid on
subplot(212)
plot(time,torque)
set(findall(gcf,'type','axes'),'fontsize',16)
xlabel('Time (s)')
ylabel('Torque (N-m)')
title('Torque')
grid on

f = figure;
plot(time,absPower/1e3,time,genPower/1e3,time,elecPower/1e3)
set(findall(gcf,'type','axes'),'fontsize',16)
xlabel('Time (s)')
ylabel('Power (kW)')
title('Absorbed, Genenator and Electrical Power')
legend('absPower','genPower','elecPower')
grid on


