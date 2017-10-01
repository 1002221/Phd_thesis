epsilons = linspace(1,5,5); %increasingly small values of epsilon
solns=zeros(size(epsilons,2),2^5); %preallocate matrix where we will store
%the solutions (u_epsilon)(t,x) for a given (t,x) and the increasingly
%small values of epsilon
% randoms=randn(2^(length(epsilons))+1,30,4); %fix a matrix of random variables to be used for the 
%whole exercise
N=7;
for i=1:size(epsilons,2)
    i %check progress as you run the code
    temp=soln_1D(epsilons(i),3,epsilons(i),1,7,randoms);
    solns(i,:)=temp(15);
end
% surf(linspace(0,2*pi,2^5),epsilons,real(solns)); %plot (u_epsilon)(t,x) as a function of epsilon
figure
plot(epsilons,solns);
%set(gca,'xdir','reverse') %reverse direction of epsilons so they go from
%large to small

%see 5, 34 from theory of reg structures

%also show that int u_{epsilon}(x)f(x)dx goes to infinity as epsilon goes
%to 0