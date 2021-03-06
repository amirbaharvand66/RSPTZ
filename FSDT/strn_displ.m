function [strain] = strn_displ(displ, x, y, z)
% strain-displacement (assuming infinitesimal strain)
% INPUT(S)
% - displ: double-Fourier series for displacements
% - x, y, z: plate coordinates
% OUTPUT(S)
% - strain: strain vector
% - phi__1, phi__3 (eq12)

% coded by Amir Baharvand (03-21)

u__0 = displ(1);
v__0 = displ(2);
w__0 = displ(3);
phi__x = displ(4);
phi__y = displ(5);

epsilon__xx = diff(u__0, x) + 1 / 2 * (diff(w__0, x))^2 + z * diff(phi__x, x);
epsilon__yy = diff(v__0, y) + 1 / 2 * (diff(w__0, y))^2 + z * diff(phi__y, y);
epsilon__zz = 0;
gamma__xy = diff(u__0, y) + diff(v__0, x) + diff(w__0, x) * diff(w__0, y) + z * (diff(phi__x, y) + diff(phi__y, x));
gamma__yz = diff(w__0, y) + phi__y;
gamma__xz = diff(w__0, x) + phi__x;

strain = [epsilon__xx; epsilon__yy; epsilon__zz; gamma__xy; gamma__yz; gamma__xz];