%capacity constraints 

matwid = length(obj); %The width of each linear constraint matrix is the length of the obj vector.

Aineq = spalloc(k*p, matwid, p*k*k); % Allocate Aeq
bineq = zeros(k*p,1); % Allocate bineq as full

% Zero matrices of convenient sizes:
clearer1 = zeros(5,5,8);
clearer12 = clearer1(:);
clearer2 = zeros(size(obj4));
clearer22 = zeros(1100,1);
clearer3 = zeros(size(obj3));

counter = 1;
for i = 1:k
    for ii = 1:p 
        xtemp = clearer1;
        xtemp(:,i,ii) = 1; %normal time production
        xtemp(:,i,ii+4) = 1; %over time production
        xtemp = sparse([xtemp(:); clearer22]);
        Aineq(counter, :) = xtemp';
        bineq(counter) = capacity(ii,i);
        counter = counter + 1;
    end
end

