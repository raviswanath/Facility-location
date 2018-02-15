%k is the number of commodities, P: plants and S = Demand locations
k = 5; p = 4; s = 50;

%transportation cost matrix (we need to reproduce this 4 more times in the objective function since
%we have 5 different commodities and each commodity can be shipped to each
%location from any of the plants

demand = demand'; 
tcost = zeros(size(distance));

for ii = 1:p
    for jj = 1:s
        tcost(jj, ii) = 2*ceil(distance(jj,ii)/10);
    end
end


%production cost

%set up cost binary variable co-efficients

setup_cost = zeros(k, k, p);

for i=1:k
    for j = 1:k
        for ii = 1:p
            if i == j && j ~= ii
                setup_cost(i, j, ii) = 5000*convert_cost(ii, j);
            else
                setup_cost(i, j, ii) = 5000*convert_cost(i,j);
            end
        end
    end
end

pcost = [500, 400, 300, 200, 100; 500, 400, 300, 200, 100; 500, 400, 300, 200, 100;
    500, 400, 300, 200, 100; 500, 400, 300, 200, 100;];

%regular production
prod_cost = zeros(5,5,4);
for i=1:k
    for j = 1:k
        for ii = 1:p
            if ii==1 
                if j == 1 && i == 1
                    prod_cost(i, j, ii) = pcost(i, j);
                else
                    prod_cost(i, j, ii) = pcost(i, j)*100000; 
                end
            else
                prod_cost(i, j, ii) = pcost(i, j);  
            end
        end
    end
end 

%overtime production
ot_cost = zeros(5,5,4);

for i=1:k
    for j = 1:k
        for ii = 1:p
            if ii==1 
                if j == 1 && i == 1
                    ot_cost(i, j, ii) = pcost(i, j)*1.5;
                else
                    ot_cost(i, j, ii) = pcost(i, j)*100000; 
                end
            else
                ot_cost(i, j, ii) = pcost(i, j)*1.5;  
            end
        end
    end
end

%objective function
obj1 = zeros(p, k, k); 
obj2 = zeros(p, k, k);
obj3 = zeros(p, k, k);
obj4 = zeros(p,s);


obj1 = prod_cost; 
obj2 = ot_cost;
obj3 = setup_cost;
obj4 = repmat(tcost,1,5)';


obj = [obj1(:); obj2(:); obj3(:); obj4(:)];