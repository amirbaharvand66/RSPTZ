function [Q] = trans_stiff_mat(theta, mat)
% transformed stiffness matrix [Q] w.r.t laminate coordinate (x, y, z)
% Q__ij = Q__ji, (i, j = 1..6)
% INPUT(S)
% - theta: ply angle
% - mat.stiff: lamina stiffness matrix
% OUTPUT(S)
% -[Q] : transformed stiffness matrix

% coded by Amir Baharvand (03-21)

% assigning [C] components
C__11 = mat.stiff.C__11;
C__12 = mat.stiff.C__12;
C__13 = mat.stiff.C__13;
C__21 = mat.stiff.C__21;
C__31 = mat.stiff.C__31;
C__22 = mat.stiff.C__22;
C__23 = mat.stiff.C__23;
C__32 = mat.stiff.C__32;
C__33 = mat.stiff.C__33;
C__44 = mat.stiff.C__44;
C__55 = mat.stiff.C__55;
C__66 = mat.stiff.C__66;

% initials
c = cosd(theta);
s = sind(theta);

% [Q] components
Q__11 = C__11 * c^4 + 2 * (C__12 + 2 * C__44) * s^2 * c^2 + C__22 * s^4;
Q__12 = C__12 * (c^4 + s^4) + (C__11 + C__22 - 4 * C__44) * s^2 * c^2;
Q__13 = C__13 * c^2 + C__23 * s^2;
Q__14 = (C__11 - C__12 - 2 * C__44) * s * c^3 + (C__12 - C__22 + 2 * C__44) * c * s^3;
Q__21 = Q__12;
Q__31 = Q__13;
Q__41 = Q__14;
Q__22 = C__11 * s^4 + C__22 * c^4 + (2 * C__12 + 4 * C__44) * s^2 * c^2;
Q__23 = C__13 * s^2 + C__23 * c^2;
Q__24 = (C__11 - C__12 - 2 * C__44) * s^3 * c + (C__12 - C__22 + 2 * C__44) * c^3 * s;
Q__32 = Q__23;
Q__42 = Q__24;
Q__33 = C__33;
Q__34 = (C__31 - C__32) * s * c;
Q__43 = Q__34;
Q__44 = (C__11 - 2 * C__12 + C__22 - 2 * C__44) * c^2 * s^2 + C__44 * (c^4 + s^4);
Q__55 = C__55 * c^2 + C__66 * s^2;
Q__56 = (C__66 - C__55) * c * s;
Q__65 = Q__56;
Q__66 = C__55 * s^2 + C__66 * c^2;

% [Q]
Q = [Q__11 , Q__12 , Q__13 , Q__14 , 0 , 0 ;
        Q__21 , Q__22 , Q__23 , Q__24 , 0 , 0 ;
        Q__31 , Q__32 , Q__33 , Q__34 , 0 , 0 ;
        Q__41 , Q__42 , Q__43 , Q__44 , 0 , 0 ;
        0 , 0 , 0 , 0 , Q__55 , Q__56 ;
        0 , 0 , 0 , 0 , Q__65 , Q__66 ];