function out=Dir2Eul(Tbo)

%%% This Function for transformation from direction cosine matrix to Euler
%%% angles in sequence of 3-2-1

%%% Input
%  Tbo : Direction Cosine Matrix in 3-2-1

%%% Output 
% phi,theta,psi  : Euler angles in roll,pitch and yaw respectively


% %%% angles in sequence of 3-2-1
% 
 theta   = asin(-Tbo(1,3));
 phi = atan2(Tbo(2,3),Tbo(3,3));
 psi = atan2(Tbo(1,2),Tbo(1,1));

%%% angles in sequence of 1-2-3
%  theta   = asin(Tbo(3,1));
%  phi = atan2(-Tbo(3,2),Tbo(3,3));
%  psi = atan2(-Tbo(2,1),Tbo(1,1));

%%% angles in sequence of 2-1-3
%  phi   = -asin(Tbo(3,2));
%  theta = atan2(Tbo(3,1),Tbo(3,3));
%  psi = atan2(Tbo(1,2),Tbo(2,2));



out=[phi,theta,psi]';