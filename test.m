a=linspace(0,1,50000);

b=a+1i*a;
temp=0;
for i=1:length(a)-1
    temp = temp+b(i);
end
(1/(1*(length(a)-1)))*temp
% temp=0;
% for i=1:3
%     temp = temp+b(i);
% end
% (1/(3))*temp