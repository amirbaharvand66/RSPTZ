function [displ, vars] = displ(a, b, m, n, x, y, U__0mn, V__0mn, W__0mn, X__mn, Y__mn)
% displacements
% INPUT(S)
% - a, b: plate geometry
% - m, n: number of terms in the Navier's solution
% - x, y: plate coordinates
% - coefficients in the double_Fourier series and plate geometry
% OUTPUT(S) 
% - displ: double-Fourier series for displacements
% - vars: a row vector containing coefficients in the double_Fourier series

% coded by Amir Baharvand (03-21)

alpha = m * pi / a;
beta = n * pi / b;

u__0 = U__0mn * cos(alpha * x) * sin(beta * y);
v__0 = V__0mn * sin(alpha * x) * cos(beta * y);
w__0 = W__0mn * sin(alpha * x) * sin(beta * y);
phi__x = X__mn * cos(alpha * x) * sin(beta * y);
phi__y = Y__mn * sin(alpha * x) * cos(beta * y);

displ = [u__0, v__0, w__0, phi__x, phi__y];
vars = [U__0mn, V__0mn, W__0mn, X__mn, Y__mn];