function [displ, vars] = displ(a, b, m, n, x, y, U__0mn, U__1mn, U__zmn, V__0mn, V__1mn, V__zmn, W__0mn)
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
u__1 = U__1mn * cos(alpha * x) * sin(beta * y); 
u__z = U__zmn * cos(alpha * x) * sin(beta * y); 
v__0 = V__0mn * sin(alpha * x) * cos(beta * y);
v__1 = V__1mn * sin(alpha * x) * cos(beta * y);
v__z = V__zmn * sin(alpha * x) * cos(beta * y);
w__0 = W__0mn * sin(alpha * x) * sin(beta * y);

displ = [u__0, u__1, u__z, v__0, v__1, v__z, w__0];
vars = [U__0mn, U__1mn, U__zmn, V__0mn, V__1mn, V__zmn, W__0mn];