function [strain] = strn_displ(displ, z, x, y)
% strain-displacement (assuming infinitesimal strain)
% INPUT(S)
% - displ: double-Fourier series for displacements
% - x, y, z: plate coordinates
% OUTPUT(S)
% - strain: strain vector

% coded by Amir Baharvand (03-21)

u__0 = displ(1);
v__0 = displ(2);
w__0 = displ(3);

epsilon__xx = diff(u__0, x) + 1 / 2 * (diff(w__0, x))^2 - z * diff(w__0, x, x);
epsilon__yy = diff(v__0, y) + 1 / 2 * (diff(w__0, y))^2 - z * diff(w__0, y, y);
epsilon__zz = 0;
gamma__xy = diff(u__0, y) + diff(v__0, x) + diff(w__0, x) * diff(w__0, y) - 2 * z * diff(w__0, x, y);
gamma__yz = 0;
gamma__xz = 0;

strain = [epsilon__xx; epsilon__yy; epsilon__zz; gamma__xy; gamma__yz; gamma__xz];