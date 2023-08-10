%===================================================================================================================================%
%                                                    Sub function   GST                                                             %                                         
%===================================================================================================================================%

function lamda = GST(T)

% The object of this function " GST " is to calculate the Greenwich sidereal time during simulation

% inputs  : 
         % T     : starting time of the simulation (epoch) [year month day hour minute sec]
        
% outputs :
         % lamda : greenwich siderial time, rad

global rad

Y      = T(1);
M      = T(2);
D      = T(3);
H      = T(4);
Min    = T(5);
S      = T(6);
                                      
JDUT1  = JD(Y,M,D,H,Min,S);
TUT1   = (JDUT1-2451545)/36525;
lamda  = 67310.54841+(876600*60^2+8640184.812866)*TUT1+.093104*TUT1^2-6.2e-6*TUT1^3;  % seconds   
lamda  = mod(lamda,24*60*60);  
lamda  = lamda/240*rad;
 
