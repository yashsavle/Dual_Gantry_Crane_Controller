function dx=diffrential_eqn(t,x)
M=1000;
m1=100;
m2=100;
l1=20;
l2=10;
g=9.81;
C=eye(6);
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
K=lqr(A,B,Q,R);
eig(A-B*K);
u=-K*x;
dx = zeros(6,1);
dx(1)= x(4);
dx(2)= x(5);
dx(3)= x(6);
dx(4)= -((-u) + m1*l1*x(5)^2*sin(x(2)) + m1*g*sin(x(2))*cos(x(2))+ m2*l2*x(6)^2*sin(x(3))+m2*g*sin(x(3))*cos(x(3)))/(M+m1*sin(x(3)^2)+ m2*sin(x(3)^2));
dx(5)= -((-u) +(M+m1)*g*sin(x(2)) + m1*l1*sin(x(2))*cos(x(2))*x(5)^2 + m2*l2*sin(x(3))*cos(x(3))*x(6)^2 + m2*g*sin(x(3))*cos(x(2)-x(3)))/(( M+ m1*sin(x(2)^2)+ m2*(sin(x(3)^2)))*l1);
dx(6)= -((-u) + m1*l1*sin(x(2))*cos(x(3))*x(5)^2 +m1*g*sin(x(2))*cos(x(2)-x(3)) + (M+m1)*g*sin(x(3))+m2*l2*x(3)^2*sin(x(3))*cos(x(3)))/(( M+ m1*sin(x(3)^2)+ m2*(sin(x(3)^2)))*l2);
end
