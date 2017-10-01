function a=sourceterm(m,N,randoms_init,r,T)
source = zeros(2^m+1,2*N+1);
for n=N+2:2*N+1
     for i=1:2^m*T+1
        xi1=timewhitenoise(r,(i-1)/(2^m),randoms_init(:,n,1));
        xi2=timewhitenoise(r,(i-1)/(2^m),randoms_init(:,n,2));
        %terms where n>0
        source(i,n)=1/(2*sqrt(pi))*(xi1-1i*xi2); 
        %terms where n<0
        source(i,2*(N+1)-n)=conj(source(i,n)); 
     end
end
%take care of the term where n=0, which has a different normalising
%constant
for i=1:2^m*T+1
    xi1=timewhitenoise(r,(i-1)/(2^m),randoms_init(:,N+1,1));
    source(i,N+1)=1/(sqrt(2*pi))*(xi1); 
end
a=source;