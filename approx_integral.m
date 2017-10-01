function a=approx_integral(u,j,d1,d2,w,eps,m,N,k,n,source)
temp=0;
for i=1:k-1
    temp1=sum_nonlinearterm(u,j,d1,d2,i,w,eps,N);
    temp = temp+ exp((n-(N+1))^2*((i-1)-(k-1))/(2^m))*...
        (source(i,n)-temp1);       
end
a=(1/(2^m))*temp;
end
