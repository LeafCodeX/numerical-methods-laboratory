function plot_counts_mean(counts_mean)
    plot(counts_mean, 'r', 'LineWidth', 2);
    title('Mean Random Selections per Circle', 'Color', 'r'); 
    xlabel('Number of Circles', 'Color', 'r');
    ylabel('Mean Random Selections', 'Color', 'r');
    grid on;
end