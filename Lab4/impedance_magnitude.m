function impedance_delta = impedance_magnitude(omega)
    % Task1
    R = 525; % Resistance (Ω)
    C = 7e-5; % Capacitance (F)
    L = 3; % Inductance (H)
    M = 75; % docelowa wartość modułu impedancji

    % Task2
    if omega <= 0
        error("Omega must be greater than zero!");
    end

    %Task3
    Z = abs(1/sqrt(1/(R^2) + (omega*C - 1/(omega*L))^2));

    impedance_delta = Z - M;
end