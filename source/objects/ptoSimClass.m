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

classdef ptoSimClass<handle
    properties
        name = 'NOT DEFINED'
        
        piston  =   struct('topA'         ,'NOT DEFINED',...
                           'botA'         ,'NOT DEFINED',...
                           'Ap'           ,'NOT DEFINED',...
                           'Vo'           ,'NOT DEFINED',...
                           'Beta_e'       ,'NOT DEFINED',...
                           'pAi'          ,'NOT DEFINED',...
                           'pBi'          ,'NOT DEFINED')
                     
        valve   =   struct('Cd'           ,'NOT DEFINED',...
                           'Amax'         ,'NOT DEFINED',...
                           'Amin'         ,'NOT DEFINED',...
                           'pMax'         ,'NOT DEFINED',...
                           'pMin'         ,'NOT DEFINED',...
                           'rho'          ,'NOT DEFINED',...
                           'k1'           ,'NOT DEFINED',...
                           'k2'           ,'NOT DEFINED')
                       
        lowAccum  = struct('VI0'          ,'NOT DEFINED',...
                           'pIrated'      ,'NOT DEFINED',...
                           'pIupper_limit','NOT DEFINED',...
                           'pIlower_limit','NOT DEFINED',...
                           'pIprecharge'  ,'NOT DEFINED',...
                           'VImax'        ,'NOT DEFINED',...
                           'VImin'        ,'NOT DEFINED',...
                           'VIeq'         ,'NOT DEFINED',...
                           'pIeq'         ,'NOT DEFINED')
                      
        highAccum = struct('VI0'          ,'NOT DEFINED',...
                           'del_p_r'      ,'NOT DEFINED',...
                           'pIrated'      ,'NOT DEFINED',...
                           'pIeq'         ,'NOT DEFINED',...
                           'pIlower_limit','NOT DEFINED',...
                           'pIupper_limit','NOT DEFINED',...
                           'pIprecharge'  ,'NOT DEFINED',...
                           'VIeq'         ,'NOT DEFINED',...
                           'VImax'        ,'NOT DEFINED',...
                           'VImin'        ,'NOT DEFINED')                     
                       
        motor    =  struct('angVelInit'   ,'NOT DEFINED',...
                           'alpha'        ,'NOT DEFINED',...
                           'D'            ,'NOT DEFINED',...
                           'J'            ,'NOT DEFINED',...
                           'bg'           ,'NOT DEFINED',...
                           'bf'           ,'NOT DEFINED')
                       
        gen      =  struct('TgenBase'     ,'NOT DEFINED',...
                           'omegaBase'    ,'NOT DEFINED',...
                           'driveEff'     ,'NOT DEFINED')
                       
        machine  =  struct('Rs'           ,'NOT DEFINED',...
                           'Bfric'        ,'NOT DEFINED',...
                           'tau_p'        ,'NOT DEFINED',...
                           'lambda_fd'    ,'NOT DEFINED',...
                           'Ls'           ,'NOT DEFINED',...
                           'theta_d_0'    ,'NOT DEFINED',...
                           'lambda_sq_0'  ,'NOT DEFINED',...
                           'lambda_sd_0'  ,'NOT DEFINED')
                       
         ddload   = struct('Rload'        ,'NOT DEFINED') 
                         
    end
    
    properties (Access = public)
        fluidOption = 'NOT DEFINED';                        % 1 means compressible option is selected    

        
    end
    
    methods
        function obj        = ptoSimClass(name)
                 obj.name   = name;
        end
        
        function checkFluidOptionNumbers(obj)
            if obj.fluidOption ~=1 && obj.fluidOption~=2
                error('The number has to be either 1 or 2')
            end
        end
                
        function checkHydraulicType(obj)
            if obj.fluidOption ==1 && ischar(obj.piston.Beta_e) ==1
                error('Compressible option is selected but the bulk modulus (piston.Beta_e) is not defined')
            elseif obj.fluidOption ==2 && ischar(obj.piston.Beta_e)==0
                error('Noncompressible option is selected but the bulk modulus (piston.Beta_e) is used') 
            end
        end
        
        function checkSimpleHydraulicPiston(obj)
            if ischar(obj.piston.topA)==1
                error('topA is not defined')
            elseif ischar(obj.piston.botA)==1
                error('botA is not defined')
            end
        end
                
        function checkHydraulicValve(obj)
            if ischar(obj.valve.Cd)==1
                error('Cd is not defined')
            elseif ischar(obj.valve.Amax)==1
                error('Amax is not defined')
            elseif ischar(obj.valve.Amin)==1
                error('Amin is not defined')  
            elseif ischar(obj.valve.pMax)==1
                error('pMax is not defined')
            elseif ischar(obj.valve.pMin)==1
                error('pMin is not defined') 
            elseif ischar(obj.valve.rho)==1
                error('rho is not defined')  
            elseif ischar(obj.valve.k1)==1
                error('k1 is not defined')                
            end            
        end     
       
        function checkHydraulicValve_k2(obj) 
            if ischar(obj.valve.k2)==1
                error('k2 is not defined')                
            end            
        end    

        function checkLowAccum(obj)
            if ischar(obj.lowAccum.VI0)==1
                error('VI0 is not defined')            
            elseif ischar(obj.lowAccum.pIrated)==1
                error('pIrated is not defined')                  
            end            
        end        
 
        function checkLowAccum_pIupper_limit(obj)
            if ischar(obj.lowAccum.pIupper_limit)==1
                error('pIupper_limit is not defined')                  
            end            
        end 
        
        function checkLowAccum_pIlower_limit(obj)
            if ischar(obj.lowAccum.pIlower_limit)==1
                error('pIlower_limit is not defined')                  
            end            
        end 
        
        function checkLowAccum_pIprecharge(obj)
            if ischar(obj.lowAccum.pIprecharge)==1
                error('pIprecharge is not defined')                  
            end            
        end        
 
        function checkLowAccum_VImax(obj)
            if ischar(obj.lowAccum.VImax)==1
                error('VImax is not defined')                  
            end            
        end          
 
        function checkLowAccum_VImin(obj)
            if ischar(obj.lowAccum.VImin)==1
                error('VImin is not defined')                  
            end            
        end  
        
        function checkLowAccum_VIeq(obj)
            if ischar(obj.lowAccum.VIeq)==1
                error('VIeq is not defined')                  
            end            
        end    
        
        function checkLowAccum_pIeq(obj)
            if ischar(obj.lowAccum.pIeq)==1
                error('pIeq is not defined')                  
            end            
        end          
         
        function checkHighAccum(obj)
            if ischar(obj.highAccum.VI0)==1
                error('VI0 is not defined')
            elseif ischar(obj.highAccum.del_p_r)==1
                error('del_p_r is not defined')
            elseif ischar(obj.highAccum.pIrated)==1
                error('pIrated is not defined')
            elseif ischar(obj.highAccum.pIeq)==1
                error('pIeq is not defined')     
            elseif ischar(obj.highAccum.pIlower_limit)==1
                error('pIlower_limit is not defined')
            elseif ischar(obj.highAccum.pIupper_limit)==1
                error('pIupper_limit is not defined')                 
            elseif ischar(obj.highAccum.pIprecharge)==1
                error('pIprecharge is not defined')
            elseif ischar(obj.highAccum.VIeq)==1
                error('VIeq is not defined')                
            elseif ischar(obj.highAccum.VImax)==1
                error('VImax is not defined')
            elseif ischar(obj.highAccum.VImin)==1
                error('VImin is not defined')                
            end            
        end         

        function checkComplexHydraulicPiston(obj)
            if ischar(obj.piston.Ap)==1
                error('Ap is not defined')
            elseif ischar(obj.piston.Vo)==1
                error('Vo is not defined')
            elseif ischar(obj.piston.Beta_e)==1
                error('Beta_e is not defined')  
            elseif ischar(obj.piston.pAi)==1
                error('pAi is not defined')
            elseif ischar(obj.piston.pBi)==1
                error('pBi is not defined')                 
            end            
        end
        
        function checkHydraulicMotor(obj)
            if ischar(obj.motor.angVelInit)==1
                error('angVelInit is not defined')
            elseif ischar(obj.motor.alpha)==1
                error('alpha is not defined')
            elseif ischar(obj.motor.D)==1
                error('D is not defined')  
            elseif ischar(obj.motor.J)==1
                error('J is not defined')
            elseif ischar(obj.motor.bg)==1
                error('bg is not defined')
            elseif ischar(obj.motor.bf)==1
                error('bf is not defined')                 
            end            
        end        

        function checkGenerator(obj)
            if ischar(obj.gen.TgenBase)==1
                error('TgenBase is not defined')
            elseif ischar(obj.gen.omegaBase)==1
                error('omegaBase is not defined')
            elseif ischar(obj.gen.driveEff)==1
                error('driveEff is not defined')                         
            end            
        end          
        
        function checkDirectDriveVariables(obj)
            if ischar(obj.machine.Rs)==1
                error('Rs is not defined')
            elseif ischar(obj.machine.Bfric)==1
                error('Bfric is not defined')
            elseif ischar(obj.machine.tau_p)==1
                error('tau_p is not defined')
            elseif ischar(obj.machine.lambda_fd)==1
                error('lambda_fd is not defined')
            elseif ischar(obj.machine.Ls)==1
                error('Ls is not defined')  
            elseif ischar(obj.machine.theta_d_0)==1
                error('theta_d_0 is not defined')                
            elseif ischar(obj.machine.lambda_sq_0)==1
                error('lambda_sq_0 is not defined')  
            elseif ischar(obj.machine.lambda_sd_0)==1
                error('lambda_sd_0 is not defined') 
            elseif ischar(obj.ddload.Rload)==1
                error('Rload is not defined') 
            end   
        end

    end
 
end

