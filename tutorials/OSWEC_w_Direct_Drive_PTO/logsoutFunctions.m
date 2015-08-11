
    ptoSim.angPosition = logsout.getElement('angPosition').Values.Data;
    ptoSim.angVelocity = logsout.getElement('angVelocity').Values.Data;
    ptoSim.ptoTorque = logsout.getElement('ptoTorque').Values.Data;
    
    ptoSim.pos = logsout.getElement('pos').Values.Data;
    ptoSim.vel = logsout.getElement('vel').Values.Data;
    ptoSim.force = logsout.getElement('force').Values.Data;
    ptoSim.Vabc = logsout.getElement('Vabc').Values.Data;
    ptoSim.Iabc = logsout.getElement('Iabc').Values.Data;
    ptoSim.absPower = logsout.getElement('absPower').Values.Data;
    ptoSim.elecPower = logsout.getElement('elecPower').Values.Data;
    ptoSim.fricForce = logsout.getElement('fricForce').Values.Data;
    
    ptosimOutput = ptoSim;