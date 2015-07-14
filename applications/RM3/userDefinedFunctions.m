%Example of user input MATLAB file for post processing

% %Plot heave response for body 1
% output.plotResponse(1,3);
% 
% %Plot heave response for body 2
% output.plotResponse(2,3);
% 
% %Plot heave forces for body 1
% output.plotForces(1,3);
% 
% %Plot pitch moments for body 2
% output.plotForces(2,5);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PTO-Sim Plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time = output.ptos.time;
ptoSim.pos = logsout.getElement('pos').Values.Data;
ptoSim.vel = logsout.getElement('vel').Values.Data;
ptoSim.force = logsout.getElement('force').Values.Data;
ptoSim.highPressure = logsout.getElement('highPressure').Values.Data;
ptoSim.lowPressure = logsout.getElement('lowPressure').Values.Data;
ptoSim.topPressure = logsout.getElement('topPressure').Values.Data; 
ptoSim.bottomPressure = logsout.getElement('bottomPressure').Values.Data;
ptoSim.volFlowP = logsout.getElement('volFlowP').Values.Data;
ptoSim.volFlow1 = logsout.getElement('volFlow1').Values.Data;
ptoSim.volFlow2 = logsout.getElement('volFlow2').Values.Data;
ptoSim.volFlow3 = logsout.getElement('volFlow3').Values.Data;
ptoSim.volFlow4 = logsout.getElement('volFlow4').Values.Data;
ptoSim.volFlowTop = logsout.getElement('volFlowTop').Values.Data;
ptoSim.volFlowBottom = logsout.getElement('volFlowBottom').Values.Data;
ptoSim.volFlowM = logsout.getElement('volFlowM').Values.Data;
%volFlowC = logsout.getElement('volFlowC').Values.Data;
%volC = logsout.getElement('volC').Values.Data;
%volFlowD = logsout.getElement('volFlowD').Values.Data;
%volD = logsout.getElement('volD').Values.Data;
ptoSim.angVel = logsout.getElement('angVel').Values.Data;
ptoSim.torque = logsout.getElement('torque').Values.Data;
ptoSim.absPower = logsout.getElement('absPower').Values.Data;
ptoSim.absPower = -ptoSim.absPower;
ptoSim.genPower = logsout.getElement('genPower').Values.Data;
%genPower = -genPower;
ptoSim.torquePU = logsout.getElement('torquePU').Values.Data;  
ptoSim.omegaPU = logsout.getElement('omegaPU').Values.Data;
ptoSim.genEff = logsout.getElement('genEff').Values.Data;
ptoSim.elecPower = logsout.getElement('elecPower').Values.Data;
ptoSim.Av1 = logsout.getElement('Av1').Values.Data;
ptoSim.Av2 = logsout.getElement('Av2').Values.Data;
ptoSim.Av3 = logsout.getElement('Av3').Values.Data;
ptoSim.Av4 = logsout.getElement('Av4').Values.Data;
ptoSim.delpApC = logsout.getElement('delpApC').Values.Data;
ptoSim.delpBpC = logsout.getElement('delpBpC').Values.Data;
ptoSim.delpDpB = logsout.getElement('delpDpB').Values.Data;
ptoSim.delpDpA = logsout.getElement('delpDpA').Values.Data;
ptoSim.motor.bf=motor.bf;
clear motor.bf

%highAccumPower = highPressure.*volFlowC;
%lowAccumPower = lowPressure.*volFlowD;
ptoSim.fricPower = ptoSim.motor.bf*ptoSim.angVel.^2;
ptoSim.motorPower = (ptoSim.highPressure - ptoSim.lowPressure).*ptoSim.volFlowM;
%mechPower = highAccumPower + lowAccumPower + motorPower;
%valvePower = absPower - mechPower;

clear logsout

set(0,'DefaultFigureWindowStyle','docked')

f = figure;
plot(time,ptoSim.pos,time,ptoSim.vel);
set(findall(gcf,'type','axes'),'fontsize',16)
xlabel('Time (s)')
ylabel('Position (m), Velocity (m/s)')
title('Relative Position and Velocity')
legend('zRel','zDotRel')
grid on
% set(f,'PaperPosition',[0 0 3.8 3.0])
% print(f,'-depsc','zRelzDotRel.eps')

f = figure;
plot(time,ptoSim.topPressure/1e6,time,ptoSim.bottomPressure/1e6,time,ptoSim.highPressure/1e6,time,ptoSim.lowPressure/1e6);
set(findall(gcf,'type','axes'),'fontsize',16)
xlabel('Time (s)')
ylabel('Pressure (MPa)')
title('Piston Pump and Accumulators Pressures')
legend('TopPistonPressure','BottomPistonPressure','HighPressure','LowPressure');
%axis([200 300 5 35]) 
grid on
% set(f,'PaperPosition',[0 0 3.8 3.0])
% print(f,'-depsc','Pressures.eps')

% f = figure;
% plot(time,volC,time,volD)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Volume (m^3)')
% title('Fluid Volume Inside Each Accumulator')
% legend('High Pressure Accumulator','Low Pressure Accumulator')
% grid on

f = figure;
plot(time,ptoSim.volFlow1.*(ptoSim.topPressure-ptoSim.highPressure)/1e6+ptoSim.volFlow2.*(ptoSim.bottomPressure-ptoSim.highPressure)/1e6+ptoSim.volFlow3.*(ptoSim.lowPressure-ptoSim.bottomPressure)/1e6+ptoSim.volFlow4.*(ptoSim.lowPressure-ptoSim.topPressure)/1e6)
set(findall(gcf,'type','axes'),'fontsize',16)
xlabel('Time (s)')
ylabel('Power (MW)')
title('Valves Power')
grid on

f = figure;
plot(time,ptoSim.force/1e6);
set(findall(gcf,'type','axes'),'fontsize',16)
xlabel('Time (s)')
ylabel('Force (MN)')
title('PTO Force')
grid on

f = figure;
plot(time,ptoSim.volFlowP,time,ptoSim.volFlowM)
set(findall(gcf,'type','axes'),'fontsize',16)
xlabel('Time (s)')
ylabel('Volumetric Flow (m^3/s)')
title('Piston and Motor Volumetric Flows')
legend('Vdot_{piston}','Vdot_{motor}')
grid on

f = figure;
plot(time,ptoSim.volFlow1,time,ptoSim.volFlow2,time,-ptoSim.volFlow3,time,-ptoSim.volFlow4)
set(findall(gcf,'type','axes'),'fontsize',16)
xlabel('Time (s)')
ylabel('Volumetric Flow (m^3/s)')
title('Valves Volumetric Flows')
legend('Vdot_1','Vdot_2','Vdot_3','Vdot_4')  
grid on
 
f = figure;
plot(time,ptoSim.Av1,time,ptoSim.Av2,time,-ptoSim.Av3,time,-ptoSim.Av4)
set(findall(gcf,'type','axes'),'fontsize',16)
xlabel('Time (s)')
title('Valve Area')
legend('Av1','Av2','Av3','Av4')
grid on

f = figure;
subplot(211)
plot(time,ptoSim.angVel)
set(findall(gcf,'type','axes'),'fontsize',16)
xlabel('Time (s)')
ylabel('Speed (rad/s)')
title('Generator Speed') 
grid on
subplot(212)
plot(time,ptoSim.torque)
set(findall(gcf,'type','axes'),'fontsize',16)
xlabel('Time (s)')
ylabel('Generator Torque (N-m)')
title('Generator Torque')
grid on

f = figure;
plot(time,ptoSim.absPower/1e3,time,ptoSim.genPower/1e3,time,ptoSim.elecPower/1e3)
set(findall(gcf,'type','axes'),'fontsize',16)
xlabel('Time (s)')
ylabel('Power (kW)')
title('Absorbed, Genenator and Electrical Power')
legend('absPower','genPower','elecPower')
grid on

f = figure;
plot(time,ptoSim.vel,time,ptoSim.force/1e6)
set(findall(gcf,'type','axes'),'fontsize',16)
xlabel('Time (s)')
ylabel('Speed (m/s), Force (MN)')
title('Relative Velocity and PTO Force')
legend('zDotRel','F_{pto}')
grid on

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

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Kelley PTO
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% time = output.ptos.time;
% pos = logsout.getElement('pos').Values.Data;
% vel = logsout.getElement('vel').Values.Data;
% force = logsout.getElement('force').Values.Data;
% highPressure = logsout.getElement('highPressure').Values.Data;
% lowPressure = logsout.getElement('lowPressure').Values.Data;
% topPressure = logsout.getElement('topPressure').Values.Data;
% bottomPressure = logsout.getElement('bottomPressure').Values.Data;
% volFlow = logsout.getElement('volFlow').Values.Data;
% volFlowM = logsout.getElement('volFlowM').Values.Data;
% absPower = logsout.getElement('absPower').Values.Data;
% genPower = logsout.getElement('genPower').Values.Data;
% elecPower = logsout.getElement('elecPower').Values.Data;
% angVel = logsout.getElement('angVel').Values.Data;
% torque = logsout.getElement('torque').Values.Data;
% 
% set(0,'DefaultFigureWindowStyle','docked')
% 
% f = figure;
% plot(time,pos,time,vel);
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Position (m), Velocity (m/s)')
% title('Relative Position and Velocity')
% legend('Position','Velocity')
% grid on
% 
% f = figure;
% plot(time,force/1e6)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Force (MN)')
% title('PTO Force')
% grid on
% 
% f = figure;
% plot(time,force/1e5,time,vel)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% title('PTO Force and Piston Velocity')
% legend('force','vel')
% grid on
% 
% f = figure;
% plot(time,topPressure/1e6,time,bottomPressure/1e6)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Pressure (MPa)')
% title('Pressure')
% legend('topPressure','bottomPressure')
% grid on
% 
% f = figure;
% plot(time,topPressure/1e6,time,bottomPressure/1e6,time,highPressure/1e6,time,lowPressure/1e6)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Pressure (MPa)')
% title('Pressure')
% legend('topPressure','bottomPressure','highPressure','lowPressure')
% grid on
% 
% f = figure;
% plot(time,volFlow,time,volFlowM)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Volumetric Flow (m^3/s)')
% title('Piston and Motor Volumetric Flows')
% grid on
% 
% f = figure;
% subplot(211)
% plot(time,angVel)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Speed (rad/s)')
% title('Hydraulic Motor Speed')
% grid on
% subplot(212)
% plot(time,torque)
% set(findall(gcf,'type','axes'),'fontsize',16)
% xlabel('Time (s)')
% ylabel('Torque (N-m)')
% title('Torque')
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


