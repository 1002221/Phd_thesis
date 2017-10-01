function a=sum_nonlinearterm(u,j,d1,d2,i,w,eps,N)
temp1=0;
for o=1:length(w)
    temp1=temp1+sum(eps.*(d1(w(o))-(N+1))*u(i,d1(w(o)),j-1)...
    .*(d2(w(o))-(N+1))*u(i,d2(w(o)),j-1));   
end
a=temp1;