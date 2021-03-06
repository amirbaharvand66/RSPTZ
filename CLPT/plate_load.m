function [q] = plate_load(a, b, m, n, x, y, q__0)
% external load
% INPUT(S)
% - a, b: plate geometry
% - m, n: number of terms in the Navier's solution
% - x, y: plate coordinates
% - q__0: uniform transverse load value
% OUTPUT(S)
% - q: plate loading (in this case is a transverse sinusoidal load in z-direction (normal to plate))

% coded by Amir Baharvand (03-21)

alpha = m * pi / a;
beta = n * pi / b;

% transverse distributed load
q = q__0 * sin(alpha * x) * sin(beta * y);
