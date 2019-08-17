function [fval, exitflag, output, x, Y2] = runqpbox4
%RUNQPBOX4 demonstrates 'HessianMultiplyFcn' option for QUADPROG with bounds.
l = @computeAnf;
[A,f1] = l();
problem = load('qpbox4'); % Get xstart, u, l, B, A, f
xstart1 = problem.xstart; u1 = problem.u; l1 = problem.l;
xstart = zeros(10000,1); u = zeros(10000,1); l = zeros(10000,1);
for i=0:18
    for j=1:512
        xstart(i*512+j) = xstart1(j);
    end
end
for i=1:272
    xstart(19*512+i) = xstart1(i);
end

for i=0:18
    for j=1:512
        u(i*512+j) = u1(j);
    end
end
for i=1:272
    u(19*512+i) = u1(i);
end

for i=0:18
    for j=1:512
        l(i*512+j) = l1(j);
    end
end
for i=1:272
    l(19*512+i) = l1(i);
end

B = 100*eye(10000); f = f1;
mtxmpy = @qpmult; % function handle to qpbox4mult nested function

% Choose algorithm and the HessianMultiplyFcn option
options = optimoptions(@quadprog,'Algorithm','trust-region-reflective','HessMult',mtxmpy);

% Pass B to qpbox4mult via the H argument. Also, B will be used in
% computing a preconditioner for PCG.
[x, fval, exitflag, output, Y2] = quadprog(B,f,[],[],[],[],l,u,xstart,options);
    
    function W = qpmult(B,Y)
        %QPBOX4MULT Hessian matrix product with dense structured Hessian.
        %   W = qpbox4mult(B,Y) computes W = (B + A*A')*Y where
        %   INPUT:
        %       B - sparse square matrix (512 by 512)
        %       Y - vector (or matrix) to be multiplied by B + A'*A.
        %   VARIABLES from outer function runqpbox4:
        %       A - sparse matrix with 512 rows and 10 columns.
        %
        %   OUTPUT:
        %       W - The product (B + A*A')*Y.
        %

        % Order multiplies to avoid forming A*A',
        %   which is large and dense
        Y2 = Y;
        W = B*Y + A'*(A*Y);
    end

end