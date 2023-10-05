% task 4 testing matrixes
A = rand(3510);
tic
svd(A);
toc
% elapsed time 4.918s
%%
% testing matrixes
B = rand(4800);
tic
inv(B);
toc
% elapsed time 5.064
%%
% solve the system y = Ax withe 'backslash' operation of Matlab.
nbr = 7000;
A = rand(nbr);
y = randi(100,sz,1);
tic
x = A\y;
toc
% elapsed time 5.924