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

classdef lowAccumClass<handle
    properties(Access=public)
        VI0 = 6;                                    % Vol. Accumulator D [m^3]
        pIrated = 16e6;                             % Rated working pressure
        %pIupper_limit = (4/3)*lowAccum.pIrated;              % Uppder working pressure 
        pIupper_limit = (4/3)*16e6;
        %pIlower_limit = (0.5)*lowAccum.pIupper_limit;        % Lower workig pressure
        pIlower_limit = (0.5)*((4/3)*16e6);
        %pIprecharge = 0.9*lowAccum.pIlower_limit;            % Precharge pressure
        pIprecharge = 0.9*((0.5)*(4/3)*16e6); 
        %VImax = lowAccum.VI0*(1-(lowAccum.pIprecharge/lowAccum.pIupper_limit)^(1/1.4));
        VImax = 6*(1-((0.9*((0.5)*(4/3)*16e6))/((4/3)*16e6))^(1/1.4)); 
        %VImin = lowAccum.VI0*(1-(lowAccum.pIprecharge/lowAccum.pIlower_limit)^(1/1.4));
        VImin = 6*(1-((0.9*((0.5)*(4/3)*16e6))/((0.5)*((4/3)*16e6)))^(1/1.4));
        %VIeq = lowAccum.VImax;
        VIeq = 6*(1-((0.9*((0.5)*(4/3)*16e6))/((4/3)*16e6))^(1/1.4)); 
        %pIeq = lowAccum.pIprecharge/(1-lowAccum.VIeq/lowAccum.VI0)^(1.4);
        pIeq = (0.9*((0.5)*(4/3)*16e6))/(1-(6*(1-((0.9*((0.5)*(4/3)*16e6))/((4/3)*16e6))^(1/1.4)))/6)^(1.4);
    end
end
