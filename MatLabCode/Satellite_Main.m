%===================================================================================================================================%
%                                                   Main function                                                      %                                         
%===================================================================================================================================% 
 
function Satellite_Main

% The object of this function is to simulate ADCS Estimation and control algorithms during simulation

% inputs  :
         % Sensor_Data : Sensor readings.         

global wbi Q Period
Initial_Data;
% h=10;
ix=1;
for t=0:h:Period
         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         %% Orbit Propagator  %%
         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         fun                  = @propagator;
         yv                   = [ri_r;vi_r];
         [yv,yvdot]           = RK4(fun,t,yv); 
         ri_r                 = yv(1:3);
         vi_r                 = yv(4:6);
         [Tio,wio]            = IO(ri_r,vi_r);
         lamda                = lamdao+we*t;

         latlonli             = latlon(ri_r,lamda);

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
         
         fun                  = @Dyn_M;
         yv                   = [wbi;Q];
         [yv,yvdot]           = RK4(fun,t,yv); 
         wbi                  = yv(1:3);
         Q                    = yv(4:7)/norm(yv(4:7));
         Tbo                  = TBO(Q);
         Tbi                  = Tbo*Tio';
         latlonaltt(ix,:)     =[latlonli(1)-pi,latlonli(2)];
         
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
         [acc_rd,wbi_gy] = IMU(yvdot(4:6),wbi,Tbi);

         if rem(t,600)==0
             ri_m =ri_r;
             vi_m =vi_r;
             Qm   =Q;
         else
             ri_m =IMU_Data(1:3);
             vi_m =IMU_Data(4:6);
             Qm   =IMU_Data(7:10);
         end

         [IMU_Data] = IMU_Results(acc_rd,wbi_gy,ri_m,vi_m,Qm,wio,lamda);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Saved Data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tt(ix)        = t;
ri_real(ix,:) = ri_r;
vi_real(ix,:) = vi_r;
ang_real(ix,:) = Q2E(Q)*180/pi;
wbi_real(ix,:) = wbi*180/pi;
latt_real(ix)  = (latlonli(1)-pi)*180/pi;
long_real(ix)  = (latlonli(2))*180/pi;

ri_imu(ix,:) =IMU_Data(1:3);
vi_imu(ix,:) =IMU_Data(4:6);
ang_imu(ix,:) =Q2E(IMU_Data(7:10))*180/pi;
wbi_imu(ix,:) =wbi_gy*180/pi;
latt_imu(ix)   =(IMU_Data(14)-pi)*180/pi;
long_imu(ix)   =(IMU_Data(15))*180/pi;

         ix=ix+1;
end   


%===================================================================================================================================%
%                                                            Output file                                                           %                
%===================================================================================================================================%

% % The function "Ouput file " is the function used for saving Output Data of the spacecraft during different mode of operation
% 
Names={'Time , min',
               'Exact Longitude ,Deg',
               'Exact Lattitude ,Deg',
               'IMU Longitude ,Deg',
               'IMU Lattitude ,Deg',
               'Exact Position ,Km',
               'Exact Velocity ,Km/sec',
               'Exact Euler Angles ,Deg',
               'Exact Angular Velocities ,Deg/sec',
               'IMU Position ,Km',
               'IMU Velocity ,Km/sec',
               'IMU Euler Angles ,Deg',
               'IMU Angular Velocities ,Deg/sec'};               

Legends={'T , min',
               'Longitude ',
               'Lattitude ',
               'Longitude ',
               'Lattitude ',
               {'X' ,'Y' ,'Z '},
               {'V_x' ,'V_y' ,'V_z'},
               {'\Phi' ,'\Theta' ,'\Psi '}, 
               {'wx' ,'wy' ,'wz '},
               {'X' ,'Y' ,'Z '},
               {'V_x' ,'V_y' ,'V_z'},
               {'\Phi' ,'\Theta' ,'\Psi '},
               {'wx' ,'wy' ,'wz '}};

           Values={tt',latt_real',long_real',latt_imu',long_imu',...
               ri_real,vi_real,ang_real,wbi_real, ...
               ri_imu,vi_imu,ang_imu,wbi_imu};

           Values=Values';


           Output=struct('Names',Names,'Legends',Legends,'Values',Values);
           save('Output2.mat','Output');