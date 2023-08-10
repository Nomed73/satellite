%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                  function " IMU_Results"  represent the mathematical model of sensors                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [IMU_Data] = IMU_Results(Acc_rd,wbi_gy,ri,vi,Q,wio,lamda)

% The function " IMU_Results "  represent the mathematical model

% inputs  : 
        % acc_rd : Reading of  Accelerometer.
        % wbi_gy  : Gyro reading.

        
% outputs :

% Sensor_Data : All sensors readings include:
        % acc_rd : Reading of  Accelerometer.
        % wbi_gy  : Gyro reading.
global h

Qdot = kinematic(Q,wbi_gy,wio);
Q    = Q+ Qdot*h;
Q    = Q/norm(Q);

ai   = TBO(Q)'*Acc_rd;
vi   = vi+ ai*h;
ri   = ri+ vi*h;


latlon2= latlon(ri,lamda);

IMU_Data = [ri;vi;Q;wbi_gy;latlon2(1:2)];













