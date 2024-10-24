function [numer_index, Edges, I, B, A, b, r] = page_rank()
    numer_index = 193696;
    L1 = mod(floor(mod(numer_index, 100) / 10), 7) + 1; % 9 mod 7 + 1 = 3
    L2 = mod(floor(mod(numer_index, 1000) / 100), 7) + 1; % 6 mod 7 + 1 = 7
    % Full Edges matrix for the modified network (dense matrix)
    Edges = [1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 6, 6, 7, L2,  8; % (7:8),(8:3) 
             4, 6, 3, 4, 5, 5, 6, 7, 5, 6, 4, 6, 4, 7, 6,  8, L1]; 
    d = 0.85; % Damping factor
    N = 8; % Number of pages
    
    % Identity matrix (sparse)
    I = speye(N);

    % Calculating Matrix B: B(i,j) = 1 if there's a link from page j to page i
    B = sparse(Edges(2,:), Edges(1,:), 1, N, N);

    % Calculating Matrix A: A(i,i) = 1 / L', where L' is the number of outbound links from page j
    L = sum(B); % Vector containing the sum of elements in each column of B
    A = spdiags(1./L', 0, N, N);

    % b - right side of the equation Mr = b (column vector of length N -> ones(N,1)), b = (1 − d)/N
    b = ((1 - d) / N) * ones(N, 1);

    % Linear equation
    M = I - d * B * A;

    % PageRank for N numbers
    r = M \ b;
end
