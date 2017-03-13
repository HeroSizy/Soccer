function acceleration = calAcc(a,b)
    deltaS = sqrt((a(3)-b(3))^2 + (a(4)-b(4))^2 + (a(5)-b(5))^2);
    
    
    acceleration = 2*deltaS/(0.04)^2;
end