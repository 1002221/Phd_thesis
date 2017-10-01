function xi=timewhitenoise(r,t,randoms_init)
%t needs to be fed in already reindexed. The input should be between 0 and
%1.
randoms=randoms_init(1:2^r+1,1);
a=linspace(0,1,2^r+1);
a(2^r+2)=42;
b=0;
for i=1:size(a,2)-1
b=b+i*(a(i)<=t && a(i+1)>t);
end
xi=2^(r/2)*randoms(b);
