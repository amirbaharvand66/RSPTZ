clc
clear
close all
set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');

h = 1;
n = 3; % number of layers
lam.z = linspace(-h / 2, h / 2, n + 1); % lamina coordinate
dis = 1000; % number of discrete
crd = linspace(-h / 2, h / 2, n * dis); % coordinates in each lamina
M = zeros(1, length(crd)); % Murakami function
H = zeros(1, length(crd)); % new zig-zag function
dM = zeros(1, length(crd));
dH = zeros(1, length(crd));
z1 = lam.z(1);
zN = lam.z(end);
a1 = 2 / (lam.z(2) - lam.z(1));
aN = 2 / (lam.z(end) - lam.z(end-1));

for k = 1:n
    a = 2 / (lam.z(k+1) - lam.z(k));
    b = (lam.z(k+1) + lam.z(k)) / (lam.z(k+1) - lam.z(k));
    z = crd(dis*k -(dis - 1) : k*dis);
    zeta = (a * z - b);
    
    M(dis*k -(dis - 1) : k*dis) = (-1)^k * zeta;
    
    N = (-1)^k * sinh(zeta);
    N1 =  -(z.^2 / 2 / z1 + (z.^3 - 1.5 * z1 * z.^2) / 6 / zN^2) * (-a1 * cosh(-1));
    NN =  -((z.^3 - 1.5 * z1 * z.^2) / 6 / zN^2) * ((-1)^n * aN * cosh(1));
    H(dis*k -(dis - 1) : k*dis) = N + N1 + NN;
end

fig_MzHz = figure (1);
set (fig_MzHz, 'Pos', [0 0 800 600])
plot(M, crd/h, 'k', 'LineWidth', 2)
hold on
plot(H, crd/h, '--k', 'LineWidth', 2)
set(gca, 'FontSize', 18)
ylabel('$\frac{z}{h}$', 'Interpreter','latex', 'FontSize', 36); set(get(gca,'ylabel'),'rotation',0)
yticks([-0.5, -0.16, 0.16, 0.5])
xlim([-1.5, 1.5])

%plotting layers
plot_layers(-1.5, 1.5, lam.z)
legend('$M^{k}$', '$H^{k}$', 'Interpreter','latex', 'FontSize', 24)

% plotting the derivatives
for k = 1:n
    a = 2 / (lam.z(k+1) - lam.z(k));
    b = (lam.z(k+1) + lam.z(k)) / (lam.z(k+1) - lam.z(k));
    z = crd(dis*k -(dis - 1) : k*dis);
    zeta = (a * z - b);
    dZeta = a;
    
    dM(dis*k -(dis - 1) : k*dis) = (-1)^k * dZeta;
    
    dN = (-1)^k * a * cosh(zeta);
    dN1 =  -(z / z1 + (3* z.^2 - 3 * z1 * z) / 6 / zN^2) * (-a1 * cosh(-1));
    dNN =  -((3 * z.^2 - 3 * z1 * z) / 6 / zN^2) * ((-1)^n * aN * cosh(1));
    dH(dis*k -(dis - 1) : k*dis) = dN ;
end

fig_dMzHz = figure (2);
set (fig_dMzHz, 'Pos', [0 0 800 600])
plot(dM, crd/h, 'k', 'LineWidth', 2)
hold on
plot(dH, crd/h, '--k', 'LineWidth', 2)
set(gca, 'FontSize', 18)
ylabel('$\frac{z}{h}$', 'Interpreter','latex', 'FontSize', 36); set(get(gca,'ylabel'),'rotation',0)
yticks([-0.5, -0.16, 0.16, 0.5])
xlim([-10, 15])

%plotting layers
plot_layers(-10, 15, lam.z)
legend('$M^{k}$', '$H^{k}$', 'Interpreter','latex', 'FontSize', 24)
saveas(fig_MzHz, 'MzHz', 'epsc')
saveas(fig_dMzHz, 'dMzHz', 'epsc')
