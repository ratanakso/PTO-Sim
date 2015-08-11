%%  Direct Drive   
 
ptosim = ptoSimClass('Direct_Drive');


%% Machine

ptosim.directdrive.Rs = 4.58;
ptosim.directdrive.Bfric = -100;
ptosim.directdrive.tau_p = 0.072;
ptosim.directdrive.lambda_fd = 8;
ptosim.directdrive.Ls = 0.285;
ptosim.directdrive.theta_d_0 = 0;
ptosim.directdrive.lambda_sq_0 = 0;
ptosim.directdrive.lambda_sd_0 = 8;
ptosim.directdrive.Rload = -117.6471;

%% Telescope Mechanism

ptosim.motionmech.radius = 3;
ptosim.motionmech.offsetZ = 1.3;
ptosim.motionmech.hydArmInit = 5;

