function plot_circle_areas(circle_areas)
    plot(circle_areas, 'r', 'LineWidth', 2);
    title('Cumulative Sum of Circle Areas', 'Color', 'r'); 
    xlabel('Number of Circles', 'Color', 'r');
    ylabel('Total Area Covered by Circles', 'Color', 'r');
    grid on;
end
