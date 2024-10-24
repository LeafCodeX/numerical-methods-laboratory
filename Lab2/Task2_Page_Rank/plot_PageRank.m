function plot_PageRank(r)
    bar(r, 'FaceColor', 'r')
    title('PageRank Scores', 'Color', 'r'); 
    xlabel('Page Index', 'Color', 'r');
    ylabel('PageRank Value', 'Color', 'r');
    grid on;
end
