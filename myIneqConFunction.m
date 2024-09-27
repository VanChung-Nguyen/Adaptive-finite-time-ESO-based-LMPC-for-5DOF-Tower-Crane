function cineq = myIneqConFunction(X,U,e,data)
p = data.PredictionHorizon;
Ts = data.Ts;
U1 = U(1:p,data.MVIndex(1));
U2 = U(1:p,data.MVIndex(2));
U3 = U(1:p,data.MVIndex(3));
X1 = X(2:p+1,1);X6 = X(2:p+1,6);
X2 = X(2:p+1,2);X7 = X(2:p+1,7);
X3 = X(2:p+1,3);X8 = X(2:p+1,8);
X4 = X(2:p+1,4);X9 = X(2:p+1,9);
X5 = X(2:p+1,5);X10 = X(2:p+1,10);
%-----------------------------------------------------------------------
q1 = [X(1,6);X(1,7);X(1,8)];
q2 = [X(1,9);X(1,10)];
dq1 = [X(1,1);X(1,2);X(1,3)];
xt=X(1,7);
l = X(1,8);
phi = X(1,8);
theta = X(1,10);
q1d=[data.References(1);data.References(2);data.References(3)];


mt=1140.7556;
j0=10215;
m=500;

m11=j0+m*xt^2+mt*xt^2+m*l^2-m*l^2*cos(phi)^2*cos(theta)^2+2*m*xt*l*cos(theta)*sin(phi);
m12=-m*l*sin(theta);
m13=m*xt*sin(theta);
m14=-m*l^2*cos(phi)*cos(theta)*sin(theta);
m15=m*l^2*sin(phi)+m*xt*l*cos(theta);
m21=-m*l*sin(theta);
m22=mt+m;
m23=m*cos(theta)*sin(phi);
m24=m*l*cos(phi)*cos(theta);
m25=-m*l*sin(phi)*sin(theta);
m31=m*xt*sin(theta);
m32=m*cos(theta)*sin(phi);
m33=m;
m34=0;
m35=0;
m41=-m*l^2*cos(phi)*cos(theta)*sin(theta);
m42=m*l*cos(phi)*cos(theta);
m43=0;
m44=m*l^2*cos(theta)^2;
m45=0;
m51=m*l^2*sin(phi)+m*xt*l*cos(theta);
m52=-m*l^2*sin(phi)*sin(theta);
m53=0;
m54=0;
m55=m*l^2;
M11=[m11 m12 m13;m21 m22 m23;m31 m32 m33];
M12=[m14 m15;m24 m25; m34 m35];
M21=[m41 m42 m43;m51 m52 m53];
M22=[m44 m45;m54 m55];
Mbar = M11 - M12*inv(M22)*M21;
lambda = 2*diag([0.55 0.65 0.5]);
alpha = 0.4*[0.5 0; 0 0.5; 0.25 0.25];
kappa = 0.2*diag([0.5 0.5 0.5]);
s = dq1 + lambda*(q1-q1d) + alpha*q2;
Vdot=-s'*lambda*s-s'*inv(Mbar)*kappa*sign(s);

tmax=2000;
fxmax=200;
flmax=7000;


tamax=pi;
vtamax=0.1;
xmax=30;
vxmax=0.4;
lmax=60;
vlmax=1;
txmax=0.05;
tymax=0.05;


cineq = [U1-tmax;
    U2-fxmax;
    U3-flmax;
    -U1-tmax;
    -U2-fxmax;
    -U3-flmax;
   X1-vtamax;X2-vxmax;X3-vlmax;
   -X1-vtamax;-X2-vxmax;-X3-vlmax;
   X6-tamax;X7-xmax;X8-lmax;X9-txmax;X10-tymax;
   -X6-tamax;-X7;-X8;-X9-txmax;-X10-tymax;
   Vdot-data.MDIndex(1);
   ];
end