function dx=lqg_non_linear(t,x)

M=1000;
m1=100;
m2=100;
l1=20;
l2=10;
g=9.81;
C=[1 0 0 0 0 0];
D=[0];
A=[0 0 0 1 0 0
    0 0 0 0 1 0
    0 0 0 0 0 1
    0 -m1*g/M -m2*g/M 0 0 0
    0 -g*(M+m1)/M/l1 -g*m2/M/l1 0 0 0
    0 -g*m1/M/l2 -g*(M+m2)/M/l2 0 0 0];
B=[0 0 0 1/M 1/M/l1 1/M/l2]';
Q=[1 0 0 0 0 0;0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 0 60 0 0; 0 0 0 0 150 0; 0 0 0 0 0 150];
R=0.0001;
% p=[-5;-2;-1;-9;-6;-7]';            %change eigen values
% x_0= [ 5 ; 0; 0.1 ; 0 ; 0.2; 0;0;0;0;0;0;0];              
Kr=lqr(A,B,Q,R);

vd=0.3*eye(6);
vn=1;
Kf=lqr(A',C',vd,vn);
Kf=Kf';
u=-Kr*x(1:6);

sigma_dot=(A-Kf*C)*x(7:12);
dx1(1)= x(4);
dx1(2)= x(5);
dx1(3)= x(6);
dx1(4)= -((-u) + m1*l1*x(5)^2*sin(x(2)) + m1*g*sin(x(2))*cos(x(2))+ m2*l2*x(6)^2*sin(x(3))+m2*g*sin(x(3))*cos(x(3)))/(M+m1*sin(x(3)^2)+ m2*sin(x(3)^2));
dx1(5)= -((-u) +(M+m1)*g*sin(x(2)) + m1*l1*sin(x(2))*cos(x(2))*x(5)^2 + m2*l2*sin(x(3))*cos(x(3))*x(6)^2 + m2*g*sin(x(3))*cos(x(2)-x(3)))/(( M+ m1*sin(x(2)^2)+ m2*(sin(x(3)^2)))*l1);
dx1(6)= -((-u) + m1*l1*sin(x(2))*cos(x(3))*x(5)^2 +m1*g*sin(x(2))*cos(x(2)-x(3)) + (M+m1)*g*sin(x(3))+m2*l2*x(3)^2*sin(x(3))*cos(x(3)))/(( M+ m1*sin(x(3)^2)+ m2*(sin(x(3)^2)))*l2);
dx1(7)=x(4)-x(10);
dx1(8)=x(5)-x(11);
dx1(9)=x(6)-x(12);
dx1(10)=dx1(4)-sigma_dot(4);
dx1(11)=dx1(5)-sigma_dot(5);
dx1(12)=dx1(6)-sigma_dot(6);



Acc=[(A-B*Kr) (B*Kr); zeros(size(A)) (A-Kf*C)];
Bcc=[B;zeros(size(B))];
Ccc=[C zeros(size(C))];
Dcc=[0];
Qcc=eye(12)*10;
Rcc=0.01;
Ksyslqr=lqr(Acc,Bcc,Qcc,Rcc);
xcc=x;
u=-Ksyslqr*x;
Xdot=Acc*xcc+Bcc*u;
dx=Xdot;
dx=dx1';


end





