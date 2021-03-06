function [lam, phi__1, H, phi__3] = lam_strsstrn(h, x, y, z, n_layup, theta, Z, mat, displ)
%  solver for displacements (U__0mn, U__1mn, U__zmn, V__0mn, V__1mn, V__zmn, W__0mn)
% INPUT(S)
% - h: plate thickness
% - x, y, z: plate coordinates
% - n_layup: number of layups
% - theta: ply angle
% - Z: layup coordinate in z-direction
% - mat: mechanical properties
% - displ: displacement fields
% OUTPUT(S)
% - lam: laminate properties
% - phi__1 (eq12)
% - H for each layer (the same as phi__2 (eq12))
% - phi__3 (eq12)

% coded by Amir Baharvand (03-21)

for k = 1:n_layup    
    % zig-zag function, H(z)
    [H.((string("A" + theta(k)) + "L" + k))] = H_func(n_layup, Z, z, k);
    
    % transformed stiffness matrix [Q]
    [lam.((string("A" + theta(k)) + "L" + k)).Qmat.Q]= trans_stiff_mat(theta(k), mat);
    
    % strain-displacement
    [lam.((string("A" + theta(k)) + "L" + k)).strsstrn.strain, phi__1, phi__3] = strn_displ(displ, H.((string("A" + theta(k)) + "L" + k)), h, x, y, z);
    
    % stress-strain
    [lam.((string("A" + theta(k)) + "L" + k)).strsstrn.stress] = strs_strn(lam, theta(k), k);
end