function [mat] = stiff_mat(mat)
% stiffness matrix [C] w.r.t lamina coordinate system (1, 2, 3)
% INPUT(S)
% - mat: mechanical properties
% OUTPUT(S)
% - stiffness matrix

% coded by Amir Baharvand (03-21)

% assigning material properties
E__11 = mat.mprop.E__11;
E__22 = mat.mprop.E__22;
E__33 = mat.mprop.E__33;
mu__12 = mat.mprop.mu__12;
mu__13 = mat.mprop.mu__13;
mu__23 = mat.mprop.mu__23;
nu__12 = mat.mprop.nu__12;
nu__13 = mat.mprop.nu__13;
nu__23 = mat.mprop.nu__23;
nu__21 = mat.mprop.nu__21;
nu__31 = mat.mprop.nu__31;
nu__32 = mat.mprop.nu__32;

% C components
Delta = (1 - nu__12 * nu__21 - nu__23 * nu__32 - nu__31 * nu__13 - nu__21 * nu__32 * nu__13 - nu__12 * nu__23 * nu__31);
C__11 = E__11 * (1 - nu__23 * nu__32) / Delta;
C__12 = E__11 * (nu__21 + nu__31 * nu__23) / Delta;
C__13 = E__11 * (nu__31 + nu__21 * nu__32) / Delta;
C__21 = C__12; 
C__31 = C__13;
C__22 = E__22 * (1 - nu__13 * nu__31) / Delta;
C__23 = E__22 * (nu__32 + nu__12 * nu__31) / Delta;
C__32 = C__23;
C__33 = E__33 * (1 - nu__12 * nu__21) / Delta;
C__44 = mu__12;
C__55 = mu__23;
C__66 = mu__13;

% saving data to material (mat)
mat.stiff.C__11 = C__11;
mat.stiff.C__12 = C__12;
mat.stiff.C__13 = C__13;
mat.stiff.C__21 = C__21;
mat.stiff.C__31 = C__31;
mat.stiff.C__22 = C__22;
mat.stiff.C__23 = C__23;
mat.stiff.C__32 = C__32;
mat.stiff.C__33 = C__33;
mat.stiff.C__44 = C__44;
mat.stiff.C__55 = C__55;
mat.stiff.C__66 = C__66;
mat.stiff.C = [C__11, C__12, C__13, 0, 0, 0;
                      C__21, C__22, C__23, 0, 0, 0;
                      C__31, C__32, C__33, 0, 0, 0;
                      0, 0, 0, C__44, 0, 0;
                      0, 0, 0, 0, C__55, 0;
                      0, 0, 0, 0, 0, C__66];