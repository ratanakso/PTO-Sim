%% Housekeeping
close all

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
%% Plots for a simple hydraulic PTO-Sim
 
    ptoSim.time = output.ptos.time;
    
    set(0,'DefaultFigureWindowStyle','docked')
    
    f = figure;
    plot(ptoSim.time,ptoSim.angPosition,ptoSim.time,ptoSim.angVelocity);
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Angular Position (rad), Angular Velocity (rad/s)')
    title('Flap Angular Position and Velocity')
    legend('Position','Velocity')
    grid on    
    
    f = figure;
    plot(ptoSim.time,ptoSim.ptoTorque/1e6,ptoSim.time,ptoSim.force/1e6)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Torque (MN-m), Force (MN)')
    title('PTO Torque and Force')
    legend('Torque','Force')
    grid on
        
    f = figure;
    plot(ptoSim.time,ptoSim.pos,ptoSim.time,ptoSim.vel);
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Position (m), Velocity (m/s)')
    title('Hydraulic Position and Velocity')
    legend('Position','Velocity')
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
    title('Hydraulic Velocity and Force')
    legend('Velocity','F_{pto}')
    grid on

    clear tot motionmech piston valve accum motor gen logsout f ptoSim 



