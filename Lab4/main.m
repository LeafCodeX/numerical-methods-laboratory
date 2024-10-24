clear all
close all
format compact

%z4.1
omega = 10;
impedance_delta = impedance_magnitude(omega);

%z4.2
format long
f = @(x) x.^2 - 4.01;
a = 1;
b = 50;
max_iterations = 100;
ytolerance = 1e-12;
[xsolution,ysolution,iterations,xtab,xdif] = bisection_method(a,b,max_iterations,ytolerance,f);

%z4.3
[xsolution,ysolution,iterations,xtab,xdif] = secant_method(a,b,max_iterations,ytolerance,f);

%z4.4
[omega_bisection, ysolution_bi, iterations_bi, xtab_bi, xdif_bi, omega_secant, ysolution_sec, iterations_sec, xtab_sec, xdif_sec] = solution_impendance_magnitude(a, b, ytolerance, max_iterations);

%z4.5
time = 10;
velocity_delta = rocket_velocity(time);

%z4.6
[time_bisection, ysolution_bi, iterations_bi, xtab_bi, xdif_bi, time_secant, ysolution_sec, iterations_sec, xtab_sec, xdif_sec] = solution_rocket_velocity(a, b, ytolerance, max_iterations);
    
%z4.7
N = 40000;
time_delta = estimate_execution_time(N);

%z4.8
a = 1;
b = 60000;
ytolerance = 1e-12;
max_iterations = 100;
[n_bisection, ysolution_bi, iterations_bi, xtab_bi, xdif_bi, n_secant, ysolution_sec, iterations_sec, xtab_sec, xdif_sec] = solution_estimate_execution_time(a, b, ytolerance, max_iterations);

%z4.9
options = optimset('Display', 'iter');

diary('zadanie9_tangens_data.txt');
zero_6 = fzero(@tan, 6, options);
zero_4_5 = fzero(@tan, 4.5, options);
diary off;