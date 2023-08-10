%===================================================================================================================================%
%                                                    Sub function  TBO                                                              %                                         
%===================================================================================================================================%

function out = TBO(Q) 

% The object of this function " TOB " is to transform from orbital coordinate to body coordinate during simulation
% inputs  : 
         % Q   : Quaternion vector of spacecraft Q =[q1 q2 q3 q0]'
% outputs :
         % out : transformation matrix from orbital coordinate to body coordinate during simulation
% referances
         % M.sidi

qo  = Q(4);
q   = Q(1:3);

   
Tbo = [q(1)^2-q(2)^2-q(3)^2+qo^2   2*(q(1)*q(2)+q(3)*qo)       2*(q(1)*q(3)-q(2)*qo)
       2*(q(1)*q(2)-q(3)*qo)      -q(1)^2+q(2)^2-q(3)^2+qo^2   2*(q(2)*q(3)+q(1)*qo)
       2*(q(1)*q(3)+q(2)*qo)       2*(q(2)*q(3)-q(1)*qo)      -q(1)^2-q(2)^2+q(3)^2+qo^2 ];
   
%    
%    Tbo = [q(1)^2-q(2)^2-q(3)^2+qo^2   2*(q(1)*q(2)-q(3)*qo)       2*(q(1)*q(3)-q(2)*qo)
%            2*(q(1)*q(2)+q(3)*qo)      -q(1)^2+q(2)^2-q(3)^2+qo^2   2*(q(2)*q(3)-q(1)*qo)
%            2*(q(1)*q(3)+q(2)*qo)       2*(q(2)*q(3)+q(1)*qo)      -q(1)^2-q(2)^2+q(3)^2+qo^2 ];
    out = Tbo;         
% Q=reshape(Q,1,4);
% [r3 r2 r1]=quat2angle(Q,'zyx');
% 
%           c = cos(r3); s = sin(r3);
%           Rotz = [ c s 0; -s c 0; 0 0 1];
%           c = cos(r2); s = sin(r2);
%           Roty = [ c 0 -s; 0 1 0; s 0 c];
%           c = cos(r1); s = sin(r1);
%           Rotx = [ 1 0 0; 0 c s; 0 -s c ];
% Tbo=Rotx*Roty*Rotz;
