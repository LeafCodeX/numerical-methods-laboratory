function velocity_delta = rocket_velocity(t)
    % velocity_delta - różnica pomiędzy prędkością rakiety w czasie t oraz zadaną prędkością M
    % t - czas od rozpoczęcia lotu rakiety dla którego ma być wyznaczona prędkość rakiety
    if t <= 0
        error("The function is undefined for t <= 0.");
    end
    
    M = 750; % [m/s] The target velocity
    m0 = 150000; % [kg] The initial mass of the rocket
    u = 2000; % [m/s] The exhaust velocity
    q = 2700; % [kg/s] The rate of fuel consumption
    g = 1.622; % [m/s^2] The gravitational acceleration on the Moon
    
    v = u * log(m0/(m0 - q * t)) - g * t;
    velocity_delta = v - M;
end