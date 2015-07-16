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

classdef motorClass<handle
    properties(Access=public)
        angVelInit = 0;                      % Rotational speed of the generator [rad/s] 
        alpha = 1;                          % Swashplate angle ratio 
        D = 1.28e-4;                        % Norminal Motor displacement [m^3]
        J = 20;                             % Motor Moment of Inertia [kg-m^2]
        bg = 8;                             % Generator damping [kg-m^2/s]
        %bf = 0.05*motor.bg;                       % Frictional damping [kg-m^2/s]
        bf = 0.05*8;
    end
end
