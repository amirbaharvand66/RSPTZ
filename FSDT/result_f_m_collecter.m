function [lam] = result_f_m_collecter(scf, n_layup, x, y, z, Z, lam, theta, tre_elas)
% sum of stress terms over the WHOLE laminate (all layers) and collect them as one term of
% resultant force and moment for each parameter N__xx, M__x1, ...
% INPUT(S)
% - scf: shear correction factor
% - n_layup: number of layups
% - x, y, z: plate coordinate
% - Z: layup coordinate in z-direction
% - lam: laminate stress
% - theta: ply angle
% - 3D elasticity option
% OUTPUT(S)
% - sum of the stresses for the WHOLE laminate in terms of resultant forces and moments

% coded by Amir Baharvand (03-21)

for k = 1:n_layup
    [N__xx, N__xy, N__yy, M__xx, M__xy, M__yy, Q__x, Q__y, lam] = result_f_m(scf, x, y, z, Z, lam, theta(k), k, tre_elas);
    lam.NMV.N__xx = N__xx + lam.NMV.N__xx;
    lam.NMV.N__xy = N__xy + lam.NMV.N__xy;
    lam.NMV.N__yy = N__yy + lam.NMV.N__yy;
    lam.NMV.M__xx = M__xx + lam.NMV.M__xx;
    lam.NMV.M__xy = M__xy + lam.NMV.M__xy;
    lam.NMV.M__yy = M__yy + lam.NMV.M__yy;
    lam.NMV.Q__x = Q__x + lam.NMV.Q__x;
    lam.NMV.Q__y = Q__y + lam.NMV.Q__y;
end