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

%% Diode Rectifier
ptosim.dioderec.n = 6;
ptosim.dioderec.C = 10;
ptosim.dioderec.VT = 0.026;                  % VT is approximately 25.85 mV at 300 K
ptosim.dioderec.Is = 1e-12;                  % Inverse saturation current
ptosim.dioderec.R = 100;
ptosim.dioderec.V1_init = 0; 
ptosim.dioderec.V2_init = -0;


