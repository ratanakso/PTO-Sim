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

% %% Diode Rectifier
% ptosim.dioderec.n = 15;
% ptosim.dioderec.C = 10;%10;
% ptosim.dioderec.VT = 0.026;                  % VT is approximately 25.85 mV at 300 K
% ptosim.dioderec.Is = 1e-12;                  % Inverse saturation current
% ptosim.dioderec.R = 100;
% ptosim.dioderec.V1_init = 0; 
% ptosim.dioderec.V2_init = -0;


