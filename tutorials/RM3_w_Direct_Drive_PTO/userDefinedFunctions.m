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
%% Plots for a direct drive PTO-Sim
    
    ptoSim.time = output.ptos.time;

    set(0,'DefaultFigureWindowStyle','docked')


    f = figure;
    plot(ptoSim.time,ptoSim.pos,ptoSim.time,ptoSim.vel)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Position (m), Velocity (m/s)')
    title('Buoy Position and Velocity')
    legend('zRel','zDotRel')

    f = figure;
    subplot(211)
    plot(ptoSim.time,ptoSim.Vabc(:,1))
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Voltage (V)')
    title('A Phase Line to Neutral Load Voltage')
    %axis([392 400 -300 300])
    subplot(212)
    plot(ptoSim.time,ptoSim.Vabc)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Voltage (V)')
    title('3-Phase Line to Neutral Load Voltage')
    legend('V_a','V_b','V_c')
    %axis([392 400 -300 300])

    f = figure;
    subplot(211)
    plot(ptoSim.time,ptoSim.Vabc(:,1))
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Voltage (V)')
    title('A Phase Line to Neutral Load Voltage')
    axis([392 400 -300 300])
    subplot(212)
    plot(ptoSim.time,ptoSim.Vabc)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Voltage (V)')
    title('3-Phase Line to Neutral Load Voltage')
    legend('V_a','V_b','V_c')
    axis([392 400 -300 300])

    f = figure;
    subplot(211)
    plot(ptoSim.time,ptoSim.Iabc(:,1))
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Current (A)')
    title('A Phase Line Current')
    %axis([392 400 -2.5 2.5])
    subplot(212)
    plot(ptoSim.time,ptoSim.Iabc)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (sec)')
    ylabel('Current (A)')
    title('3-Phase Line Current')
    legend('I_a','I_b','I_c')
    %axis([392 400 -2.5 2.5])

    f = figure;
    subplot(211)
    plot(ptoSim.time,ptoSim.Iabc(:,1))
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Current (A)')
    title('A Phase Line Current')
    axis([392 400 -2.5 2.5])
    subplot(212)
    plot(ptoSim.time,ptoSim.Iabc)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (sec)')
    ylabel('Current (A)')
    title('3-Phase Line Current')
    legend('I_a','I_b','I_c')
    axis([392 400 -2.5 2.5])

    f = figure;
    plot(ptoSim.time,ptoSim.force/1e3)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Force (kN)')
    title('PTO Force')

    f = figure;
    plot(ptoSim.time,(ptoSim.force-ptoSim.fricForce)/1e3,ptoSim.time,ptoSim.fricForce/1e3,ptoSim.time,ptoSim.force/1e3)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Force (kN)')
    title('Electromagnetic Force, Friction Force and PTO Force')
    legend('Fem','Ffric','Fpto')

    f = figure;
    plot(ptoSim.time,ptoSim.absPower/1e3,ptoSim.time,ptoSim.elecPower/1e3)
    set(findall(gcf,'type','axes'),'fontsize',16)
    xlabel('Time (s)')
    ylabel('Power (kW)')
    title('Absorbed Power and Electrical Power')
    legend('Pabs','Pelec')

    clear machine ddload logsout f ptoSim fluidOption noncompressFluid compressFluid









 
