function [mat]=  nu_cal(mat)
% calculate the Poisson's ratio (nu) for different directions
% INPUT(S)
% - mat: mechanical properties
% OUTPUT(S)
% - Poisson's ratio (nu)

% coded by Amir Baharvand (03-21)

% assigning material properties
E__11 = mat.mprop.E__11;
E__22 = mat.mprop.E__22;
E__33 = mat.mprop.E__33;
nu__12 = mat.mprop.nu__12;
nu__13 = mat.mprop.nu__13;
nu__23 = mat.mprop.nu__23;

% nu
nu__21 = nu__12 / E__11 * E__22;
nu__31 = nu__13 / E__11 * E__33;
nu__32 = nu__23 / E__22 * E__33;

% saving data to material (mat)
mat.mprop.nu__21 = nu__21;
mat.mprop.nu__31 = nu__31;
mat.mprop.nu__32 = nu__32;