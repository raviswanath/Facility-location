%total produced >= total shipped from each location
counter = 251; new = 1; xtemp1 = clearer3; 
for i = 1:k
    for ii = 1:p 
        xtemp = clearer1;
        xtemp(:,i,ii) = 1; %Total produced
        xtemp(:,i,ii+4) = 1; 
        xtemp2 = clearer2;
        xtemp2(new,:) = -1; %total shipped out
        xtemp = sparse([xtemp(:);xtemp1(:);xtemp2(:)]'); % Change to sparse row
        Aeq(counter,:) = xtemp;% Fill in row
        beq(counter) = 0;
        counter = counter + 1;
        new = new + 1;
    end
end



