
%%  Direct Drive   
  
    % Machine
%     machine.Rs = 4.58;        
%     machine.Bfric = -100;           % coefficient of friction    
%     machine.tau_p = 0.072;          % Magnet pole pitch is 72 mm
%     machine.lambda_fd = 8;          % Rload = -200/1.7 Van = 200V 1.7A at 0.7m/s
%     %machine.lambda_fd = 480/sqrt(3)*sqrt(2)*3/2*sqrt(2/3)/(pi/machine.tau_p);
%     machine.Lsinglephase = 0.190;
%     machine.Ls = 3/2*machine.Lsinglephase;
%     machine.theta_d_0 =0;
%     machine.lambda_sq_0=0;
%     machine.lambda_sd_0 =machine.lambda_fd;
    machine = machineClass();
    % Load
    %ddload.Rload = -200/1.7;       % Van = 200 Vpeak, Ia = 1.7 A
    ddload = loadClass();

