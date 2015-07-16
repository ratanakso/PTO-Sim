%% Complex Hydraulic
    
   % Valve

%     valve.Cd = 0.61;                          % Discharge coefficient
%     valve.Amax = 0.002;                       % Maximum valve area [m^2] for 8 and 14 seconds wave
%     valve.Amin = 1e-8;%1e-8;                        % Minimum valve area [m^2]
%     valve.pMax = 1.5e6;%2e6;                       % Maximum area pressure [Pa] 
%     valve.pMin = 0*0.75*valve.pMax;                                                    
%     valve.rho = 850;                          % Hydraulic fluid density [kg/m^2]
%     valve.k1 = 1;%200;
%     valve.k2 = atanh((valve.Amin-(valve.Amax-valve.Amin)/2)*...
%             2/(valve.Amax - valve.Amin))*...
%             1/(valve.pMin-(valve.pMax + valve.pMin)/2);   
    valve = valveClass();
        
    % Low Pressure Accumulator D 
                                                      
%     lowAccum.VI0 = 6;                                    % Vol. Accumulator D [m^3]
%     lowAccum.pIrated = 16e6;                             % Rated working pressure
%     lowAccum.pIupper_limit = (4/3)*lowAccum.pIrated;              % Uppder working pressure   
%     lowAccum.pIlower_limit = (0.5)*lowAccum.pIupper_limit;        % Lower workig pressure
%     lowAccum.pIprecharge = 0.9*lowAccum.pIlower_limit;            % Precharge pressure
%     lowAccum.VImax = lowAccum.VI0*(1-(lowAccum.pIprecharge/lowAccum.pIupper_limit)^(1/1.4));  
%     lowAccum.VImin = lowAccum.VI0*(1-(lowAccum.pIprecharge/lowAccum.pIlower_limit)^(1/1.4));
%     lowAccum.VIeq = lowAccum.VImax;
%     lowAccum.pIeq = lowAccum.pIprecharge/(1-lowAccum.VIeq/lowAccum.VI0)^(1.4);

    lowAccum = lowAccumClass();
    
    % High Pressure Accumulator C
                                 
%     highAccum.VI0 = 8.5;                                  % Vol. Accumulator C [m^3]
%     highAccum.del_p_r = 15e6;
%     highAccum.pIrated = highAccum.del_p_r + lowAccum.pIrated;
%     highAccum.pIeq = lowAccum.pIeq;
%     highAccum.pIlower_limit = highAccum.pIeq;
%     highAccum.pIupper_limit = 1.5*highAccum.pIlower_limit;
%     highAccum.pIprecharge = 0.9*highAccum.pIlower_limit;
%     highAccum.VIeq = highAccum.VI0*(1-(highAccum.pIprecharge/highAccum.pIeq)^(1/1.4));
%     highAccum.VImax = highAccum.VI0*(1-(highAccum.pIprecharge/highAccum.pIupper_limit)^(1/1.4));
%     highAccum.VImin = highAccum.VI0*(1-(highAccum.pIprecharge/highAccum.pIlower_limit)^(1/1.4));
    highAccum = highAccumClass();

    % Piston

%     piston.Ap = 0.0378;                        % Piston Area [m^2]
%     piston.Beta_e = 1.86e9;                    % Effective bulk modulus [Pa]
%     piston.Vo = piston.Ap*15;%piston.Ap*20;                         % Vol. Cylinder Chamber [m^3]  
% 
%     piston.pAeq = lowAccum.pIupper_limit;
%     piston.pBeq = lowAccum.pIupper_limit;
%     piston.pAupper_limit = 32e6;
%     piston.pAlower_limit = 20e6;


%     % Pressure A
%     piston.pAi = piston.pAeq;                     
%     % Pressure B
%     piston.pBi = piston.pBeq;
% 
%     piston.pBupper_limit = 32e6;
%     piston.pBlower_limit = 20e6;

    piston = pistonClass();
    % Motor

%     motor.angVelInit = 0;                      % Rotational speed of the generator [rad/s] 
%     motor.alpha = 1;                          % Swashplate angle ratio 
%     motor.D = 1.28e-4;                        % Norminal Motor displacement [m^3]
%     motor.J = 20;                             % Motor Moment of Inertia [kg-m^2]
%     motor.bg = 8;                             % Generator damping [kg-m^2/s]
%     motor.bf = 0.05*motor.bg;                       % Frictional damping [kg-m^2/s]
    motor = motorClass();
    % Generator

    load motorEff
%     %TgenBase = 1387;
%     gen.TgenBase = 2000;
%     %omegaBase = 863;
%     gen.omegaBase = 251.3;
%     gen.driveEff = 0.98;
    gen = generatorClass();




