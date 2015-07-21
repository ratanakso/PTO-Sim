    ptoSim.eff = tot;
    %ptoSim.motor.bf=motor.bf;
 
    
    ptoSim.pos = logsout.getElement('pos').Values.Data;
    ptoSim.vel = logsout.getElement('vel').Values.Data;
    ptoSim.force = logsout.getElement('force').Values.Data;
    ptoSim.highPressure = logsout.getElement('highPressure').Values.Data;
    ptoSim.lowPressure = logsout.getElement('lowPressure').Values.Data;
    ptoSim.topPressure = logsout.getElement('topPressure').Values.Data;
    ptoSim.bottomPressure = logsout.getElement('bottomPressure').Values.Data;
    ptoSim.volFlow = logsout.getElement('volFlow').Values.Data;
    ptoSim.volFlowM = logsout.getElement('volFlowM').Values.Data;
    ptoSim.absPower = logsout.getElement('absPower').Values.Data;
    ptoSim.genPower = logsout.getElement('genPower').Values.Data;
    ptoSim.elecPower = logsout.getElement('elecPower').Values.Data;
    ptoSim.angVel = logsout.getElement('angVel').Values.Data;
    ptoSim.torque = logsout.getElement('torque').Values.Data;
    
    ptosimOutput = ptoSim;