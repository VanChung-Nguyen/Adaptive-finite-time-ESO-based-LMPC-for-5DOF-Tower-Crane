function J = myCostFunction(X,U,e,data)
p = data.PredictionHorizon;
Y1=data.References(1,1);
Y2=data.References(1,2);
Y3=data.References(1,3);
Y4=data.References(1,4);
Y5=data.References(1,5);
Y6=data.MVTarget(1,1);
Y7=data.MVTarget(1,2);
Y8=data.MVTarget(1,3);

U1 = U(1:p,data.MVIndex(1))-Y6;
U2 = U(1:p,data.MVIndex(2))-Y7;
U3 = U(1:p,data.MVIndex(3))-Y8;
X1 = X(2:p+1,1);X6 = X(2:p+1,6)-Y1;
X2 = X(2:p+1,2);X7 = X(2:p+1,7)-Y2;
X3 = X(2:p+1,3);X8 = X(2:p+1,8)-Y3;
X4 = X(2:p+1,4);X9 = X(2:p+1,9)-Y4;
X5 = X(2:p+1,5);X10 = X(2:p+1,10)-Y5;
J = 0.01*sum(sum(U1.^2))+0.01*sum(sum(U2.^2))+0.01*sum(sum(U3.^2)) + 10000*sum(sum(X6.^2)) +4000*sum(sum(X7.^2))  +12000*sum(sum(X8.^2))  + 12000*sum(sum(X9.^2)) + 12000*sum(sum(X10.^2));
end