%%  Direct Drive   
 
ptosim = ptoSimClass('Direct_Drive');


%% Machine

ptosim.machine.Rs = 4.58;
ptosim.machine.Bfric = -100;
ptosim.machine.tau_p = 0.072;
ptosim.machine.lambda_fd = 8;
ptosim.machine.Ls = 0.285;
ptosim.machine.theta_d_0 = 0;
ptosim.machine.lambda_sq_0 = 0;
ptosim.machine.lambda_sd_0 = 8;

%% Load

ptosim.ddload.Rload = -117.6471;


