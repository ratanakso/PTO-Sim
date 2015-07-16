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
%% Plots for PTO-Sim

close all

%% Complex Hydraulic
 
    ptoSim.eff = tot;
    ptoSim.motor.bf=motor.bf;
%     ptoSim.variables.piston = piston;
%     ptoSim.variables.valve = valve;
%     ptoSim.variables.highAccum = highAccum;
%     ptoSim.variables.lowAccum = lowAccum;
%     ptoSim.variables.motor = motor;
%     ptoSim.variables.gen = gen;

    ptoSim.time = output.ptos.time;
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
    ptoSim.volFlowHigh = logsout.getElement('volFlowHigh').Values.Data;
    ptoSim.volFlowLow = logsout.getElement('volFlowLow').Values.Data;
    ptoSim.volFlowM = logsout.getElement('volFlowM').Values.Data;
    ptoSim.Av1 = logsout.getElement('Av1').Values.Data;
    ptoSim.Av2 = logsout.getElement('Av2').Values.Data;
    ptoSim.Av3 = logsout.getElement('Av3').Values.Data;
    ptoSim.Av4 = logsout.getElement('Av4').Values.Data;
    ptoSim.delpApC = logsout.getElement('delpApC').Values.Data;
    ptoSim.delpBpC = logsout.getElement('delpBpC').Values.Data;
    ptoSim.delpDpB = logsout.getElement('delpDpB').Values.Data;
    ptoSim.delpDpA = logsout.getElement('delpDpA').Values.Data;
    ptoSim.angVel = logsout.getElement('angVel').Values.Data;
    ptoSim.torque = logsout.getElement('torque').Values.Data;
    ptoSim.absPower = logsout.getElement('absPower').Values.Data;
    ptoSim.absPower = -ptoSim.absPower;
    ptoSim.genPower = logsout.getElement('genPower').Values.Data;
    ptoSim.torquePU = logsout.getElement('torquePU').Values.Data;  
    ptoSim.omegaPU = logsout.getElement('omegaPU').Values.Data;
    ptoSim.genEff = logsout.getElement('genEff').Values.Data;
    ptoSim.elecPower = logsout.getElement('elecPower').Values.Data;
    ptoSim.fricPower = ptoSim.motor.bf*ptoSim.angVel.^2;
    ptoSim.motorPower = (ptoSim.highPressure - ptoSim.lowPressure).*ptoSim.volFlowM;

    set(0,'DefaultFigureWindowStyle','docked')

    f = figure;
    plot(ptoSim.time,ptoSim.pos,ptoSim.time,ptoSim.vel);
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Position (m), Velocity (m/s)')
    title('Relative Position and Velocity')
    legend('zRel','zDotRel')
    grid on
    % set(f,'PaperPosition',[0 0 3.8 3.0])
    % print(f,'-depsc','zRelzDotRel.eps')

    f = figure;
    plot(ptoSim.time,ptoSim.topPressure/1e6,ptoSim.time,ptoSim.bottomPressure/1e6,ptoSim.time,ptoSim.highPressure/1e6,ptoSim.time,ptoSim.lowPressure/1e6);
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Pressure (MPa)')
    title('Piston Pump and Accumulators Pressures')
    legend('TopPistonPressure','BottomPistonPressure','HighPressure','LowPressure');
    %axis([200 300 5 35]) 
    grid on
    % set(f,'PaperPosition',[0 0 3.8 3.0])
    % print(f,'-depsc','Pressures.eps')

    f = figure;
    plot(ptoSim.time,ptoSim.volFlow1.*(ptoSim.topPressure-ptoSim.highPressure)/1e6+ptoSim.volFlow2.*(ptoSim.bottomPressure-ptoSim.highPressure)/1e6+ptoSim.volFlow3.*(ptoSim.lowPressure-ptoSim.bottomPressure)/1e6+ptoSim.volFlow4.*(ptoSim.lowPressure-ptoSim.topPressure)/1e6)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Power (MW)')
    title('Valves Power')
    grid on

    f = figure;
    plot(ptoSim.time,ptoSim.force/1e6);
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Force (MN)')
    title('PTO Force')
    grid on

    f = figure;
    plot(ptoSim.time,ptoSim.volFlowP,ptoSim.time,ptoSim.volFlowM)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Volumetric Flow (m^3/s)')
    title('Piston and Motor Volumetric Flows')
    legend('Vdot_{piston}','Vdot_{motor}')
    grid on

    f = figure;
    plot(ptoSim.time,ptoSim.volFlow1,ptoSim.time,ptoSim.volFlow2,ptoSim.time,-ptoSim.volFlow3,ptoSim.time,-ptoSim.volFlow4)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Volumetric Flow (m^3/s)')
    title('Valves Volumetric Flows')
    legend('Vdot_1','Vdot_2','Vdot_3','Vdot_4')  
    grid on
 
    f = figure;
    plot(ptoSim.time,ptoSim.Av1,ptoSim.time,ptoSim.Av2,ptoSim.time,-ptoSim.Av3,ptoSim.time,-ptoSim.Av4)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    title('Valve Area')
    legend('Av1','Av2','Av3','Av4')
    grid on

    f = figure;
    subplot(211)
    plot(ptoSim.time,ptoSim.angVel)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Speed (rad/s)')
    title('Generator Speed') 
    grid on
    subplot(212)
    plot(ptoSim.time,ptoSim.torque)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Generator Torque (N-m)')
    title('Generator Torque')
    grid on

    f = figure;
    plot(ptoSim.time,ptoSim.absPower/1e3,ptoSim.time,ptoSim.genPower/1e3,ptoSim.time,ptoSim.elecPower/1e3)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Power (kW)')
    title('Absorbed, Genenator and Electrical Power')
    legend('absPower','genPower','elecPower')
    grid on

    f = figure;
    plot(ptoSim.time,ptoSim.vel,ptoSim.time,ptoSim.force/1e6)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Speed (m/s), Force (MN)')
    title('Relative Velocity and PTO Force')
    legend('zDotRel','F_{pto}')
    grid on

    clear pto tot motor.bf logsout f


