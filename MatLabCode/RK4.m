%===================================================================================================================================%
%                                                    Sub function   RK4                                                             %                                         
%===================================================================================================================================%

function [y,ydot] = RK4(fun,t,y)

% The object of this function " RK4 " is to integrate a system of differntial equations using  Runge Kutta 4 fixed step method 

% inputs  :
         % fun : function type.
         % t   : current time of simulation from epoch, sec
         % y   : vector of previous states 
         
% outputs :
         % y   : vector of current states 
         
global h 

    k1   = fun(t,y);
    k2   = fun(t+.5*h,y +.5*k1*h);
    k3   = fun(t+.5*h,y +.5*k2*h);
    k4   = fun(t+h,y + k3*h);
    y    = y +h*(k1+2*k2+2*k3+k4)/6;

    ydot = (k1+2*k2+2*k3+k4)/6;