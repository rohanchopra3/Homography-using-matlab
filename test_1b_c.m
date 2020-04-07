
import find_intersection.*
import project_point.*
close all

% original points
P11 = [-1 ,-1 ,2]';
P12 = [-1 ,-1, 3]';
P21 = [0 ,-1 ,2]';
P22 = [0, -1, 3]';
P31 = [1, -1 ,2]';
P32 = [1, -1 ,3]';

% original points in matrix form 
P1_o = [P11,P12];
P2_o = [P21,P22];
P3_o = [P31,P32];

% projected points concatenated with 1 to get homogenous representation 

% finding intersection of points
q1 = find_intersection(P11, P12,P21,P22)
q2 = find_intersection(P11, P12,P31,P32)
q3 = find_intersection(P21, P22,P31,P32)


P11 = [project_point(P11) 1]
P12 = [project_point(P12) 1];
P21 = [project_point(P21) 1];
P22 = [project_point(P22) 1];
P31 = [project_point(P31) 1];
P32 = [project_point(P32) 1];

P1 = [P11' ,P12', q1'];
P2 = [P21',P22', q2'];
P3 = [P31',P32', q3'];

% L1 and L2
figure 
title("L1 and L2");
grid on;
plot3(P1(1,:),P1(2,:),P1(3,:),'-o');
hold on
plot3(P2(1,:),P2(2,:),P2(3,:),'-p');
grid on
% Plotting original points
plot3(P1_o(1,:),P1_o(2,:),P1_o(3,:),'r');
plot3(P2_o(1,:),P2_o(2,:),P2_o(3,:),'r');
grid on
zlabel('z')
xlabel('x')
ylabel('y')


% L2 and L3
figure; title("L2 and L3");
grid on;
plot3(P2(1,:),P2(2,:),P2(3,:),'-o');
hold on
plot3(P3(1,:),P3(2,:),P3(3,:),'-p');
grid on
zlabel('z')
xlabel('x')
ylabel('y')

% Plotting original points
plot3(P2_o(1,:),P2_o(2,:),P2_o(3,:),'r');
plot3(P3_o(1,:),P3_o(2,:),P3_o(3,:),'r');
grid on
zlabel('z')
xlabel('x')
ylabel('y')
% L3 and L1

figure;title("L1 and L3");

grid on;
plot3(P1(1,:),P1(2,:),P1(3,:),'-o');
hold on
plot3(P3(1,:),P3(2,:),P3(3,:),'-p');
grid on
% Plotting original points
plot3(P1_o(1,:),P1_o(2,:),P1_o(3,:),'r');
plot3(P3_o(1,:),P3_o(2,:),P3_o(3,:),'r');
grid on
zlabel('z')
xlabel('x')
ylabel('y')