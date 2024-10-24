function [integration_error, Nt, ft_5, xr, yr, yrmax] = zadanie4()
    % Numeryczne całkowanie metodą Monte Carlo.
    %
    %   integration_error - wektor wierszowy. Każdy element integration_error(1,i)
    %       zawiera błąd całkowania obliczony dla liczby losowań równej Nt(1,i).
    %       Zakładając, że obliczona wartość całki dla Nt(1,i) próbek wynosi
    %       integration_result, błąd jest definiowany jako:
    %       integration_error(1,i) = abs(integration_result - reference_value),
    %       gdzie reference_value to wartość referencyjna całki.
    %
    %   Nt - wektor wierszowy zawierający liczby losowań, dla których obliczano
    %       wektor błędów całkowania integration_error.
    %
    %   ft_5 - gęstość funkcji prawdopodobieństwa dla n=5
    %
    %   [xr, yr] - tablice komórkowe zawierające informacje o wylosowanych punktach.
    %       Tablice te mają rozmiar [1, length(Nt)]. W komórkach xr{1,i} oraz yr{1,i}
    %       zawarte są współrzędne x oraz y wszystkich punktów zastosowanych
    %       do obliczenia całki przy losowaniu Nt(1,i) punktów.
    %
    %   yrmax - maksymalna dopuszczalna wartość współrzędnej y losowanych punktów

    reference_value = 0.0473612919396179; % wartość referencyjna całki

    Nt = 5:50:10^4;

    %%%%%
    integration_error = zeros(1, length(Nt));
    ft_5 = f(5);
    xr = cell(1, length(Nt));
    yr = cell(1, length(Nt));
    yrmax = ft_5 + 0.001;  % Max. wartość współrzędnej y
    
	for i = 1:length(Nt)
        [integration_result, xr{i}, yr{i}] = integration(@f, Nt(i), yrmax);  % Całka dla współrzędnych x i y dla bieżącej liczby losowań
        integration_error(i) = abs(integration_result - reference_value);  % % Bezwzględny błąd całki
    end

	figure;
	loglog(Nt, integration_error);
	xlabel('Number of subcompartments');
	ylabel('Integration error');
	title('Error of Monte Carlo Method depending on the number of subintervals');
	grid on;
    saveas(gcf, 'zadanie4.png')
    %%%%%
end

%%%%%
function d = f(t)  % Wzór (1) - gęstość prawdopodobieństwa rozkładu normalnego ze średnią oraz odchyleniem standardowym
	sig = 3;
	u = 10;
	d = 1/(sig*sqrt(2*pi)) * exp(-((t-u).^2)/(2*sig^2));
end

function [integral, xr, yr] = integration(fun, N, yrmax)  % Całkowanie metodą Monte-Carlo
    xr = zeros(1, N); 
    yr = zeros(1, N); 
    N1 = 0;  % Licznika punktów poniżej krzywej
    S = yrmax * 5;  % Obszar, w którym losowane są punkty
    for i=1:N
        x = rand() * 5;  % Losowanie współrzędnej x, y i zapisywanie
        y = rand() * yrmax;  
        xr(1,i) = x;
        yr(1,i) = y;  
        if y <= fun(x)  
            N1 = N1 + 1; 
        end
    end
    integral = N1 * S / N;
end
%%%%%