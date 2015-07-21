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
    plot(ptoSim.time,ptoSim.pos,ptoSim.time,ptoSim.vel);
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Position (m), Velocity (m/s)')
    title('Relative Position and Velocity')
    legend('Position','Velocity')
    grid on

    f = figure;
    plot(ptoSim.time,ptoSim.force/1e6)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Force (MN)')
    title('PTO Force')
    grid on

    f = figure;
    plot(ptoSim.time,ptoSim.force/1e5,ptoSim.time,ptoSim.vel)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    title('PTO Force and Piston Velocity')
    legend('force','vel')
    grid on

    f = figure;
    plot(ptoSim.time,ptoSim.topPressure/1e6,ptoSim.time,ptoSim.bottomPressure/1e6)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Pressure (MPa)')
    title('Pressure')
    legend('topPressure','bottomPressure')
    grid on

    f = figure;
    plot(ptoSim.time,ptoSim.topPressure/1e6,ptoSim.time,ptoSim.bottomPressure/1e6,ptoSim.time,ptoSim.highPressure/1e6,ptoSim.time,ptoSim.lowPressure/1e6)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Pressure (MPa)')
    title('Pressure')
    legend('topPressure','bottomPressure','highPressure','lowPressure')
    grid on

    f = figure;
    plot(ptoSim.time,ptoSim.volFlow,ptoSim.time,ptoSim.volFlowM)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Volumetric Flow (m^3/s)')
    title('Piston and Motor Volumetric Flows')
    grid on

    f = figure;
    subplot(211)
    plot(ptoSim.time,ptoSim.angVel)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Speed (rad/s)')
    title('Hydraulic Motor Speed')
    grid on
    subplot(212)
    plot(ptoSim.time,ptoSim.torque)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Torque (N-m)')
    title('Torque')
    grid on

    f = figure;
    plot(ptoSim.time,ptoSim.absPower/1e3,ptoSim.time,ptoSim.genPower/1e3,ptoSim.time,ptoSim.elecPower/1e3)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Power (kW)')
    title('Absorbed, Genenator and Electrical Power')
    legend('absPower','genPower','elecPower')
    grid on
    
    clear pto piston valve highAccum lowAccum motor gen tot logsout f ptoSim


