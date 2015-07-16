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

classdef highAccumClass<handle
    properties(Access=public)
        VI0 = 8;                                    % Vol. Accumulator D [m^3]
        del_p_r = 15e6;
        % lowAccum.pIrated = 16e6;                            
        %highAccum.pIrated = highAccum.del_p_r + lowAccum.pIrated; % Rated working pressure
        %pIrated = 15e6 + 16e6; 
        pIrated = 31e6;
        %highAccum.pIeq = lowAccum.pIeq;
        pIeq = (0.9*((0.5)*(4/3)*16e6))/(1-(6*(1-((0.9*((0.5)*(4/3)*16e6))/((4/3)*16e6))^(1/1.4)))/6)^(1.4);
        %highAccum.pIlower_limit = highAccum.pIeq;
        pIlower_limit = (0.9*((0.5)*(4/3)*16e6))/(1-(6*(1-((0.9*((0.5)*(4/3)*16e6))/((4/3)*16e6))^(1/1.4)))/6)^(1.4);
        %highAccum.pIupper_limit = 1.5*highAccum.pIlower_limit;
        pIupper_limit = 1.5*(0.9*((0.5)*(4/3)*16e6))/(1-(6*(1-((0.9*((0.5)*(4/3)*16e6))/((4/3)*16e6))^(1/1.4)))/6)^(1.4);
        %highAccum.pIprecharge = 0.9*highAccum.pIlower_limit;
        pIprecharge = 0.9*(0.9*((0.5)*(4/3)*16e6))/(1-(6*(1-((0.9*((0.5)*(4/3)*16e6))/((4/3)*16e6))^(1/1.4)))/6)^(1.4);
        %highAccum.VIeq = highAccum.VI0*(1-(highAccum.pIprecharge/highAccum.pIeq)^(1/1.4));
        VIeq = 8*(1-((0.9*(0.9*((0.5)*(4/3)*16e6))/(1-(6*(1-((0.9*((0.5)*(4/3)*16e6))/((4/3)*16e6))^(1/1.4)))/6)^(1.4))/((0.9*((0.5)*(4/3)*16e6))/(1-(6*(1-((0.9*((0.5)*(4/3)*16e6))/((4/3)*16e6))^(1/1.4)))/6)^(1.4)))^(1/1.4));
        %highAccum.VImax = highAccum.VI0*(1-(highAccum.pIprecharge/highAccum.pIupper_limit)^(1/1.4));
        VImax = 8*(1-((0.9*(0.9*((0.5)*(4/3)*16e6))/(1-(6*(1-((0.9*((0.5)*(4/3)*16e6))/((4/3)*16e6))^(1/1.4)))/6)^(1.4))/(1.5*(0.9*((0.5)*(4/3)*16e6))/(1-(6*(1-((0.9*((0.5)*(4/3)*16e6))/((4/3)*16e6))^(1/1.4)))/6)^(1.4)))^(1/1.4));
        %highAccum.VImin = highAccum.VI0*(1-(highAccum.pIprecharge/highAccum.pIlower_limit)^(1/1.4));
        VImin = 8*(1-((0.9*(0.9*((0.5)*(4/3)*16e6))/(1-(6*(1-((0.9*((0.5)*(4/3)*16e6))/((4/3)*16e6))^(1/1.4)))/6)^(1.4))/((0.9*((0.5)*(4/3)*16e6))/(1-(6*(1-((0.9*((0.5)*(4/3)*16e6))/((4/3)*16e6))^(1/1.4)))/6)^(1.4)))^(1/1.4));
        
    end
end
