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

classdef directdriveClass<handle
    properties
        name = 'NOT DEFINED'
        machine = struct('Rs'           ,4.58,...
                         'Bfric'        ,-100,...
                         'tau_p'        ,0.072,...
                         'lambda_fd'    ,8,...
                         'Ls'           ,0.285,...
                         'theta_d_0'    ,0,...
                         'lambda_sq_0'  ,0,...
                         'lambda_sd_0'  ,8)
         ddload = struct('Rload'        ,-117.6471)                                     
    end
    
    methods
        function obj        = directdriveClass(name)
                 obj.name   = name;
        end
    end
 
end

%     properties (SetAccess = 'private', GetAccess = 'public')
%         directdrive = struct()
%     end
%     
%     properties
%         name = 'NOT DEFINED'
%     end
%     
%     methods (Access = 'public')
%         function obj = directdriveClass(name)
%             obj.name = name;
%         end
%         
%         function obj = checkName(obj,name)
%             switch name
%                 case 'M'
%                     obj.name.Rs = 4.58;        
%                     obj.name.Bfric = -100;           % coefficient of friction    
%                     obj.name.tau_p = 0.072;          % Magnet pole pitch is 72 mm
%                     obj.name.lambda_fd = 8;          % Rload = -200/1.7 Van = 200V 1.7A at 0.7m/s
%                     %Lsinglephase = 0.190;
%                     obj.name.Ls = 3/2*0.190;
%                     obj.name.theta_d_0 =0;
%                     obj.name.lambda_sq_0=0;
%                     %lambda_sd_0 =lambda_fd;  
%                     obj.name.lambda_sd_0 = 8;
%                 case 'L'
%                     obj.name.Rload = -200/1.7;
%             end
%         end
%     end
