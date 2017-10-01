function a=sourceterm_3D(N,b,T,randoms_init)
source = zeros(2*N+1,2*N+1,2*N+1,2^b+1); %source term (i.e. the 'f')
for l=N+2:2*N+1
    for m=N+2:2*N+1
        for n=N+2:2*N+1
             for i=1:2^b*T+1
                xi1=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,l,m,n,1));
                xi2=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,l,m,n,2));
                xi3=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,l,m,n,3));
                xi4=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,l,m,n,4));
                xi5=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,l,m,n,5));
                xi6=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,l,m,n,6));
                xi7=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,l,m,n,7));
                xi8=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,l,m,n,8));
                %terms where n>0, l>0; use 2*(N+1)-n for negs
                source(l,m,n,i)=                        1/(8*pi^(3/2))*(xi1-1i*xi2-1i*xi3-xi4-1i*xi5-xi6-xi7+1i*xi8); 
                source(l,m,2*(N+1)-n,i)=                1/(8*pi^(3/2))*(xi1+1i*xi2-1i*xi3+xi4-1i*xi5+xi6-xi7-1i*xi8); 
                source(l,2*(N+1)-m,n,i)=                1/(8*pi^(3/2))*(xi1-1i*xi2+1i*xi3+xi4-1i*xi5-xi6+xi7-1i*xi8); 
                source(2*(N+1)-l,m,n,i)=                1/(8*pi^(3/2))*(xi1-1i*xi2-1i*xi3-xi4+1i*xi5+xi6+xi7-1i*xi8);
                source(l,2*(N+1)-m,2*(N+1)-n,i)=        1/(8*pi^(3/2))*(xi1+1i*xi2+1i*xi3-xi4-1i*xi5+xi6+xi7+1i*xi8);
                source(2*(N+1)-l,m,2*(N+1)-n,i)=        1/(8*pi^(3/2))*(xi1+1i*xi2-1i*xi3+xi4+1i*xi5-xi6+xi7+1i*xi8);
                source(2*(N+1)-l,2*(N+1)-m,n,i)=        1/(8*pi^(3/2))*(xi1-1i*xi2+1i*xi3+xi4+1i*xi5-xi6-xi7+1i*xi8);
                source(2*(N+1)-l,2*(N+1)-m,2*(N+1)-n,i)=1/(8*pi^(3/2))*(xi1+1i*xi2+1i*xi3-xi4+1i*xi5+xi6-xi7-1i*xi8);
             end
        end
    end
end
for l=N+2:2*N+1
    for m=N+2:2*N+1
         for i=1:2^b*T+1
            xi1=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,l,m,N+1,1));
            xi3=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,l,m,N+1,3));
            xi5=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,l,m,N+1,5));
            xi7=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,l,m,N+1,7));
            %terms where n>0, l=0
            source(l,m,N+1,i)=                  1/(4*sqrt(2*pi^3))*(xi1-1i*xi3-1i*xi5-xi7); 
            source(l,2*(N+1)-m,N+1,i)=          1/(4*sqrt(2*pi^3))*(xi1+1i*xi3-1i*xi5+xi7);
            source(2*(N+1)-l,m,N+1,i)=          1/(4*sqrt(2*pi^3))*(xi1-1i*xi3+1i*xi5+xi7);
            source(2*(N+1)-l,2*(N+1)-m,N+1,i)=  1/(4*sqrt(2*pi^3))*(xi1+1i*xi3+1i*xi5-xi7);
         end
    end
end
for l=N+2:2*N+1
    for n=N+2:2*N+1
         for i=1:2^b*T+1
            xi1=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,l,N+1,n,1));
            xi2=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,l,N+1,n,2));
            xi5=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,l,N+1,n,5));
            xi6=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,l,N+1,n,6));
            %terms where n>0, l=0
            source(l,m,N+1,i)=                  1/(4*sqrt(2*pi^3))*(xi1-1i*xi2-1i*xi5-xi6); 
            source(l,2*(N+1)-m,N+1,i)=          1/(4*sqrt(2*pi^3))*(xi1+1i*xi2-1i*xi5+xi6);
            source(2*(N+1)-l,m,N+1,i)=          1/(4*sqrt(2*pi^3))*(xi1-1i*xi2+1i*xi5+xi6);
            source(2*(N+1)-l,2*(N+1)-m,N+1,i)=  1/(4*sqrt(2*pi^3))*(xi1+1i*xi2+1i*xi5-xi6);
         end
    end
end
for m=N+2:2*N+1
    for n=N+2:2*N+1
         for i=1:2^b*T+1
            xi1=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,N+1,l,n,1));
            xi2=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,N+1,l,n,2));
            xi3=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,N+1,l,n,3));
            xi4=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,N+1,l,n,4));
            %terms where n>0, l=0
            source(l,m,N+1,i)=                  1/(4*sqrt(2*pi^3))*(xi1-1i*xi2-1i*xi3-xi4); 
            source(l,2*(N+1)-m,N+1,i)=          1/(4*sqrt(2*pi^3))*(xi1+1i*xi2-1i*xi3+xi4);
            source(2*(N+1)-l,m,N+1,i)=          1/(4*sqrt(2*pi^3))*(xi1-1i*xi2+1i*xi3+xi4);
            source(2*(N+1)-l,2*(N+1)-m,N+1,i)=  1/(4*sqrt(2*pi^3))*(xi1+1i*xi2+1i*xi3-xi4);
         end
    end
end
for l=N+2:2*N+1
     for i=1:2^b*T+1
        xi1=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,l,N+1,N+1,1));
        xi5=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,l,N+1,N+1,5));
        %terms where n=0, l>0
        source(l,N+1,N+1,i)=        1/(2*sqrt(2*pi^(3/2)))*(xi1-1i*xi5); 
        %terms where n=0, l<0
        source(2*(N+1)-l,N+1,N+1,i)=1/(2*sqrt(2*pi^(3/2)))*(xi1+1i*xi5);
     end
end
for m=N+2:2*N+1
     for i=1:2^b*T+1
        xi1=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,N+1,m,N+1,1));
        xi3=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,N+1,m,N+1,3));
        %terms where n=0, l>0
        source(N+1,m,N+1,i)=        1/(2*sqrt(2*pi^(3/2)))*(xi1-1i*xi3); 
        %terms where n=0, l<0
        source(N+1,2*(N+1)-m,N+1,i)=1/(2*sqrt(2*pi^(3/2)))*(xi1+1i*xi3);
     end
end
for n=N+2:2*N+1
     for i=1:2^b*T+1
        xi1=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,N+1,N+1,n,1));
        xi2=timewhitenoise(b,(i-1)/(2^b),randoms_init(:,N+1,N+1,n,2));
        %terms where n=0, l>0
        source(N+1,N+1,n,i)=        1/(2*sqrt(2*pi^(3/2)))*(xi1-1i*xi2); 
        %terms where n=0, l<0
        source(N+1,N+1,2*(N+1)-n,i)=1/(2*sqrt(2*pi^(3/2)))*(xi1+1i*xi2);
     end
end
%take care of term where n,l=0
for i=1:2^b*T+1
        xi1=timewhitenoise(b,(i-1)/(2^m),randoms_init(:,N+1,N+1,N+1,1));
        source(N+1,N+1,N+1,i)=1/(sqrt(2*pi^(3/2)))*(xi1); 
end
a=source;