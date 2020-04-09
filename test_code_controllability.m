clc
clear
syms m1 m2 M l1 l2 x t1 t2 xdot t1dot t2dot F g
M=1000;
m1=100;
m2=100;
l1=20;
l2=10;
g=9.81;
x_0= [ 5 ; 0; 0.1 ; 0 ; 0.2; 0];
C=eye(6);
D=[0];
A=[0 0 0 1 0 0
    0 0 0 0 1 0
    0 0 0 0 0 1
    0 -m1*g/M -m2*g/M 0 0 0
    0 -g*(M+m1)/M/l1 -g*m2/M/l1 0 0 0
    0 -g*m1/M/l2 -g*(M+m2)/M/l2 0 0 0];
B=[0 0 0 1/M 1/M/l1 1/M/l2]';
Cont=([B A*B A*A*B A*A*A*B A*A*A*A*B A*A*A*A*A*B]);
rank(Cont)
d=((det(Cont)))

Q=[1 0 0 0 0 0;0 1 0 0 0 0; 0 0 100 0 0 0; 0 0 0 1000 0 0; 0 0 0 0 150 0; 0 0 0 0 0 1500]
R=0.001;
K=lqr(A,B,Q,R);
eig(A-B*K)
sys=ss(A-B*K,B,C,D)
initial(sys,x_0)

