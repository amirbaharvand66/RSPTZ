function [sigma__zz, tau__yz, tau__xz] = three_d_elasticity_eqn(x, y, z, lam, Z, theta, k)
% calculate "sigma__zz", "tau__yz", "tau__xz" from 3D elasticity equations
% INPUT(S)
% - x, y, z: plate coordinates
% - lam: laminate stress
% - Z: layup coordinate in z-direction
% - theta: ply angle
% OUTPUT(S)
% - sigma__zz, tau__yz, tau__xz

% stress components
sigma__xx = lam.((string("A" + theta) + "L" + k)).strsstrn.stress(1);
sigma__yy = lam.((string("A" + theta) + "L" + k)).strsstrn.stress(2);
tau__xy = lam.((string("A" + theta) + "L" + k)).strsstrn.stress(4);

tau__xz = int(-( diff(sigma__xx, x) + diff(tau__xy, y) ), z, [Z(k), Z(k + 1)]);
tau__yz = int(-( diff(tau__xy, x) + diff(sigma__yy, y) ), z, [Z(k), Z(k + 1)]);
sigma__zz = int(-( diff(tau__xz, x) + diff(tau__yz, y) ), z, [Z(k), Z(k + 1)]);