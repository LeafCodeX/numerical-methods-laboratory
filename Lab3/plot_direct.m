function plot_direct(N,vtime_direct)
   % N - wektor zawierający rozmiary macierzy dla których zmierzono czas obliczeń metody bezpośredniej
    % vtime_direct - czas obliczeń metody bezpośredniej dla kolejnych wartości N
    figure;
    plot(N, vtime_direct, 'bo-', 'LineWidth', 1, 'Color', 'r');
    title('Time to solve systems of equations using the direct method', 'Color', 'r');
    xlabel('Matrix size (N)', 'Color', 'r');
    ylabel('Time (s)', 'Color', 'r');
    grid on;

    print -dpng zadanie2.png 
end
