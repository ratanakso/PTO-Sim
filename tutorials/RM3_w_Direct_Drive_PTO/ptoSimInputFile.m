
%%  Direct Drive   
  
% machine = machineClass();
% ddload = loadClass();

ptosim = ptoSimClass('Direct_Drive');
machine.Rs = ptosim.machine.Rs;
machine.Bfric = ptosim.machine.Bfric;
machine.tau_p = ptosim.machine.tau_p;
machine.lambda_fd = ptosim.machine.lambda_fd;
machine.Ls = ptosim.machine.Ls;
machine.theta_d_0 = ptosim.machine.theta_d_0;
machine.lambda_sq_0 = ptosim.machine.lambda_sq_0;
machine.lambda_sd_0 = ptosim.machine.lambda_sd_0;
ddload.Rload = ptosim.ddload.Rload;

