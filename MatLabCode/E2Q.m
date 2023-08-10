%===================================================================================================================================%
%                                                    Sub function  E2Q                                                             %                                         
%===================================================================================================================================%

function out = E2Q(phi,theta,psi)

% The object of this function "E2Q" is to transform Euler angles to Quaterion (2-1-3)
% inputs  :
         % phi,theta,psi  in rad
                           
% outputs :
         % out  : Quaterion vector
% 
%%% "E2Q" is to transform Euler angles to Quaterion (2-1-3)
  q0  =  cos(theta/2)*cos(phi/2)*cos(psi/2)+sin(theta/2)*sin(phi/2)*sin(psi/2);   % q0 is the scaler part Quaternion vector
  q1  =  cos(theta/2)*sin(phi/2)*cos(psi/2)+sin(theta/2)*cos(phi/2)*sin(psi/2);   % q1, q2, and q3 is the vector part the quaternion 
  q2  = -cos(theta/2)*sin(phi/2)*sin(psi/2)+sin(theta/2)*cos(phi/2)*cos(psi/2);  
  q3  =  cos(theta/2)*cos(phi/2)*sin(psi/2)-sin(theta/2)*sin(phi/2)*cos(psi/2);

% %%% "E2Q" is to transform Euler angles to Quaterion (1-2-3)
%   q0  =  cos(phi/2)*cos(theta/2)*cos(psi/2)-sin(phi/2)*sin(theta/2)*sin(psi/2);   % q0 is the scaler part Quaternion vector
%   q1  =  cos(phi/2)*sin(theta/2)*sin(psi/2)+sin(phi/2)*cos(theta/2)*cos(psi/2);   % q1, q2, and q3 is the vector part the quaternion 
%   q2  =  cos(phi/2)*sin(theta/2)*cos(psi/2)-sin(phi/2)*cos(theta/2)*sin(psi/2);  
%   q3  =  cos(phi/2)*cos(theta/2)*sin(psi/2)+sin(phi/2)*sin(theta/2)*cos(psi/2);

% % % %%% "E2Q" is to transform Euler angles to Quaterion (3-2-1)
%   q0  =  cos(psi/2)*cos(theta/2)*cos(phi/2)+sin(psi/2)*sin(theta/2)*sin(phi/2);   % q0 is the scaler part Quaternion vector
%   q1  =  cos(psi/2)*cos(theta/2)*sin(phi/2)-sin(psi/2)*sin(theta/2)*cos(phi/2);   % q1, q2, and q3 is the vector part the quaternion 
%   q2  =  cos(psi/2)*sin(theta/2)*cos(phi/2)+sin(psi/2)*cos(theta/2)*sin(phi/2);  
%   q3  = -cos(psi/2)*sin(theta/2)*sin(phi/2)+sin(psi/2)*cos(theta/2)*cos(phi/2);
% 

%   out = [ q1 q2 q3 q0]';
  out = [q1 q2 q3 q0]';
%   out=sign(q0)*out;