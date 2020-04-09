
M=1000;
m1=100;
m2=100;
l1=20;
l2=10;
g=9.81;
C=[1 0 0 0 0 0];
D=[0];
type=1;
A=[0 0 0 1 0 0
    0 0 0 0 1 0
    0 0 0 0 0 1
    0 -m1*g/M -m2*g/M 0 0 0
    0 -g*(M+m1)/M/l1 -g*m2/M/l1 0 0 0
    0 -g*m1/M/l2 -g*(M+m2)/M/l2 0 0 0];
B=[0 0 0 1/M 1/M/l1 1/M/l2]';
Q=[1 0 0 0 0 0;0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 0 60 0 0; 0 0 0 0 150 0; 0 0 0 0 0 150];
R=0.0001;
x_0= [ 5 ; 0; 0.1 ; 0 ; 0.2; 0;0;0;0;0;0;0];
Kr=lqr(A,B,Q,R);
eig(A-B*Kr)
vd=0.3*eye(6);
vn=1;
Kf=lqr(A',C',vd,vn);
Kf=Kf';
eig(A-Kf*C);

x_0= [ 5 ; 0; 0.1 ; 0 ; 0.2;0;0;0;0;0;0;0];

if type==1

system=ss([(A-B*Kr) (B*Kr); zeros(size(A)) (A-Kf*C)],[B;zeros(size(B))],[C zeros(size(C))],[0]);
initial(system,x_0)
end

if type==2

system=ss([(A-B*Kr) (B*Kr); zeros(size(A)) (A-Kf*C)],[B;zeros(size(B))],[C zeros(size(C))],[0]);
step(system)
end