function Q = find_intersection(P11, P12,P21,P22)


    P11 = [project_point(P11) 1];
    P12 = [project_point(P12) 1];
    P21 = [project_point(P21) 1];
    P22 = [project_point(P22) 1];


    syms s t;
    
    m11 = P11(1)-P12(1);
    m12 = P11(2)-P12(2);
    slope1 = m12/m11;
    
    if m11 == 0 
        L1 = s==0;
    elseif m12 == 0 
        L1 = t==0;
    else
        L1 = (s-P11(1))*slope1 == (t-P11(2));
    end

    
        
    m21 = P21(1)-P22(1);
    m22 = P21(2)-P22(2);
    slope2 = m22/m21;
    
    
    if m21 == 0
        L2 = s==0;
    elseif m22  == 0
        L2 = t==0;
    else
        L2 = (s-P21(1))*slope2 == (t-P21(2));
    end

      ans = solve([L1 L2], s ,t);
      Q = [ans.s ans.t 1];
  
end 