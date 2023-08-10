%===================================================================================================================================%
%                                                    Sub function  Qconj                                                             %                                         
%===================================================================================================================================%

function out = Qconj(x)

% The object of this function " Qconj " is to calculate the conjugate of quaternion
% inputs  : 
         % x    : quaternion
         
% outputs  :
         % out  : conjugate of quaternion

 x0  = x(4);
 xv  = x(1:3);
 out = [-xv; x0];