%===================================================================================================================================%
%                                                    Sub function  IO                                                               %                                         
%===================================================================================================================================%

function [Tio,wio] = IO(ri,vi)

% The object of this function " Tio " is to transform from orbital coordinate to inertial coordinate system during simulation
% and " wio " the angular velocity of orbital coordinate w.r.t inertial coordinate system (wio)
 
% inputs  : 
         % ri  : position vector of the spacecraft in Inertial coordinate system 
         % vi  : velocity vector of the spacecraft in Inertial coordinate system  
         % ai  : acceleration vector of the spacecraft in Inertial coordinate system 
         
% outputs  :
         % Tio : transformation matrix from orbital coordinate to inertial
         % coordinate system during simulation
         % wio : the angular velocity of orbital coordinate w.r.t inertial coordinate system (wio)

% referances
        % M.sidi : Chapter 4 Equation  4.7.14
        % valado : Chapter 1 Equation  1-26 (Rearrange the Axes)

global rad        
% Z    = ri/norm(ri);
% Y    = crosss(ri,vi)/norm(crosss(ri,vi));
% X    = crosss(Y,Z);
% Tio  = [ X Y Z];
% Tio=Tio*Rot1(pi);

%%%% Marchil Sidi  %%%
Z    = -ri/norm(ri);
Y    = cross(vi,ri)/norm(cross(vi,ri));
X    = cross(Y,Z);
Tio  = [ X Y Z];



% referances
        % valado
        % M.sidi : Chapter 4 Equation Equations (4.7.16,17,18,19)
        
% wi   =  0;
% wj   =  dot(vi,(norm(ri)^2*vi-dot(ri,vi)*ri))/(norm(ri)^2*norm(crosss(ri,vi)));
% wk   = -dot(crosss(ri,ai),(norm(ri)^2*vi-dot(ri,vi)*ri))/(norm(ri)*norm(crosss(ri,vi))^2);      
% wio  = [ wi wj wk]';

%%%% Marchil Sidi  %%%
wi   =  0;
wj   =  -dot(vi,(dot(ri,vi)*ri)-(norm(ri)^2)*vi)/(norm(ri)^2*norm(cross(vi,ri)));
wk   = 0;
wio  = [ wi -wj wk]'; 