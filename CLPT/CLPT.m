clc
clear
close all

% Classical Laminate Plate Theory (CLPT)
% the solution procedure follows a three layers composite laminate with a stacking sequence of [0, 90, 0]

% coded by Amir Baharvand (03-21)

% removing previously-generated files
delete('maple_input_files\*')
junk_remover("maple_input_files\eqns_tmp.txt");
junk_remover("maple_input_files");
mkdir("maple_input_files");

% initials
syms a b m n h q__0 x y z
syms U__0mn V__0mn W__0mn
assume([a b h m n q__0 x y z], 'real');
assumeAlso(a > 0);
assumeAlso(b > 0);
assumeAlso(h > 0);
assumeAlso(m > 0);
assumeAlso(n > 0);
assume([U__0mn V__0mn W__0mn], 'real');

% laminate
theta =[0, 90, 0]; % ply angle
n_layup = length(theta); % number of layups
a = 4 * h; % plate length to thickness ratio
b = 4 * h; % plate width to thickness ratio
Z = linspace(-h / 2, h / 2, n_layup + 1); % layup coordinate in z-direction

% mechanical properties
mech_prop;

% stiffness matrix
[mat] = stiff_mat(mat);

% displacement
[displ, vars] = displ(a, b, m, n, x, y, U__0mn, V__0mn, W__0mn);

% computing laminate Q, strain and stress
[lam] = lam_strsstrn(x, y, z, n_layup, theta, mat, displ);

% plate loading
[q] = plate_load(a, b, m, n, x, y, q__0);

% sum of stresses over resultant forces and moments (equations after eq18)
lam.NMV.N__xx = 0; lam.NMV.N__xy = 0; lam.NMV.N__yy = 0;
lam.NMV.M__xx = 0; lam.NMV.M__xy = 0; lam.NMV.M__yy = 0;

% sum of the stresses for the WHOLE laminate in terms of resultant forces and moments
% choose the last option for turning 'on' and 'off' for calculating
% sigma__zz, tau__yz, tau__xz from 3D elasticity equations
tre_elas = 'off';
[lam] = result_f_m_collecter(n_layup, x, y, z, Z, lam, theta, tre_elas);

% equilibrium equations
[eqns] = equi_eqn(lam, x, y, q, displ);

% equation modifier
[m_eqns] = eqn_modifier(a, b, h, m, n, x, y, eqns);

% write to .txt file
file_name = "maple_input_files\layer_data";
extension = "txt";
for k = 1:n_layup
    write_lam(a, b, h, n_layup, lam, mat, file_name, extension, theta(k), k, tre_elas)
end

% write equilibrium equations to a .txt file
file_name = "maple_input_files\eqns_tmp";
extension = "txt";
write_eqns(m_eqns, file_name, extension)

% replace == to = for Maple input
replacer(file_name, extension)
clc
fprintf("Equations are generated successfully. \n");