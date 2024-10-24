clear all
close all
format compact

n_max = 200; % max elements (defined)
a = 10; % max square size (self-defined)
r_max = 2; % max radius (defined)

% z2.1
[circles, index_number] = generate_circles(a, r_max, n_max);
plot_circles(a, circles, index_number); 
print -dpng zadanie1.png 

% z2.2
[circles, index_number, circle_areas] = generate_circles_2(a, r_max, n_max);
% z2.3
plot_circle_areas(circle_areas);
print -dpng zadanie3.png 

% z2.4
[circles, index_number, circle_areas, rand_counts, counts_mean] = generate_circles_3(a, r_max, n_max);
% z2.5
plot_counts_mean(counts_mean);
print -dpng zadanie5.png 
