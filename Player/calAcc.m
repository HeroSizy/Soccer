function acceleration = calAcc(a,b,c)
    deltaSab = sqrt((a(4)-b(4))^2 + (a(5)-b(5))^2);
    deltaSbc = sqrt((c(4)-b(4))^2 + (c(5)-b(5))^2);
    
    deltaVelocity = (deltaSbc - deltaSab) / 0.04;
    
    acceleration = deltaVelocity / 0.04;
end