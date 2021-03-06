function[eqns] = equi_eqn(lam, x, y, q, displ)
% equilibrium equations
% INPUT(S)
% - lam: resultant forces and moments
% - x, y: plate coordinates
% - q: plate loading
% - displ: double-Fourier series for displacements
% OUTPUT(S)
% - eqns: system of equilibrium equations

% coded by Amir Baharvand (03-21)

N__xx = lam.NMV.N__xx;
N__yy = lam.NMV.N__yy;
N__xy = lam.NMV.N__xy;
M__xx = lam.NMV.M__xx;
M__yy = lam.NMV.M__yy;
M__xy = lam.NMV.M__xy;

% nonlinear terms
w__0 = displ(3);
N = diff( (N__xx * diff(w__0, x) + N__xy * diff(w__0, y) ), x) + diff( (N__xy * diff(w__0, x) + N__yy * diff(w__0, y) ), y);

% equilibrium equations (eq18)
eq1 = diff(N__xx, x) + diff(N__xy, y) == 0;
eq2 = diff(N__xy, x) + diff(N__yy, y) == 0;
eq3 = diff(M__xx, x, x) + 2 * diff(M__xy, x, y) + diff(M__yy, y, y) + N + q == 0;

% system of equations
eqns = [eq1, eq2, eq3];