clear all
close all
format compact

load('energy.mat');

%6.1.
[country, source, degrees, y_original, y_approximation, mse] = zadanie1(energy);

%6.2.
[country, source, degrees, y_original, y_movmean, y_approximation, mse] = zadanie2(energy);

%6.3.
[country, source, degrees, x_coarse, x_fine, y_original, y_yearly, y_approximation, mse] = zadanie3(energy);

%6.4.
[country, source, degrees, x_coarse, x_fine, y_original, y_yearly, y_approximation, mse, msek] = zadanie4(energy);