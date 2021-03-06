function [lam] = lam_strsstrn(x, y, z, n_layup, theta, mat, displ)
%  solver for displacements (U__0mn, V__0mn, W__0mn)
% INPUT(S)
% - x, y, z: plate coordinates
% - n_layup: number of layups
% - theta: ply angle
% - mat: mechanical properties
% - displ: displacement fields
% OUTPUT(S)
% - lam: laminate properties

% coded by Amir Baharvand (03-21)

for k = 1:n_layup    
    % transformed stiffness matrix [Q]
    [lam.((string("A" + theta(k)) + "L" + k)).Qmat.Q]= trans_stiff_mat(theta(k), mat);
    
    % strain-displacement
    [lam.((string("A" + theta(k)) + "L" + k)).strsstrn.strain] = strn_displ(displ, z, x, y);
    
    % stress-strain
    [lam.((string("A" + theta(k)) + "L" + k)).strsstrn.stress] = strs_strn(lam, theta(k), k);
end