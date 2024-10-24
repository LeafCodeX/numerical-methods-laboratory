function [A,b,x,time_direct,err_norm,index_number] = solve_direct(N)
% A - macierz z równania macierzowego A * x = b
% b - wektor prawej strony równania macierzowego A * x = b
% x - rozwiązanie równania macierzowego
% time_direct - czas wyznaczenia rozwiązania x
% err_norm - norma błędu residualnego wyznaczona dla rozwiązania x; err_norm = norm(A*x-b);
% index_number - Twój numer indeksu
    index_number = 193696;
    L1 = mod(index_number, 10);
    [A,b] = generate_matrix(N, L1);
    tic;
    x = A\b; % direct method
    time_direct = toc;
    err_norm = norm(A*x-b);
end
