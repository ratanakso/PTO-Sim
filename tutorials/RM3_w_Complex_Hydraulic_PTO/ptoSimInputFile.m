%% Complex Hydraulic

load motorEff

ptosim = ptoSimClass('Complex_Hydraulic');

%% Determine piston and valve options
% 1 means compressible option is selected
% 2 means noncompressible option is selected
% other numbers will give an error
% If compressible option is selected for the piston, the valve has to be
% the same option. If they are not the same, an error message will display.

ptosim.fluidOption = 1; % Selecting the noncompressible option for the piston

checkFluidOptionNumbers(ptosim)


%% Valve 

ptosim.valve.Cd = 0.61;
ptosim.valve.Amax = 0.002;
ptosim.valve.Amin = 1e-8;
ptosim.valve.pMax = 1.5e6;
ptosim.valve.pMin = 0; % or 0.75*ptosim.valve.pMax 
ptosim.valve.rho = 850;
ptosim.valve.k1 = 1;
checkHydraulicValve(ptosim)
ptosim.valve.k2 = ...
    atanh((ptosim.valve.Amin-(ptosim.valve.Amax-ptosim.valve.Amin)/2)*...
    2/(ptosim.valve.Amax - ptosim.valve.Amin))*...
    1/(ptosim.valve.pMin-(ptosim.valve.pMax + ptosim.valve.pMin)/2);  

checkHydraulicValve_k2(ptosim)

%% Low Pressure Accumulator

ptosim.lowAccum.VI0 = 6;                                    
ptosim.lowAccum.pIrated = 16e6;                                             % Rated working pressure
checkLowAccum(ptosim)
ptosim.lowAccum.pIupper_limit = (4/3)*ptosim.lowAccum.pIrated;              % Uppder working pressure
checkLowAccum_pIupper_limit(ptosim)
ptosim.lowAccum.pIlower_limit = (0.5)*ptosim.lowAccum.pIupper_limit;        % Lower workig pressure
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

%% Piston 
ptosim.piston.Ap = 0.0378;
ptosim.piston.Vo = 15*ptosim.piston.Ap;
ptosim.piston.Beta_e = 1.86e9;
ptosim.piston.pAi = ptosim.lowAccum.pIupper_limit;
ptosim.piston.pBi = ptosim.piston.pAi;

%% Check Hydraulic Type
checkHydraulicType(ptosim)
checkComplexHydraulicPiston(ptosim)
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


