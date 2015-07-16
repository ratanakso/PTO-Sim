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

classdef pistonClass<handle
    properties(Access=public)
        %piston.Ap = 0.0378;                        % Piston Area [m^2]
        Ap = 0.0378;
        %piston.Vo = piston.Ap*15;%piston.Ap*20;                         % Vol. Cylinder Chamber [m^3] 
        Vo = 0.0378*15;
        %piston.Beta_e = 1.86e9;                    % Effective bulk modulus [Pa]
        Beta_e = 1.86e9; 
        %piston.pAeq = lowAccum.pIupper_limit;
        pAeq = (4/3)*16e6;
        pAi = (4/3)*16e6;
        %piston.pBeq = lowAccum.pIupper_limit;
        pBeq = (4/3)*16e6;
        pBi = (4/3)*16e6;
        pAupper_limit = 32e6;
        pAlower_limit = 20e6;
    end
end
