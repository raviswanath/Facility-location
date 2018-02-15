lb = zeros(length(obj),1);%indicating the lower bound and upper bound of all the decision variables
ub = Inf(length(obj),1);

[solution,fval,exitflag,output] = linprog(obj,Aineq,bineq,Aeq,beq,lb,ub);

%solution contains all the production values and flows on the network.
%fval is the objective value (cost)