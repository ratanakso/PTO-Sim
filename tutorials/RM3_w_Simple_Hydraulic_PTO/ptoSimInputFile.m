%% Simple Hydraulic

load motorEff

% lowAccum = lowAccumClass();
% highAccum = highAccumClass();
% piston = pistonNCClass();
% motor = motorClass();
% gen = generatorClass();

ptosim = ptoSimClass('Simple_Hydraulic');

% ptosim.pistonNC = 2;
% ptosim.valveNC = 2;

piston.topA = ptosim.piston.topA;
piston.botA = ptosim.piston.botA;
piston.Ap = ptosim.piston.Ap;
piston.Vo = ptosim.piston.Vo;
piston.Beta_e = ptosim.piston.Beta_e;
piston.pAi = ptosim.piston.pAi;
piston.pBi = ptosim.piston.pBi;

highAccum.VI0= ptosim.highAccum.VI0;
highAccum.del_p_r = ptosim.highAccum.del_p_r;
highAccum.pIrated = ptosim.highAccum.pIrated;
highAccum.pIeq = ptosim.highAccum.pIeq;
highAccum.pIlower_limit = ptosim.highAccum.pIlower_limit;
highAccum.pIupper_limit = ptosim.highAccum.pIupper_limit;
highAccum.pIprecharge = ptosim.highAccum.pIprecharge;
highAccum.VIeq = ptosim.highAccum.VIeq;
highAccum.VImax = ptosim.highAccum.VImax;
highAccum.VImin = ptosim.highAccum.VImin;

lowAccum.VI0= ptosim.lowAccum.VI0;
lowAccum.pIrated = ptosim.lowAccum.pIrated;
lowAccum.pIeq = ptosim.lowAccum.pIeq;
lowAccum.pIlower_limit = ptosim.lowAccum.pIlower_limit;
lowAccum.pIupper_limit = ptosim.lowAccum.pIupper_limit;
lowAccum.pIprecharge = ptosim.lowAccum.pIprecharge;
lowAccum.VIeq = ptosim.lowAccum.VIeq;
lowAccum.VImax = ptosim.lowAccum.VImax;
lowAccum.VImin = ptosim.lowAccum.VImin;

motor.angVelInit = ptosim.motor.angVelInit;
motor.alpha = ptosim.motor.alpha;
motor.D = ptosim.motor.D;
motor.J = ptosim.motor.J;
motor.bg = ptosim.motor.bg;
motor.bf = ptosim.motor.bf;

gen.TgenBase = ptosim.gen.TgenBase;
gen.omegaBase = ptosim.gen.omegaBase;
gen.driveEff = ptosim.gen.driveEff;



