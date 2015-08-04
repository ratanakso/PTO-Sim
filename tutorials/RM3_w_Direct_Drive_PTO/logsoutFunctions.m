ptoSim.pos = logsout.getElement('pos').Values.Data;
ptoSim.vel = logsout.getElement('vel').Values.Data;
ptoSim.force = logsout.getElement('force').Values.Data;
ptoSim.Vabc = logsout.getElement('Vabc').Values.Data;
ptoSim.Iabc = logsout.getElement('Iabc').Values.Data;
ptoSim.absPower = logsout.getElement('absPower').Values.Data;
ptoSim.elecPower = logsout.getElement('elecPower').Values.Data;
ptoSim.fricForce = logsout.getElement('fricForce').Values.Data;

% ptoSim.Vo = logsout.getElement('Vo').Values.Data;
% ptoSim.Io = logsout.getElement('Io').Values.Data;
% ptoSim.V1 = logsout.getElement('V1').Values.Data;
% ptoSim.V2 = logsout.getElement('V2').Values.Data;
% ptoSim.Idiode_Va_V1 = logsout.getElement('Idiode_Va_V1').Values.Data;
% ptoSim.Idiode_Vb_V1 = logsout.getElement('Idiode_Vb_V1').Values.Data;
% ptoSim.Idiode_Vc_V1 = logsout.getElement('Idiode_Vc_V1').Values.Data;
% ptoSim.Idiode_V2_Va = logsout.getElement('Idiode_V2_Va').Values.Data;
% ptoSim.Idiode_V2_Vb = logsout.getElement('Idiode_V2_Vb').Values.Data;
% ptoSim.Idiode_V2_Vc = logsout.getElement('Idiode_V2_Vc').Values.Data;
% ptoSim.Icapacitor1 = logsout.getElement('Icapacitor1').Values.Data;
% ptoSim.Icapacitor2 = logsout.getElement('Icapacitor2').Values.Data;
% ptoSim.elecRecPower = logsout.getElement('elecRecPower').Values.Data;

ptosimOutput = ptoSim;