
function H = compute_homography(pts1,pts2)
    
    x = pts1(1,:);
    y = pts1(2,:);
    z = pts1(3,:);
    x_p = pts2(1,:);
    y_p = pts2(2,:);
    z_p = pts1(3,:);
    
    n = 4;
    A = zeros(2*n,9);
    for i=1:4
        A(2*i-1,:) = [-x(i),-y(i),-z(i),0,0,0,x(i)*x_p(i),x_p(i)*y(i),x_p(i)];
        A(2*i,:) = [0,0,0,-x(i),-y(i),-z(i),x(i)*y_p(i),y_p(i)*y(i),y_p(i)]; 
    end
    [u,s,v] = svd(A);
    h = v(:,9);
    H = reshape(h,3,3);
end