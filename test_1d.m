import find_intersection.*
import pairwise_intersection.*
import project_point.*
close all

L11 = [1,0,-1]';
L12 = [1,0,0]';
L21 = [3,2,-1]';
L22 = [3,2,-2]';

L31 = [5,-2,-1]';
L32 = [5,-2,-2]';

[A1, P11_1,P12_1,P21_1,P22_1] = pairwise_intersection(L11,L12);
[A2, P11_2,P12_2,P21_2,P22_2] = pairwise_intersection(L21,L22);
[A3, P11_3,P12_3,P21_3,P22_3] = pairwise_intersection(L31,L32);

% L11 and L11
P11_p1 = [project_point(P11_1) 1];
P12_p1 = [project_point(P12_1) 1];
P21_p1 = [project_point(P21_1) 1];
P22_p1 = [project_point(P22_1) 1];

P1_1_o = [P11_1',P12_1'];
P2_1_o = [P21_1',P22_1'];

P1_1 = [P11_p1',P12_p1',A1'];
P2_1 = [P21_p1',P22_p1',A1'];


% L11 and L12
figure;
grid on;
plot3(P1_1(1,:),P1_1(2,:),P1_1(3,:),'-o');
hold on
plot3(P2_1(1,:),P2_1(2,:),P2_1(3,:),'-p');

% Plotting original points
plot3(P1_1_o(1,:),P1_1_o(2,:),P1_1_o(3,:),'r');
plot3(P2_1_o(1,:),P2_1_o(2,:),P2_1_o(3,:),'r');
grid on
zlabel('z')
xlabel('x')
ylabel('y')

% L21 and L22
P11_p2 = [project_point(P11_2) 1];
P12_p2 = [project_point(P12_2) 1];
P21_p2 = [project_point(P21_2) 1];
P22_p2 = [project_point(P22_2) 1];

P1_2_o = [P11_2',P12_2'];
P2_2_o = [P21_2',P22_2'];

P1_2 = [P11_p2',P12_p2',A2'];
P2_2 = [P21_p2',P22_p2',A2'];


% L21 and L22
figure;
grid on;
plot3(P1_2(1,:),P1_2(2,:),P1_2(3,:),'-o');
hold on
plot3(P2_2(1,:),P2_2(2,:),P2_2(3,:),'-p');

% Plotting original points
plot3(P1_2_o(1,:),P1_2_o(2,:),P1_2_o(3,:),'r');
plot3(P2_2_o(1,:),P2_2_o(2,:),P2_2_o(3,:),'r');
grid on
zlabel('z')
xlabel('x')
ylabel('y')


% L31 and L3
P11_p3 = [project_point(P11_3) 1];
P12_p3 = [project_point(P12_3) 1];
P21_p3 = [project_point(P21_3) 1];
P22_p3 = [project_point(P22_3) 1];

P1_3_o = [P11_3',P12_3'];
P2_3_o = [P21_3',P22_3'];

P1_3 = [P11_p3',P12_p3',A3'];
P2_3 = [P21_p3',P22_p3',A3'];


% L31 and L32
figure;
grid on;
plot3(P1_3(1,:),P1_3(2,:),P1_3(3,:),'-o');
hold on
plot3(P2_3(1,:),P2_3(2,:),P2_3(3,:),'-p');

% Plotting original points
plot3(P1_3_o(1,:),P1_3_o(2,:),P1_3_o(3,:),'r');
plot3(P2_3_o(1,:),P2_3_o(2,:),P2_3_o(3,:),'r');

grid on
zlabel('z')
xlabel('x')
ylabel('y')


% to Prove they are colinear 
n1 = A2-A1;
n2 = A3-A1;

%0 for colinear other wise they are not colinear
cross(n1,n2)