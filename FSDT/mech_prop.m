% laminate mechanical properties
mat.mprop.E__11 = 172.5e3; % longitudinal Young's modulus
mat.mprop.E__22 = 6.9e3; % transverse Young's modulus
mat.mprop.E__33 = 6.9e3; % transverse Young's modulus
mat.mprop.mu__12 = 3.45e3; % in-plane shear modulus
mat.mprop.mu__13 = 3.45e3; % in-plane shear modulus
mat.mprop.mu__23 = 1.38e3; % out-of-plane shear modulus
mat.mprop.nu__12 = 0.25; % in-plane Poisson's ratio
mat.mprop.nu__13 = 0.25; % in-plane Poisson's ratio
mat.mprop.nu__23 = 0.25; % out-of-plane Poisson's ratio

% Poisson's ratio (nu) calculator
[mat]=  nu_cal(mat);