%===================================================================================================================================%
%                                                    Sub function  Q2E                                                             %                                         
%===================================================================================================================================%

function out = Q2E(Q)

% The object of this function "Q2E" is to transform Quaterion to Euler angles
% inputs  :
         % Q    : Quaterion vector
                           
% outputs :
         % out  : Euler angles, rad

 
 Tbo   = TBO(Q); 
 out=Dir2Eul(Tbo);
