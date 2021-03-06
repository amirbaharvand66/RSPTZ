function [sigma__zz, tau__yz, tau__xz] = three_d_elasticity_eqn(x, y, z, Z, lam, theta, k)
% calculate "sigma__zz", "tau__yz", "tau__xz" from 3D elasticity equations
% INPUT(S)
% - x, y, z: plate coordinates
% - Z: layup coordinate in z-direction
% - lam: laminate stress
% - theta: ply angle
% OUTPUT(S)
% - sigma__zz, tau__yz, tau__xz
syms C__1 C__2 C__3
angle = [0, 90, 0];

% stress components
sigma__xx = lam.((string("A" + theta) + "L" + k)).strsstrn.stress(1);
sigma__yy = lam.((string("A" + theta) + "L" + k)).strsstrn.stress(2);
tau__xy = lam.((string("A" + theta) + "L" + k)).strsstrn.stress(4);

% calculate sigma__zz, tau__yz, tau__xz from 3D elasticity equations
tau__xz = -int(( diff(sigma__xx, x) + diff(tau__xy, y) ), z, [Z(k), z]) + C__1;
tau__yz = -int(( diff(tau__xy, x) + diff(sigma__yy, y) ), z, [Z(k), z]) + C__2;
sigma__zz = -int(( diff(tau__xz, x) + diff(tau__yz, y) ), z, [Z(k), z]) + C__3;

if k == 1
    % find constants C__1 C__2 C__3
    l_eq1 = subs(tau__xz, z, Z(1)) == 0;
    l_eq2 = subs(tau__yz, z, Z(1)) == 0;
    l_eq3 = subs(sigma__zz, z, Z(1)) == 0;
    l_eqns = [l_eq1, l_eq2, l_eq3];
    l_vars = [C__1, C__2, C__3];
    l_sol = solve(l_eqns, l_vars);
    % assign solution
    C__1 = l_sol.C__1;
    C__2 = l_sol.C__2;
    C__3 = l_sol.C__3;
else
    % find constants C__1 C__2 C__3
    l_eq1 = subs(tau__xz, z, Z(k)) == lam.((string("A" + angle(k - 1)) + "L" + (k - 1))).strsstrn.stress(6);
    l_eq2 = subs(tau__yz, z, Z(k)) == lam.((string("A" + angle(k - 1)) + "L" + (k - 1))).strsstrn.stress(5);
    l_eq3 = subs(sigma__zz, z, Z(k)) == lam.((string("A" + angle(k - 1)) + "L" + (k - 1))).strsstrn.stress(3);
    l_eqns = [l_eq1, l_eq2, l_eq3];
    l_vars = [C__1, C__2, C__3];
    l_sol = solve(l_eqns, l_vars);
    % assign solution
    C__1 = l_sol.C__1;
    C__2 = l_sol.C__2;
    C__3 = l_sol.C__3;
end

% recalculate sigma__zz, tau__yz, tau__xz from 3D elasticity equations
tau__xz = -int(( diff(sigma__xx, x) + diff(tau__xy, y) ), z, [Z(k), Z(k + 1)]) + C__1;
tau__yz = -int(( diff(tau__xy, x) + diff(sigma__yy, y) ), z, [Z(k), Z(k + 1)]) + C__2;
sigma__zz = -int(( diff(tau__xz, x) + diff(tau__yz, y) ), z, [Z(k), Z(k + 1)]) + C__3;