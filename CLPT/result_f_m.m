function [N__xx, N__xy, N__yy, M__xx, M__xy, M__yy, lam] = result_f_m(x, y, z, Z, lam, theta, k, tre_elas)
% resultant forces and moments
% INPUT(S)
% - x, y, z: plate coordinate
% - Z: layup coordinate in z-direction
% - lam: laminate stress
% - theta: ply angle
% - 3D elasticity option
% OUTPUT(S)
% - resultant forces and moments

% coded by Amir Baharvand (03-21)

% stress components
sigma__xx = lam.((string("A" + theta) + "L" + k)).strsstrn.stress(1);
sigma__yy = lam.((string("A" + theta) + "L" + k)).strsstrn.stress(2);
tau__xy = lam.((string("A" + theta) + "L" + k)).strsstrn.stress(4);

% decision on using 3D elasticity equations for calculating sigma__zz, tau__yz, tau__xz
if strcmpi (tre_elas, 'on')
    [sigma__zz, tau__yz, tau__xz] = three_d_elasticity_eqn(x, y, z, lam, Z, theta, k);
    lam.((string("A" + theta) + "L" + k)).strsstrn.stress(3) = sigma__zz;
    lam.((string("A" + theta) + "L" + k)).strsstrn.stress(5) = tau__yz;
    lam.((string("A" + theta) + "L" + k)).strsstrn.stress(6) = tau__xz;
else
    sigma__zz = lam.((string("A" + theta) + "L" + k)).strsstrn.stress(3);
    tau__yz = lam.((string("A" + theta) + "L" + k)).strsstrn.stress(5);
    tau__xz = lam.((string("A" + theta) + "L" + k)).strsstrn.stress(6);
end

% resultant forces and moments
N__xx = int(sigma__xx, z, [Z(k), Z(k + 1)]);
N__xy = int(tau__xy, z, [Z(k), Z(k + 1)]);
N__yy = int(sigma__yy, z, [Z(k), Z(k + 1)]);
M__xx = int(z * sigma__xx, z, [Z(k), Z(k + 1)]);
M__xy = int(z * tau__xy, z, [Z(k), Z(k + 1)]);
M__yy = int(z * sigma__yy, z, [Z(k), Z(k + 1)]);