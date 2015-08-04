%% Complex Hydraulic

load motorEff

ptosim = ptoSimClass('Complex_Hydraulic');

%% Valve 

ptosim.valve.Cd = 0.61;
ptosim.valve.Amax = 0.002;
ptosim.valve.Amin = 1e-8;
ptosim.valve.pMax = 1.5e6;
ptosim.valve.pMin = 0; % or 0.75*ptosim.valve.pMax 
ptosim.valve.rho = 850;
ptosim.valve.k1 = 200;

ptosim.valve.k2 = ...
    atanh((ptosim.valve.Amin-(ptosim.valve.Amax-ptosim.valve.Amin)/2)*...
    2/(ptosim.valve.Amax - ptosim.valve.Amin))*...
    1/(ptosim.valve.pMin-(ptosim.valve.pMax + ptosim.valve.pMin)/2);  


%% Low Pressure Accumulator

ptosim.accum(2).VI0 = 6;                                    
ptosim.accum(2).pIrated = 16e6;                                             % Rated working pressure
ptosim.accum(2).pIupper_limit = (4/3)*ptosim.accum(2).pIrated;              % Upper working pressure
ptosim.accum(2).pIlower_limit = (0.5)*ptosim.accum(2).pIupper_limit;        % Lower working pressure
ptosim.accum(2).pIprecharge = 0.9*ptosim.accum(2).pIlower_limit;            % Precharge pressure
ptosim.accum(2).VImax = ptosim.accum(2).VI0*(1-(ptosim.accum(2).pIprecharge/ptosim.accum(2).pIupper_limit)^(1/1.4));
ptosim.accum(2).VImin = ptosim.accum(2).VI0*(1-(ptosim.accum(2).pIprecharge/ptosim.accum(2).pIlower_limit)^(1/1.4));
ptosim.accum(2).VIeq = ptosim.accum(2).VImax;
ptosim.accum(2).pIeq = ptosim.accum(2).pIprecharge/(1-ptosim.accum(2).VIeq/ptosim.accum(2).VI0)^(1.4);


%% High Pressure Accumulator

ptosim.accum(1).VI0 = 8.5;                                 
ptosim.accum(1).del_p_r = 15e6;
ptosim.accum(1).pIrated = ptosim.accum(1).del_p_r + ptosim.accum(2).pIrated;
ptosim.accum(1).pIeq = ptosim.accum(2).pIeq;
ptosim.accum(1).pIlower_limit = ptosim.accum(1).pIeq;
ptosim.accum(1).pIupper_limit = 1.5*ptosim.accum(1).pIlower_limit;
ptosim.accum(1).pIprecharge = 0.9*ptosim.accum(1).pIlower_limit;
ptosim.accum(1).VIeq = ptosim.accum(1).VI0*(1-(ptosim.accum(1).pIprecharge/ptosim.accum(1).pIeq)^(1/1.4));
ptosim.accum(1).VImax = ptosim.accum(1).VI0*(1-(ptosim.accum(1).pIprecharge/ptosim.accum(1).pIupper_limit)^(1/1.4));
ptosim.accum(1).VImin = ptosim.accum(1).VI0*(1-(ptosim.accum(1).pIprecharge/ptosim.accum(1).pIlower_limit)^(1/1.4));


%% Piston 
ptosim.piston.Ap = 0.0378;
ptosim.piston.Vo = 15*ptosim.piston.Ap;
ptosim.piston.Beta_e = 1.86e9;
ptosim.piston.pAi = ptosim.accum(2).pIupper_limit;
ptosim.piston.pBi = ptosim.piston.pAi;


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




