clear all
close all
format compact

%z3.1
N = 100;
[A,b,x,time_direct,err_norm,index_number] = solve_direct(N);

%z3.2
N = 1000:1000:8000;
n = length(N);
vtime_direct = ones(1,n);
for i = 1:n
    [A,b,x,time_direct,err_norm,index_number] = solve_direct(N(i));
    vtime_direct(i) = time_direct;
end
plot_direct(N,vtime_direct);

%z3.3
N = 100;
[A,b,M,bm,x,err_norm,time,iterations,index_number] = solve_Jacobi(N);

%z3.4
N = 100;
[A,b,M,bm,x,err_norm,time,iterations,index_number] = solve_Gauss_Seidel(N);

%z3.5
N = 1000:1000:8000;
n = length(N);
time_Jacobi = ones(1,n);
time_Gauss_Seidel = 2*ones(1,n);
iterations_Jacobi = 40*ones(1,n);
iterations_Gauss_Seidel = 40*ones(1,n);
for i = 1:n
   [~,~,~,~,~,~,time_Jacobi(i),iterations_Jacobi(i),~] = solve_Jacobi(N(i));
   [~,~,~,~,~,~,time_Gauss_Seidel(i),iterations_Gauss_Seidel(i),~] = solve_Gauss_Seidel(N(i));

end
plot_problem_5(N,time_Jacobi,time_Gauss_Seidel,iterations_Jacobi,iterations_Gauss_Seidel);