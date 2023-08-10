%===================================================================================================================================%
%                                                    Sub function  JD                                                               %                                         
%===================================================================================================================================% 

function out =JD(Y,M,D,H,Min,S)

% The object of this function "JD " is to calculate the julian day from the date
% inputs  : 
         % Y    : year   ex 2000
         % M    : Month number  ex jan. ==1
         % D    : day number
         % H    : hours
         % Min  : minutes
         % S    : seconds
% outputs  :
         % out  : julian day  

out  = 367*Y-fix(7*(Y+fix((M+9)/12))/4)+fix(275*M/9)+D+1721013.5+H/24+Min/1440+S/86400 ;