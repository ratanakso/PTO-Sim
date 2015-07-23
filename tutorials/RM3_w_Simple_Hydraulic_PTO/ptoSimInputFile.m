%% Simple Hydraulic

load motorEff

ptosim = ptoSimClass('Simple_Hydraulic');

%% Determine piston and valve options
% 1 means compressible option is selected
% 2 means noncompressible option is selected
% If compressible option is selected for the piston, the valve has to be
% the same option.

ptosim.fluidOption = 2; % Selecting the noncompressible option for the piston

checkFluidOptionNumbers(ptosim)

%% Piston 

ptosim.piston.topA = 0.0378;
ptosim.piston.botA = 0.0378;

%% Check Hydraulic Type
checkHydraulicType(ptosim)
checkSimpleHydraulicPiston(ptosim)
%% Low Pressure Accumulator

ptosim.lowAccum.VI0 = 6;                                    
ptosim.lowAccum.pIrated = 16e6;                                             % Rated working pressure
checkLowAccum(ptosim)
ptosim.lowAccum.pIupper_limit = (4/3)*ptosim.lowAccum.pIrated;              % Upper working pressure
checkLowAccum_pIupper_limit(ptosim)
ptosim.lowAccum.pIlower_limit = (0.5)*ptosim.lowAccum.pIupper_limit;        % Lower working pressure
checkLowAccum_pIlower_limit(ptosim)
ptosim.lowAccum.pIprecharge = 0.9*ptosim.lowAccum.pIlower_limit;            % Precharge pressure
checkLowAccum_pIprecharge(ptosim)
ptosim.lowAccum.VImax = ptosim.lowAccum.VI0*(1-(ptosim.lowAccum.pIprecharge/ptosim.lowAccum.pIupper_limit)^(1/1.4));
checkLowAccum_VImax(ptosim)
ptosim.lowAccum.VImin = ptosim.lowAccum.VI0*(1-(ptosim.lowAccum.pIprecharge/ptosim.lowAccum.pIlower_limit)^(1/1.4));
checkLowAccum_VImin(ptosim)
ptosim.lowAccum.VIeq = ptosim.lowAccum.VImax;
checkLowAccum_VIeq(ptosim)
ptosim.lowAccum.pIeq = ptosim.lowAccum.pIprecharge/(1-ptosim.lowAccum.VIeq/ptosim.lowAccum.VI0)^(1.4);
checkLowAccum_pIeq(ptosim)

%% High Pressure Accumulator

ptosim.highAccum.VI0 = 8.5;                                 
ptosim.highAccum.del_p_r = 15e6;
ptosim.highAccum.pIrated = ptosim.highAccum.del_p_r + ptosim.lowAccum.pIrated;
ptosim.highAccum.pIeq = ptosim.lowAccum.pIeq;
ptosim.highAccum.pIlower_limit = ptosim.highAccum.pIeq;
ptosim.highAccum.pIupper_limit = 1.5*ptosim.highAccum.pIlower_limit;
ptosim.highAccum.pIprecharge = 0.9*ptosim.highAccum.pIlower_limit;
ptosim.highAccum.VIeq = ptosim.highAccum.VI0*(1-(ptosim.highAccum.pIprecharge/ptosim.highAccum.pIeq)^(1/1.4));
ptosim.highAccum.VImax = ptosim.highAccum.VI0*(1-(ptosim.highAccum.pIprecharge/ptosim.highAccum.pIupper_limit)^(1/1.4));
ptosim.highAccum.VImin = ptosim.highAccum.VI0*(1-(ptosim.highAccum.pIprecharge/ptosim.highAccum.pIlower_limit)^(1/1.4));

checkHighAccum(ptosim)

%% Hydraulic Motor

ptosim.motor.angVelInit = 0;
ptosim.motor.alpha = 1;
ptosim.motor.D = 1.28e-4;
ptosim.motor.J = 20;
ptosim.motor.bg = 8;
ptosim.motor.bf = 0.05*ptosim.motor.bg;

checkHydraulicMotor(ptosim)

%% Lookup Table Generator

ptosim.gen.TgenBase = 2000;
ptosim.gen.omegaBase = 251.3;
ptosim.gen.driveEff = 0.98;

checkGenerator(ptosim)
