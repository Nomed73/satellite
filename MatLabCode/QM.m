%===================================================================================================================================%
%                                                    Sub function  QM                                                               %                                         
%===================================================================================================================================%

function out = QM(x,y)

% The object of this function "QM" to get the Quaternion multiplication of x and y
% inputs  :
         % x,y  : Quaterion vectors
                           
% outputs :
         % out  : Quaternion multiplication of x and y
         
x0  = x(4);
xv  = x(1:3);
y0  = y(4);
yv  = y(1:3);

out = [ y0*xv+x0*yv+crosss(xv,yv) ; x0*y0-dot(xv,yv)];
