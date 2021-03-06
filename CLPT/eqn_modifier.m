function [m_eqns] = eqn_modifier(a, b, h, m, n, x, y, eqns)
% equation modifier
% INPUT(S)
% - a, b: plate geometry
% - m, n: number of terms in the Navier's solution
% - x, y: plate coordinates
% - eqns: system of equilibrium equations
% OUTPUT(S)
% - system of equations without double-Fourier terms

% coded by Amir Baharvand (03-21)

m_eq1 = subs(eqns(1), cos(pi*m*x/a)*sin(pi*n*y/b), 1);
m_eq2 = subs(eqns(2), cos(pi*n*y/b)*sin(pi*m*x/a), 1);
m_eq3 = subs(eqns(3), sin(pi*m*x/a)*sin(pi*n*y/b), 1);

% replacing a and b
m_eq1 = subs(m_eq1, [a, b], [simplify(a / h), simplify(b / h)]);
m_eq2 = subs(m_eq2, [a, b], [simplify(a / h), simplify(b / h)]);
m_eq3 = subs(m_eq3, [a, b], [simplify(a / h), simplify(b / h)]);

m_eqns = [m_eq1, m_eq2, m_eq3];