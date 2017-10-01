%usage, 1D

randoms_init=randn(2^10+1,30,3);
soln_1D(10,4,10,1,10,randoms_init);

randoms_init=randn(2^10+1,30,30,4);
soln_2D(10,4,10,1,10,randoms_init);

%testing