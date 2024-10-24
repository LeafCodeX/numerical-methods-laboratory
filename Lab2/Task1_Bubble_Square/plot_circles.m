function plot_circles(a, circles, index_number)
    axis equal; 
    axis([0 a 0 a]); 
    hold on;
    
    if mod(index_number, 2) == 0
        for i = 1:size(circles, 1) 
            plot_circle(circles(i, 3), circles(i, 1), circles(i, 2)); % Plot circle (r, xO, yO)
            pause(0.02); % Visualization of the drawing order
        end
    end
    
    hold off;
end
