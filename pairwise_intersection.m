function [I, P11 ,P12,P21,P22] = pairwise_intersection(P1,P2)

z = 0:1:5;
x =  (P1(2)*z + P1(3))/P1(1);

P11 = [x(2),-1,z(2)];
P12 = [x(5),-1,z(5)];

z2 = 0:1:5;
x2 =  (P2(2)*z2 + P2(3))/P2(1);

P21 = [x2(2),-1,z2(2)];
P22 = [x2(5),-1,z2(5)];


I  = find_intersection(P11,P12,P21,P22);

end