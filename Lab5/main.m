clear all
close all
format compact

%z5.1.
[V, original_Runge, original_sine, interpolated_Runge, interpolated_sine] = zadanie1();

%z5.2.
[nodes_Chebyshev, V, V2, original_Runge, interpolated_Runge, interpolated_Runge_Chebyshev] = zadanie2();

%z5.3.
[matrix_condition_numbers, max_coefficients_difference_1, max_coefficients_difference_2] = zadanie3();

%z5.4.
[M,N,P,R,x_coarse,y_coarse,F_coarse,x_fine,y_fine,F_fine] = zadanie4();

%z5.5.
[M,N,P,R,x_coarse,y_coarse,F_coarse,x_fine,y_fine,F_fine] = zadanie5();