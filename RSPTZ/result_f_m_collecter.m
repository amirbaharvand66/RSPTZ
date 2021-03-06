function [lam] = result_f_m_collecter(n_layup, z, Z, phi__1, H, phi__3, lam, theta)
% sum of stress terms over the WHOLE laminate (all layers) and collect them as one term of
% resultant force and moment for each parameter N__xx, M__x1, ...
% INPUT(S)
% - n_layup: number of layups
% - z: plate coordinate
% - Z: layup coordinate in z-direction
% - phi__1 (eq12)
% - H for each layer (the same as phi__2 (eq12))
% - phi__3 (eq12)
% - lam: laminate properties
% - theta: ply angle
% OUTPUT(S)
% - sum of the stresses for the WHOLE laminate in terms of resultant forces and moments

% coded by Amir Baharvand (03-21)

for k = 1:n_layup
    [N__xx, M__x1, M__x2, M__x3, N__yy, M__y1, M__y2, M__y3, V__x1, V__x2, V__y1, V__y2, N__xy, M__xy1, M__xy2, M__xy3] = ...
        result_f_m(z, Z, phi__1, H.((string("A" + theta(k)) + "L" + k)), phi__3, lam, theta(k), k);
    lam.NMV.N__xx = N__xx + lam.NMV.N__xx;
    lam.NMV.M__x1 = M__x1 + lam.NMV.M__x1;
    lam.NMV.M__x2 = M__x2 + lam.NMV.M__x2;
    lam.NMV.M__x3 = M__x3 + lam.NMV.M__x3;
    lam.NMV.N__yy = N__yy + lam.NMV.N__yy;
    lam.NMV.M__y1 = M__y1 + lam.NMV.M__y1;
    lam.NMV.M__y2 = M__y2 + lam.NMV.M__y2;
    lam.NMV.M__y3 = M__y3 + lam.NMV.M__y3;
    lam.NMV.V__x1 = V__x1 + lam.NMV.V__x1;
    lam.NMV.V__x2 = V__x2 + lam.NMV.V__x2;
    lam.NMV.V__y1 = V__y1 + lam.NMV.V__y1;
    lam.NMV.V__y2 = V__y2 + lam.NMV.V__y2;
    lam.NMV.N__xy = N__xy + lam.NMV.N__xy;
    lam.NMV.M__xy1 = M__xy1 + lam.NMV.M__xy1;
    lam.NMV.M__xy2 = M__xy2 + lam.NMV.M__xy2;
    lam.NMV.M__xy3 = M__xy3 + lam.NMV.M__xy3;
end