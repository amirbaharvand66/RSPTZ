function [N__xx, M__x1, M__x2, M__x3, N__yy, M__y1, M__y2, M__y3, V__x1, V__x2, V__y1, V__y2, N__xy, M__xy1, M__xy2, M__xy3] = ...
    result_f_m(z, Z, phi__1, phi__2, phi__3, lam, theta, k)
% resultant forces and moments
% INPUT(S)
% - z: plate coordinate
% - Z: layup coordinate in z-direction
% - phi__1, phi__2, phi__3 (eq12)
% - lam: laminate stress
% - theta: ply angle
% OUTPUT(S)
% - resultant forces and moments

% coded by Amir Baharvand (03-21)

% stress components
sigma__xx = lam.((string("A" + theta) + "L" + k)).strsstrn.stress(1);
sigma__yy = lam.((string("A" + theta) + "L" + k)).strsstrn.stress(2);
sigma__zz = lam.((string("A" + theta) + "L" + k)).strsstrn.stress(3);
tau__xy = lam.((string("A" + theta) + "L" + k)).strsstrn.stress(4);
tau__yz = lam.((string("A" + theta) + "L" + k)).strsstrn.stress(5);
tau__xz = lam.((string("A" + theta) + "L" + k)).strsstrn.stress(6);

% resultant forces and moments
N__xx = int(sigma__xx, z, [Z(k), Z(k + 1)]);
M__x1 = int(phi__1 * sigma__xx, z, [Z(k), Z(k + 1)]);
M__x2 = int(phi__2 * sigma__xx, z, [Z(k), Z(k + 1)]);
M__x3 = int(phi__3 * sigma__xx, z, [Z(k), Z(k + 1)]);

N__yy = int(sigma__yy, z, [Z(k), Z(k + 1)]);
M__y1 = int(phi__1 * sigma__yy, z, [Z(k), Z(k + 1)]);
M__y2 = int(phi__2 * sigma__yy, z, [Z(k), Z(k + 1)]);
M__y3 = int(phi__3 * sigma__yy, z, [Z(k), Z(k + 1)]);

V__x1 = int(diff(phi__1, z) * tau__xz, z, [Z(k), Z(k + 1)]);
V__x2 = int(diff(phi__2, z) * tau__xz, z, [Z(k), Z(k + 1)]);

V__y1 = int(diff(phi__1, z) * tau__yz, z, [Z(k), Z(k + 1)]);
V__y2 = int(diff(phi__2, z) * tau__yz, z, [Z(k), Z(k + 1)]);

N__xy = int(tau__xy, z, [Z(k), Z(k + 1)]);
M__xy1 = int(phi__1 * tau__xy, z, [Z(k), Z(k + 1)]);
M__xy2 = int(phi__2 * tau__xy, z, [Z(k), Z(k + 1)]);
M__xy3 = int(phi__3 * tau__xy, z, [Z(k), Z(k + 1)]);