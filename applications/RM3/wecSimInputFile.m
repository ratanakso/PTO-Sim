%% Simulation Data
simu = simulationClass();               %Create the Simulation Variable
simu.simMechanicsFile = 'RM3.slx';      %Location of Simulink Model File
simu.endTime=400;                       %Simulation End Time [s]
simu.dt = 0.001;                          %Simulation Time-Step [s]
simu.rampT = 100;                       %Wave Ramp Time Length [s]
%ddload = ptosimClass(); 
%machine = machineClass();
%% Wave Information
%Regular Waves 
% waves = waveClass('regularCIC');        
%                                  %Create the Wave Variable and Specify Type
% waves.H = 2.5;                          %Wave Height [m]
% waves.T = 8;                            %Wave Period [s]

% %Irregular Waves using PM Spectrum with Convolution Integral Calculation
waves = waveClass('irregular');       
                               %Create the Wave Variable and Specify Type
waves.H = 2.5;                        %Significant Wave Height [m]
waves.T = 8;                          %Peak Period [s]
waves.spectrumType = 'PM';

% %Irregular Waves using BS Spectrum with State Space Calculation
% waves = waveClass('irregular');       
%                                %Create the Wave Variable and Specify Type
% waves.H = 2.5;                        %Significant Wave Height [m]
% waves.T = 8;                          %Peak Period [s]
% waves.spectrumType = 'BS';
% simu.ssCalc = 1;						%Control option to use state space model 

% %Irregular Waves using User-Defined Spectrum
% waves = waveClass('irregularImport');         
%                                %Create the Wave Variable and Specify Type
% waves.spectrumDataFile = 'ndbcBuoyData.txt';  
%                                   %Location of User Defined Spectrum File

%% Body Data
body(1) = bodyClass('hydroData/rm3.h5',1);      
    %Create the body(1) Variable, Set Location of Hydrodynamic Data File 
    %and Body Number Within this File.        
body(1).mass = 'equilibrium';                   
    %Body Mass. The 'equilibrium' Option Sets it to the Displaced Water 
    %Weight.
body(1).momOfInertia = [20907301 21306090.66 37085481.11]; 
    %Moment of Inertia [kg*m^2]     
body(1).geometryFile = 'geometry/float.stl';    %Location of Geomtry File

body(2) = bodyClass('hydroData/rm3.h5',2);     
body(2).mass = 'equilibrium';                   
body(2).momOfInertia = [94419614.57 94407091.24 28542224.82];
body(2).geometryFile = 'geometry/plate.stl'; 

%% PTO and Constraint Parameters
constraint(1) = constraintClass('Constraint1'); 
                        %Create Constraint Variable and Set Constraint Name
constraint(1).loc = [0 0 0];                    %Constraint Location [m]


pto(1) = ptoClass('PTO1');                      
                                      %Create PTO Variable and Set PTO Name
pto(1).k=0;                                     %PTO Stiffness [N/m]
pto(1).c=0*1200000;                               %PTO Daming [N/(m/s)]
pto(1).loc = [0 0 0];                           %PTO Location [m]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% PTO-Sim
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Valve

valve.Cd = 0.61;                          % Discharge coefficient
valve.Amax = 0.002;                       % Maximum valve area [m^2] for 8 and 14 seconds wave
valve.Amin = 1e-8;                        % Minimum valve area [m^2]
valve.pMax = 2e6;                       % Maximum area pressure [Pa] 
valve.pMin = 0.75*valve.pMax;                                                    
valve.rho = 850;                          % Hydraulic fluid density [kg/m^2]
valve.k1 = 200;
valve.k2 = atanh((valve.Amin-(valve.Amax-valve.Amin)/2)*...
            2/(valve.Amax - valve.Amin))*...
            1/(valve.pMin-(valve.pMax + valve.pMin)/2);   

        
%% Low Pressure Accumulator D 
                                                      
accum.VD0 = 6;                                    % Vol. Accumulator D [m^3]
accum.pDrated = 16e6;                             % Rated working pressure
accum.pDupper_limit = (4/3)*accum.pDrated;              % Uppder working pressure   
accum.pDlower_limit = (0.5)*accum.pDupper_limit;        % Lower workig pressure
accum.pDprecharge = 0.9*accum.pDlower_limit;            % Precharge pressure
accum.VDmax = accum.VD0*(1-(accum.pDprecharge/accum.pDupper_limit)^(1/1.4));  
accum.VDmin = accum.VD0*(1-(accum.pDprecharge/accum.pDlower_limit)^(1/1.4));
accum.VDeq = accum.VDmax;
accum.pDeq = accum.pDprecharge/(1-accum.VDeq/accum.VD0)^(1.4);


%% High Pressure Accumulator C
                                 
accum.VC0 = 8.5;                                  % Vol. Accumulator C [m^3]
accum.del_p_r = 15e6;
accum.pCrated = accum.del_p_r + accum.pDrated;
accum.pCeq = accum.pDeq;
accum.pClower_limit = accum.pCeq;
accum.pCupper_limit = 1.5*accum.pClower_limit;
accum.pCprecharge = 0.9*accum.pClower_limit;
accum.VCeq = accum.VC0*(1-(accum.pCprecharge/accum.pCeq)^(1/1.4));
accum.VCmax = accum.VC0*(1-(accum.pCprecharge/accum.pCupper_limit)^(1/1.4));
accum.VCmin = accum.VC0*(1-(accum.pCprecharge/accum.pClower_limit)^(1/1.4));


%% Piston

piston.Ap = 0.0378;                        % Piston Area [m^2]
piston.Beta_e = 1.86e9;                    % Effective bulk modulus [Pa]
piston.Vo = piston.Ap*20;                         % Vol. Cylinder Chamber [m^3]  

piston.pAeq = accum.pDupper_limit;
piston.pBeq = accum.pDupper_limit;
piston.pAupper_limit = 32e6;
piston.pAlower_limit = 20e6;

% Pressure A
piston.pAi = piston.pAeq;                     
% Pressure B
piston.pBi = piston.pBeq;

piston.pBupper_limit = 32e6;
piston.pBlower_limit = 20e6;

%% Motor

motor.omegaInit = 0;                      % Rotational speed of the generator [rad/s] 
motor.alpha = 1;                          % Swashplate angle ratio 
motor.D = 1.28e-4;                        % Norminal Motor displacement [m^3]
motor.J = 20;                             % Motor Moment of Inertia [kg-m^2]
motor.bg = 8;                             % Generator damping [kg-m^2/s]
motor.bf = 0.05*motor.bg;                       % Fractional damping [kg-m^2/s]

%% Generator

load motorEff
%TgenBase = 1387;
gen.TgenBase = 2000;
%omegaBase = 863;
gen.omegaBase = 251.3;
gen.driveEff = 0.98;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Direct Drive
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Rs = 4.58;        
% %load.Rload = -200/1.7;       % Van = 200 Vpeak, Ia = 1.7 A
% Bfric = -100;           % coefficient of friction    
% tau_p = 0.072;          % Magnet pole pitch is 72 mm
% lambda_fd = 8;          % Rload = -200/1.7 Van = 200V 1.7A at 0.7m/s
% Lsinglephase = 0.190;
% Ls = 3/2*Lsinglephase;
% theta_d_0 =0;
% lambda_sq_0=0;
% lambda_sd_0 =lambda_fd;





