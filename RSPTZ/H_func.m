function [H] = H_func(n_layup, Z, z, k)
% zig-zag function, H(z), proposed by
% Li, X., & Liu, D. (1995). Zigzag theory for composite laminates. AIAA Journal, 33(6), 1163–1165. https://doi.org/10.2514/3.12671
% INPUT(S)
% - n_layup: number of layups
% - Z: layup coordinate in z-direction
% - z: plate coordinate
% OUTPUT(S)
% - H(z): zig-zag function

% coded by Amir Baharvand (03-21)

% initials
a__1 = 2 / (Z(2) - Z(1)); % a__1 in eq(4)
a__N = 2 / (Z(end) - Z(end-1)); % a__N in eq(4)
z__1 = Z(1); % z__1 in eq(4)
z__t = Z(end); % z__(N+1) in eq(4)
a__k = 2 / (Z(k+1) - Z(k));
b__k = (Z(k+1) + Z(k)) / (Z(k+1) - Z(k));
zeta__k = a__k * z - b__k;

% collecting terms for H(z)
N = (-1)^k * sinh(zeta__k);
N__1 = -(z^2 / 2 / z__1 + (z^3 -1.5 * z__1 * z^2) / 6 / z__t^2) * (-a__1 * cosh(-1));
N__N = -((z^3 - 1.5 * z__1 * z^2) / 6 / z__t^2) * ((-1)^n_layup * a__N * cosh(1));
H = N + N__1 + N__N;