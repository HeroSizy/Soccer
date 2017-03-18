function acceleration = calAcc(a,b,c)
    deltaSab = sqrt((a(3)-b(3))^2 + (a(4)-b(4))^2 + (a(5)-b(5))^2);
    
    deltaSbc = sqrt((b(3)-c(3))^2 + (b(4)-c(4))^2 + (b(5)-c(5))^2);
    
    deltaVelocity = deltaSbc/0.04 - deltaSab/0.04;
    
    acceleration = deltaVelocity/0.04;
end