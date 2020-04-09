M  = 1000;       % M      mass of cart 
m1 = 100;        % m1     mass of bob 1 
m2 = 100;        % m2     mass of bob 2 
l1 = 20;         % l1     length of link of first pendulum 
l2 = 10;         % l2     length of link of second pendulum 
g  = 9.8;         % g 

A =[0 0 0 1 0 0 ; 0 0 0 0 1 0;0 0 0 0 0 1; 0 (-m1*g/M) (-m2*g/M) 0 0 0;
    0 (-g*(M+m1)/(M*l1)) (-m2*g/(M*l1)) 0 0 0 ; 0 (-m1*g/(M*l2)) (-g*(M+m2)/(M*l2)) 0 0 0 ]
% Observability for X(t)
C_1=[1 0 0 0 0 0];
O_1 = [C_1;C_1*A;C_1*A^(2);C_1*A^(3);C_1*A^(4);C_1*A^(5)];
if rank(O_1)==6;
    disp('The system is observable for output x(t)')
    else
    disp('The system is not observable for output x(t)')
end

% Observability for t_1,t_2
C_2=[0 1 0 0 0 0; 0 0 1 0 0 0];
O_2 = [C_2;C_2*A;C_2*A^(2);C_2*A^(3);C_2*A^(4);C_2*A^(5)];
if rank(O_2)==6;
    disp('The system is observable for output t_1,t_2')
else
    disp('The system is not observable for output t_1,t_2')
end

% Observability for x(t),t_2
C_3=[1 0 0 0 0 0; 0 0 1 0 0 0];
O_3 = [C_3;C_3*A;C_3*A^(2);C_3*A^(3);C_3*A^(4);C_3*A^(5)];
if rank(O_3)==6;
    disp('The system is observable for output x(t),t_2')
else
    disp('The system is not observable for output x(t),t_2')
end

% Observability for x(t), t_1, t_2
C_4=[1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0 ;0 0 0 0 0 0]
O_4 = [C_4;C_4*A;C_4*A^(2);C_4*A^(3);C_4*A^(4);C_4*A^(5)]
if rank(O_4)==6;
    disp('The system is observable for output x(t),t_1, t_2')
else
    disp('The system is not observable for output x(t),t_1, t_2')
end