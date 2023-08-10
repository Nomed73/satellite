%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                  function " IMU "  represent the mathematical model of sensors                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Acc_rd,wbi_gy] = IMU(acc,wbi,Tbi)

% The function " IMU "  represent the mathematical model of IMU 

% inputs  : 

        % acc  : vector of Acceleration 
        % wbi  : vector of SC angular velocity

        
% outputs :

% Sensor_Data : All sensors readings include:
        % acc_rd : Reading of  Accelerometer.
        % wbi_gy  : Gyro reading.


wbi_gy   = Gyro(wbi);
Acc_rd   = Acc(acc,Tbi);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                  function " Gyro "  represent the mathematical model of Angular velocity meter                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

function wbi_gy = Gyro(wbi)

% The function " AVM "  represent the mathematical model of Angular velocity meter 
% inputs  : 
        % wbi    : absolute angular velocities in inertial coordinate system
% outputs :
        % wbi_gy : reading of angular velocity meter
        
% inputs in the form of row vectors while outputs in the form of vectors        
        
 global  IMU h
 

 wbi_gy      = wbi;

 delta_t  = h;                 % Time interval between measurements (s)


if IMU==1
b_gyro   = 0.5/3600*randn(3,1);  % Gyro bias (deg/s)
sigma_rw = 0.07/3600;            % Random walk noise standard deviation (deg/s/sqrt(s))
sf_err   = 3e-5;                % Scale factor error
elseif IMU==2
b_gyro   = 0.2/3600*randn(3,1);  % Gyro bias (deg/s)
sigma_rw = 0.07/3600;            % Random walk noise standard deviation (deg/s/sqrt(s))
sf_err   = 3e-5;                % Scale factor error
elseif IMU==3
b_gyro   = 0.05/3600*randn(3,1);% Gyro bias (deg/s)
sigma_rw = 0.07/3600;           % Random walk noise standard deviation (deg/s/sqrt(s))  
sf_err   = 3e-5;                % Scale factor error
end    
% Gyroscope measurements
wbi_gy = (1+sf_err)*(wbi_gy + b_gyro + sigma_rw * sqrt(delta_t) * randn(3,1));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                  function " Acc "  represent the mathematical model of Accelerometer                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

function acc_rd = Acc(acc,Tbi)

% The function " Acc "  represent the mathematical model of Accelerometer 
% inputs  : 
        % acc    : acceleration true values
% outputs :
        % acc_rd : reading of accelerometer
        
% inputs in the form of row vectors while outputs in the form of vectors        
        
 global  IMU 
 
acc_rd      = Tbi*acc;

if IMU==1
b_acc   = 4000*9.8/(86400*365.25)*randn(3,1);  % Accelerometer bias (m/s^2)
sf_err2   = (2000/(86400*365.25))/10000; % Scale factor error
elseif IMU==2
b_acc   = 1000*9.8/(86400*365.25)*randn(3,1);  % Accelerometer bias (m/s^2)
sf_err2   = (1000/(86400*365.25))/10000; % Scale factor error
elseif IMU==3
b_acc   = 1000*9.8/(86400*365.25)*randn(3,1);  % Accelerometer bias (m/s^2)
sf_err2   = (1000/(86400*365.25))/10000; % Scale factor error
end    
% Accelerometer measurements
acc_rd = (1+sf_err2)*(acc_rd + b_acc);

