%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright 2014 the National Renewable Energy Laboratory and Sandia Corporation
% 
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
% 
%     http://www.apache.org/licenses/LICENSE-2.0
% 
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

classdef machineClass<handle
    properties (Access = public)%hdf5 file 
        Rs = 4.58;        
        Bfric = -100;           % coefficient of friction    
        tau_p = 0.072;          % Magnet pole pitch is 72 mm
        lambda_fd = 8;          % Rload = -200/1.7 Van = 200V 1.7A at 0.7m/s
        %Lsinglephase = 0.190;
        Ls = 3/2*0.190;
        theta_d_0 =0;
        lambda_sq_0=0;
        %lambda_sd_0 =lambda_fd;  
        lambda_sd_0 = 8;
    end
    
end