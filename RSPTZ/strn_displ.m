function [strain, phi__1, phi__3] = strn_displ(displ, H, h, x, y, z)
% strain-displacement (assuming infinitesimal strain)
% INPUT(S)
% - displ: double-Fourier series for displacements
% - H(z): zig-zag function
% - h: plate thickness
% - x, y, z: plate coordinates
% OUTPUT(S)
% - strain: strain vector
% - phi__1, phi__3 (eq12)

% coded by Amir Baharvand (03-21)

u__0 = displ(1);
u__1 = displ(2);
u__z = displ(3);
v__0 = displ(4);
v__1 = displ(5);
v__z = displ(6);
w__0 = displ(7);

phi__1 = h / pi * sin(pi * z / h);
phi__2 = H;
phi__3 = -z;
epsilon__xx = diff(u__0, x) + phi__1 * diff(u__1, x) + phi__2 * diff(u__z, x) + phi__3 * diff(w__0, x, x);
epsilon__yy = diff(v__0, y) + phi__1 * diff(v__1, y) + phi__2 * diff(v__z, y) + phi__3 * diff(w__0, y, y);
epsilon__zz = 0;
gamma__xy = diff(u__0, y) + phi__1 * diff(u__1, y) + phi__2 * diff(u__z, y) + diff(v__0, x) + phi__1 * diff(v__1, x) + phi__2 * diff(v__z, x) + 2 * phi__3 * diff(w__0, x, y);
gamma__yz = diff(phi__1, z) * v__1 + diff(phi__2, z) * v__z;
gamma__xz = diff(phi__1, z) * u__1 + diff(phi__2, z) * u__z;

strain = [epsilon__xx; epsilon__yy; epsilon__zz; gamma__xy; gamma__yz; gamma__xz];