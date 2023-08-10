%===================================================================================================================================%
%                                                    Sub function  oe2rv                                                            %                                         
%===================================================================================================================================%

function [ri,vi] = oe2rv(oel)

% The object of this function "oe2rv" is to transform from classical orbital elements to r and v in inertial frame of reference
% inputs  :
         % oel : classical orbital elements (a e i Om om nu) where :
              %  a semimajor axis  
              %  e Eccentricity
              %  i Inclination,rad
              %  Om RAAN,rad
              %  om Arg. of perigee,rad
              %  nu True anomaly,rad 
              
% outputs :
         % ri  : position vector of the spacecraft in Inertial coordinate system 
         % vi  : velocity vector of the spacecraft in Inertial coordinate system  
         
 global mu        
    mu     = 3.98600441500*10^5 ;
    a  =  oel(1); 
    e  =  oel(2);
    i  =  oel(3); 
    Om =  oel(4);
    om =  oel(5);
    nu =  oel(6);
	p  =  a*(1-e*e);
	r  =  p/(1+e*cos(nu));
	rv = [r*cos(nu); r*sin(nu); 0];			         % in PQW frame
	vv = sqrt(mu/p)*[-sin(nu); e+cos(nu); 0];

%	now rotate

	cO = cos(Om);  sO = sin(Om);
	co = cos(om);  so = sin(om);
	ci = cos(i);   si = sin(i);
    
	R  = [cO*co-sO*so*ci  -cO*so-sO*co*ci  sO*si;
		  sO*co+cO*so*ci  -sO*so+cO*co*ci -cO*si;
		  so*si            co*si           ci];
	ri = R*rv;                                       % in IJK frame
	vi = R*vv;
