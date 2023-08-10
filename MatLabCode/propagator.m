%===================================================================================================================================%
%                                                    Sub function propagator                                                             %                                         
%===================================================================================================================================%

function yd=propagator(t,y)

% The object of this function " propagator " is to to calculate 2-body 
% acceleration for any object 

% inputs  :

         % y      : vector of previous states 
         
% outputs :
         % y      : vector of current states 

global mu

ri=y(1:3);
vi=y(4:6);

r=norm(ri);

ai = -mu*ri/r^3;

%%%% Simplified Acceleration Model  of Vallado %%%%
yd=[vi;ai];

