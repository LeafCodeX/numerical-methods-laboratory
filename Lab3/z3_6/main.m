clear all
close all
format compact
load("filtr_dielektryczny.mat");

[x,time_direct,err_direct] = solve_direct(A,b); % solve_direct
[~,~,~,err_Jacobi,time_Jacobi,iter_Jacobi] = solve_Jacobi(A,b); % solve_Jacobi
[M,bm,x,err_Gauss,time_Gauss,iter_Gauss] = solve_Gauss_Seidel(A,b); % solve_Gauss_Seidel
fprintf("Direct method residual error standard: %.12f\n",err_direct);
fprintf("Time taken by Direct method: %.6f seconds\n", time_direct);

fprintf("\nJacobi method residual error standard: %.12f\n",err_Jacobi);
fprintf("Iteration at which error occurred (Jacobi): %d\n", iter_Jacobi);
fprintf("Time taken by Jacobi method: %.6f seconds\n", time_Jacobi);

fprintf("\nGauss-Seider method residual error standard: %.12f\n",err_Gauss);
fprintf("Iteration at which error occurred (Gauss-Seidel): %d\n", iter_Gauss);
fprintf("Time taken by Gauss-Seidel method: %.6f seconds\n", time_Gauss);

function [x,time_direct,err_norm] = solve_direct(A, b)
% A - macierz z równania macierzowego A * x = b
% b - wektor prawej strony równania macierzowego A * x = b
% x - rozwiązanie równania macierzowego
% time_direct - czas wyznaczenia rozwiązania x
% err_norm - norma błędu residualnego wyznaczona dla rozwiązania x; err_norm = norm(A*x-b);
% index_number - Twój numer indeksu
%    index_number = 193696;
%    L1 = mod(index_number, 10);
%    [A,b] = generate_matrix(N, L1);
    tic;
    x = A\b;
    time_direct = toc;
    err_norm = norm(A*x-b);
end

function [M,bm,x,err_norm,time,iterations] = solve_Jacobi(A, b)
% A - macierz z równania macierzowego A * x = b
% b - wektor prawej strony równania macierzowego A * x = b
% M - macierz pomocnicza opisana w instrukcji do Laboratorium 3 – sprawdź wzór (5) w instrukcji, który definiuje M jako M_J.
% bm - wektor pomocniczy opisany w instrukcji do Laboratorium 3 – sprawdź wzór (5) w instrukcji, który definiuje bm jako b_{mJ}.
% x - rozwiązanie równania macierzowego
% err_norm - norma błędu residualnego wyznaczona dla rozwiązania x; err_norm = norm(A*x-b)
% time - czas wyznaczenia rozwiązania x
% iterations - liczba iteracji wykonana w procesie iteracyjnym metody Jacobiego
% index_number - Twój numer indeksu
%    index_number = 193696;
%    L1 = mod(index_number, 10);
%    [A,b] = generate_matrix(N, L1);

    D = diag(diag(A));
    L = tril(A,-1);
    U = triu(A,1);

    x = ones(length(A),1);
    M = -D\(L+U);
    bm = D\b;

    iterations = 0;
    err_norm = 1;
    tic;
    while iterations < 1000 && err_norm > 1E-12
        x = M * x + bm;
        iterations = iterations + 1;
        err_norm = norm(A*x-b);
        %fprintf('Error norm: %.12f\n', err_norm);
    end
    time = toc;
end

function [M,bm,x,err_norm,time,iterations] = solve_Gauss_Seidel(A, b)
% A - macierz rzadka z równania macierzowego A * x = b
% b - wektor prawej strony równania macierzowego A * x = b
% M - macierz pomocnicza opisana w instrukcji do Laboratorium 3 – sprawdź wzór (7) w instrukcji, który definiuje M jako M_{GS}
% bm - wektor pomocniczy opisany w instrukcji do Laboratorium 3 – sprawdź wzór (7) w instrukcji, który definiuje bm jako b_{mGS}
% x - rozwiązanie równania macierzowego
% err_norm - norma błędu residualnego wyznaczona dla rozwiązania x; err_norm = norm(A*x-b);
% time - czas wyznaczenia rozwiązania x
% iterations - liczba iteracji wykonana w procesie iteracyjnym metody Gaussa-Seidla
% index_number - Twój numer indeksu
%    index_number = 193696;
%    L1 = mod(index_number, 10);
%    [A,b] = generate_matrix(N, L1);

    D = diag(diag(A));
    L = tril(A,-1);
    U = triu(A,1);

    x = ones(length(A),1);
    M = -(D+L)\U;
    bm = (D+L)\b;

    iterations = 0;
    err_norm = 1;
    tic;
    while iterations < 1000 && err_norm > 1E-12
        x = M * x + bm;
        iterations = iterations + 1;
        err_norm = norm(A*x-b);
        %fprintf('Error norm: %.12f\n', err_norm);
    end
    time = toc;
end
