
%===================================================================================================================================%
%                                                     initial_main_data                                                             %                                         
%===================================================================================================================================%
clc

global s2d m2d rad 

m2d    = 1/60;
s2d    = 1/3600;
rad    = pi/180;


%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% Satellite Main Parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


global J

g      = 9.80665;                                    % Acceleration constant  ,m/sec2

J      = [6     0   0                        % satellite inertia tensor [ Jxx  -Jxy  -Jxz
          0     8    0                        %                           -Jyz   Jyy  -Jyz
          0     0    4];                     %                           -Jzx  -Jzy   Jzz ] , kg.m2
       
%===================================================================================================================================%
%                                                    Constant parameters                                                            %                                         
%===================================================================================================================================%
global Re mu we g AU eE wea h 

mu     = 3.98600441800*10^5 ;                        % Earth Gravitational constant  km3.s-2
Re     = 6378.1363 ;                                 % Earth mean equatorial radius km
we     = 7.2921158553e-5;                            % Earth rotation rad/sec included siderial time tranformation
g      = 9.80665;                                    % Acceleration constant  ,m/sec2
AU     = 149597870;                                  % Asrtonomical units,km
eE     = .081819221456;                              % Earth eccentricity
wea    = 755.5e-7;                                   % sum of angular velocities of the Earth and air rotation ,rad/sec
h      = 1;                                         % Time Step, sec
%===================================================================================================================================%
%                                              Initial data of simulation (GPS DATA)                                                           %                                         
%===================================================================================================================================%
global  lamdao T t

T =datevec(datetime);
% T= [2023 06 01 00 00 00];                              % Starting Date.
lamdao   = GST(T);                                     % Greenwich sidereal time at epoch,rad
t        = 0;

global Q wbi ri_r vi_r OE Euler Angularv
Eul_in = Euler*rad;
Q      = E2Q(Eul_in(1),Eul_in(2),Eul_in(3));                         
wbi    = Angularv'*rad;
[ri_r,vi_r]   = oe2rv(OE);




