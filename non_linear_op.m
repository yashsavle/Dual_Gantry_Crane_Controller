clc
clear

x_0= [ 5 ;0.10;0.2;0 ;0;0];

t=0:0.01:100;

[t,x]=ode45(@diffrential_eqn,t,x_0)
plot(t,x);
