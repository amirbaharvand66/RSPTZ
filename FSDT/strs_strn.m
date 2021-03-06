function [stress] = strs_strn(lam, theta, k)
% stress-strain (assuming infinitesimal strain)
% INPUT(S)
% - lam: laminate properties
% - theta: ply angle
% OUTPUT(S)
% - stress: stress vector

% coded by Amir Baharvand (03-21)

Q = lam.((string("A" + theta) + "L" + k)).Qmat.Q;
strain = lam.((string("A" + theta) + "L" + k)).strsstrn.strain;

stress = Q * strain;