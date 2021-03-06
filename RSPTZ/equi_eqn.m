function[eqns] = equi_eqn(lam, x, y, q)
% equilibrium equations
% INPUT(S)
% - lam: resultant forces and moments
% - x, y: plate coordinates
% - q: plate loading
% OUTPUT(S)
% eqns: system of equilibrium equations

% coded by Amir Baharvand (03-21)

N__xx = lam.NMV.N__xx;
M__x1 = lam.NMV.M__x1;
M__x2 = lam.NMV.M__x2;
M__x3 = lam.NMV.M__x3;
N__yy = lam.NMV.N__yy;
M__y1 = lam.NMV.M__y1;
M__y2 = lam.NMV.M__y2;
M__y3 = lam.NMV.M__y3;
V__x1 = lam.NMV.V__x1;
V__x2 = lam.NMV.V__x2;
V__y1 = lam.NMV.V__y1;
V__y2 = lam.NMV.V__y2;
N__xy = lam.NMV.N__xy;
M__xy1 = lam.NMV.M__xy1;
M__xy2 = lam.NMV.M__xy2;
M__xy3 = lam.NMV.M__xy3;

% equilibrium equations (eq18)
eq1 = diff(N__xx, x) + diff(N__xy, y) == 0;
eq2 = diff(M__x1, x) + diff(M__xy1, y) - V__x1 == 0;
eq3 = diff(M__x2, x) + diff(M__xy2, y) - V__x2 == 0;
eq4 = diff(N__yy, y) + diff(N__xy, x) == 0;
eq5 = diff(M__y1, y) + diff(M__xy1, x) - V__y1 == 0;
eq6 = diff(M__y2, y) + diff(M__xy2, x) - V__y2 == 0;
eq7 = diff(M__x3, x, x) + diff(M__y3, y, y) + 2 * diff(M__xy3, x, y) - q == 0;

% system of equations
eqns = [eq1, eq2, eq3, eq4, eq5, eq6, eq7];