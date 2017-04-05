function acceleration = calAcc(a,b,c)
    %caculate distance change during time A and B
    deltaSab = sqrt((a(3)-b(3))^2 + (a(4)-b(4))^2 + (a(5)-b(5))^2);
    %caculate distance change during time B and C
    deltaSbc = sqrt((b(3)-c(3))^2 + (b(4)-c(4))^2 + (b(5)-c(5))^2);
    
    %calculate velocity during A/B and B/C
    %then the velocity change during 
    deltaVelocity = deltaSbc/0.04 - deltaSab/0.04;
    
    %use velocity change to calculate acceleration
    acceleration = deltaVelocity/0.04;
end