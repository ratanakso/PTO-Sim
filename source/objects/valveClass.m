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

classdef valveClass<handle
    properties(Access=public)
        Cd = 0.61;                          % Discharge coefficient
        Amax = 0.002;                       % Maximum valve area [m^2] for 8 and 14 seconds wave
        Amin = 1e-8;%1e-8;                        % Minimum valve area [m^2]
        pMax = 1.5e6;%2e6;                       % Maximum area pressure [Pa] 
        %pMin = 0*0.75*valve.pMax; 
        pMin = 0;
        rho = 850;                          % Hydraulic fluid density [kg/m^2]
        k1 = 1;%200;
        %         k2 = atanh((valve.Amin-(valve.Amax-valve.Amin)/2)*...
        %             2/(valve.Amax - valve.Amin))*...
        %             1/(valve.pMin-(valve.pMax + valve.pMin)/2);

        k2 = atanh((1e-8-(0.002-1e-8)/2)*...
            2/(0.002 - 1e-8))*...
            1/(0-(1.5e6 + 0)/2);
    end
end
