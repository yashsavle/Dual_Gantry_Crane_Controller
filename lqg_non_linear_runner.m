function lqg_non_linear_runner()
clc 
clear
x_0= [ 5 ;0.10;0.2;0 ;0;0;0;0;0;0;0;0];

t=0:0.1:50;

[t,x]=ode45(@lqg_non_linear,t,x_0);



plot(t,x(:,:))
end