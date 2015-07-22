%% Complex Hydraulic

load motorEff

ptosim = ptoSimClass('Complex_Hydraulic');

%% Determine piston and valve options
% 1 means compressible option is selected
% 2 means noncompressible option is selected
% If compressible option is selected for the piston, the valve has to be
% the same option.

ptosim.pistonV = 1; % Selecting the compressible option for the piston
ptosim.valveV = 1;  % Selecting the compressible option for the valve

%% Piston 
ptosim.piston.Ap = 0.0378;
ptosim.piston.Vo = 0.5670;
ptosim.piston.Beta_e = 1.86e9;
ptosim.piston.pAi =2.1333e+07;
ptosim.piston.pBi =ptosim.piston.pAi;

%% Valve 

ptosim.valve.Cd = 0.61;
ptosim.valve.Amax = 0.002;  
ptosim.valve.Amin = 1e-8;
ptosim.valve.pMax = 1.5e6;
ptosim.valve.pMin = 0;
ptosim.valve.rho = 850;
ptosim.valve.k1 = 1;
ptosim.valve.k2 = 8.1374e-06;

%% High Pressure Accumulator

ptosim.highAccum.VI0 = 8;
ptosim.highAccum.VImax = 2.4457;
ptosim.highAccum.VImin = 0.5800;
ptosim.highAccum.VIeq = 0.5800;
ptosim.highAccum.pIprecharge = 1.9200e+07;
ptosim.highAccum.pIrated = 31e6;
ptosim.highAccum.del_p_r = 15e6;
ptosim.highAccum.pIupper_limit = 3.2000e+07;
ptosim.highAccum.pIlower_limit = 2.1333e+07;
ptosim.highAccum.pIeq = 2.1333e+07;

%% Low Pressure Accumulator

ptosim.lowAccum.VI0 = 6;
ptosim.lowAccum.VImax = 2.6081;
ptosim.lowAccum.VImin = 0.4350;
ptosim.lowAccum.VIeq = 2.6081;
ptosim.lowAccum.pIprecharge = 9600000;
ptosim.lowAccum.pIrated = 16e6;
ptosim.lowAccum.pIupper_limit = 2.1333e+07; 
ptosim.lowAccum.pIlower_limit = 1.0667e+07;
ptosim.lowAccum.pIeq = 2.1333e+07;

%% Hydraulic Motor

ptosim.motor.angVelInit = 0;
ptosim.motor.alpha = 1;
ptosim.motor.D = 1.28e-4;
ptosim.motor.J = 20;
ptosim.motor.bg = 8;
ptosim.motor.bf = 0.05*ptosim.motor.bg;

%% Lookup Table Generator

ptosim.gen.TgenBase = 2000;
ptosim.gen.omegaBase = 251.3;
ptosim.gen.driveEff = 0.98;




