
%===================================================================================================================================%
%                                                    Sub function  kinematic                                                        %                                         
%===================================================================================================================================%

function [Qdot,Tbo,wbo] = kinematic(Q,wbi,wio)

% The object of this function " kinematic  " is describ the relative motion between BCS and OCS (kinematic equation)  
% inputs  :
         % Hw     : reaction wheel momentum
         % Q ,wbi : vectors of SC  absolute angular velocity and Quaternion 
         % wio    : orbital angular velocities
      
         
% outputs :
         % Tbo    : transformation matrix from orbital coordinate to body coordinate system
         % wbo    : relative angular velocity between orbital coordinate and body coordinate system
         % Qdot   : Qaternion rate between orbital coordinate and body coordinate system
         
         Tbo   = TBO(Q);
         wbio  = Tbo*wio;
         wbo   = wbi-wbio;
         
         QQ    = [  Q(4) -Q(3)  Q(2)
                    Q(3)  Q(4) -Q(1)
                   -Q(2)  Q(1)  Q(4)
                   -Q(1) -Q(2) -Q(3)];
          Q=Q/norm(Q);       
          Qdot   =  0.5*QQ*wbo;
       