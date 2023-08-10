%===================================================================================================================================%
%                                                    Sub function  latlon                                                           %                                         
%===================================================================================================================================%

function out = latlon(ri,theta)

% The object of this function "latlon" is to transform inertial frame (I,J,K) to latitude and longtitude 
% inputs  :
         % ri       : position vector of the spacecraft in Inertial coordinate system 
         % theta    : longitude of greenwich sideral time, rad
         
% outputs :
         % out : [lamda  phigd phigc hell], where :
              %  lamda : longtitude of the subsatellite point,rad 
              %  phigd : geodetic latitude of the subsatellite point,rad 
              %  phigc : geocentric latitude of the subsatellite point,rad 
              %  hell  : height of the satellite above the reference ellipsoid, km
              
% referances
        % valado             
                            
global Re eE latlonalt
 
 r    = norm(ri);
 x    = ri(1);
 y    = ri(2);
 z    = ri(3);
 rdel = (x^2+y^2)^.5;
 sa   = y/rdel;
 ca   = x/rdel;
 alfa = atan2(sa,ca);
 lamda= alfa-theta;
 lamda= mod(lamda,2*pi);
 sdel = z/r ;
 cdel = rdel/r;
 
 phigdo = atan2(sdel,cdel); 
 C      = Re/(1-eE^2*sin(phigdo)^2)^.5;
 phigd  = atan((z+C*eE^2*sin(phigdo))/rdel);
 
 while abs(phigd-phigdo)>eps
     phigdo = phigd;
     C      = Re/(1-eE^2*sin(phigdo)^2)^.5;
     phigd  = atan((z+C*eE^2*sin(phigdo))/rdel);
 end
 
 hell  = rdel/cos(phigd)-C;
 phigc = atan((1-eE^2)*tan(phigd));
 latlonalt   = [lamda  phigd phigc hell ];
 out   = [lamda  phigd phigc hell ]';
