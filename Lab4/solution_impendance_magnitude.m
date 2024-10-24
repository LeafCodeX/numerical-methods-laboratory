function [omega_bisection, ysolution_bi, iterations_bi, xtab_bi, xdif_bi, omega_secant, ysolution_sec, iterations_sec, xtab_sec, xdif_sec] = solution_impendance_magnitude(a, b, ytolerance, max_iterations)
    [omega_bisection, ysolution_bi, iterations_bi, xtab_bi, xdif_bi] = bisection_method(a, b, max_iterations, ytolerance, @impedance_magnitude);
    [omega_secant, ysolution_sec, iterations_sec, xtab_sec, xdif_sec] = secant_method(a, b, max_iterations, ytolerance, @impedance_magnitude);

    subplot(2,1,1);
    plot(xtab_bi, 'b-', 'LineWidth', 1);
    hold on;
    plot(xtab_sec, 'r-', 'LineWidth', 1);
    title('Changing the approximation of the solution in subsequent iterations');
    xlabel('Iterations');
    ylabel('\omega');
    legend('Bisection Method', 'Secant Method', 'Location','southeast');
    grid on;

    subplot(2,1,2);
    semilogy(xdif_bi, 'b-', 'LineWidth', 1);
    hold on;
    semilogy(xdif_sec, 'r-', 'LineWidth', 1);
    title('Differences between solution approximations in subsequent iterations');
    xlabel('Iterations');
    ylabel('|\Delta\omega|');
    legend('Bisection Method', 'Secant Method');
    grid on;

    print -dpng zadanie4.png
end





