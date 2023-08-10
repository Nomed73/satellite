function f = Dyn_M(t,y)

% The object of this function " Dyn_M " is to calculate the rate vector of states which will be integrated

% inputs  :
         % t  : current time of simulation, sec
         % y  : vector of states ( i.e angular velocity vector, Quaternion)
% outputs :
         % f : rate vector of states ( i.e  angular acceleration , Quaternion Derivatives)
         
 global J 
 
 wio  =[0 0.0011 0]';
 wbi  = y(1:3);
 Q    = y(4:7)/norm(y(4:7)) ;                            % normalization of the quaternion
 
 Q=Q/norm(Q);
 qo  = Q(4);
 q   = Q(1:3);
 
 ko = [2*(q(1)*q(3)-q(2)*qo)
       2*(q(2)*q(3)+q(1)*qo)
      -q(1)^2-q(2)^2+q(3)^2+qo^2 ];


 Mg    = 3*wio(2)^2*cross(ko,J*ko);

 wbidot = inv(J)*(Mg-cross(wbi,(J*wbi)));
 Qdot   = kinematic(Q,wbi,wio);
 f    = [wbidot;Qdot];