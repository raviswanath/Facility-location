%supply demand

Aeq = spalloc(p*s,matwid,p*k*s); % Allocate as sparse
beq = zeros(p*s,1);
clearer33 = zeros(300,1);

% The constraint is designed such that for each commodity, the total tons
% transported from each of the plants should be equal to the demand
% requirement of the commodity at that location.

counter = 1;
for jj = 1:50
    xtemp2 = clearer2;
    xtemp2(1:4,jj) = 1;
    xtemp2 = sparse([clearer33 ; xtemp2(:)]'); %commodity 1
    Aeq(counter,:) = xtemp2; 
    beq(counter) = demand(1,jj);
    counter = counter + 1;
    
    xtemp2 = clearer2;
    xtemp2(5:8,jj) = 1;
    xtemp2 = sparse([clearer33 ;xtemp2(:)]'); % Commodity 2
    Aeq(counter,:) = xtemp2; 
    beq(counter) = demand(2,jj);
    counter = counter + 1;

    xtemp2 = clearer2;
    xtemp2(9:12,jj) = 1;
    xtemp2 = sparse([clearer33 ;xtemp2(:)]'); % Commodity 3
    Aeq(counter,:) = xtemp2;
    beq(counter) = demand(3,jj);
    counter = counter + 1;

    xtemp2 = clearer2;
    xtemp2(13:16,jj) = 1;
    xtemp2 = sparse([clearer33 ;xtemp2(:)]');  % Commodity 4
    Aeq(counter,:) = xtemp2;
    beq(counter) = demand(4,jj);
    counter = counter + 1;

    xtemp2 = clearer2;
    xtemp2(17:20,jj) = 1;
    xtemp2 = sparse([clearer33 ;xtemp2(:)]');  % Commodity 5
    Aeq(counter,:) = xtemp2; 
    beq(counter) = demand(5,jj);
    counter = counter + 1;
end
