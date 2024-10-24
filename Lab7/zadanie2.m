function [integration_error, Nt, ft_5, integral_1000] = zadanie2()
    % Numeryczne całkowanie metodą trapezów.
    % Nt - wektor zawierający liczby podprzedziałów całkowania
    % integration_error - integration_error(1,i) zawiera błąd całkowania wyznaczony
    %   dla liczby podprzedziałów równej Nt(i). Zakładając, że obliczona wartość całki
    %   dla Nt(i) liczby podprzedziałów całkowania wyniosła integration_result,
    %   to integration_error(1,i) = abs(integration_result - reference_value),
    %   gdzie reference_value jest wartością referencyjną całki.
    % ft_5 - gęstość funkcji prawdopodobieństwa dla n=5
    % integral_1000 - całka od 0 do 5 funkcji gęstości prawdopodobieństwa
    %   dla 1000 podprzedziałów całkowania

    reference_value = 0.0473612919396179; % wartość referencyjna całki

    Nt = 5:50:10^4;
    integration_error = [];

    %%%%%
    integration_result = [];
	for i = 1:length(Nt)
		integration_result(i) = integral(@f, Nt(i));  % Całka dla bieżącej liczby podprzedziałów
		integration_error(i) = abs(integration_result(i) - reference_value);  % Bezwzględny błąd całki
	end
    
    ft_5 = f(5);  % Fnkcji gęstości prawdopodobieństwa
    integral_1000 = integral(@f, 1000);  % Całki funkcji gęstości prawdopodobieństwa

    figure;
	loglog(Nt, integration_error);
	xlabel('Number of subcompartments');
	ylabel('Integration error');
	title('Error of trapezoidal integration method depending on the number of subintervals');
	grid on;
    saveas(gcf, 'zadanie2.png');
    %%%%%
end

%%%%%
function d = f(t)  % Wzór (1) - gęstość prawdopodobieństwa rozkładu normalnego ze średnią oraz odchyleniem standardowym
	sig = 3;
	u = 10;
	d = 1/(sig*sqrt(2*pi)) * exp(-((t-u).^2)/(2*sig^2));
end

function res = integral (f, N)  % Całkowanie metodą trapezów
	a = 0;
	b = 5;
	h = (b-a)/N;
	res = 0;
	for i = 1:N
        %%%%%
		x1 = a + (i-1)*h; 
		x2 = a + i*h;
		res = res + (f(x1) + f(x2))/2;
        %%%%%
	end
	res = res*h;  % Suma * szerokość podprzedziałów
end
%%%%%