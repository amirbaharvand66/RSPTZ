clc
clear 
close all

% LateX interpreter for plots
set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');

figure()
% u_bar
u_bar = importdata("u_bar.txt");
plot(u_bar(:, 1), u_bar(:, 2), 'k', 'LineWidth', 1)
xlabel('$\overline{u}(0, b/2, z)$', 'Interpreter','latex', 'FontSize', 24)
ylabel('$\frac{z}{h}$', 'Interpreter','latex', 'FontSize', 36); set(get(gca,'ylabel'),'rotation',0)
box on
set(gca, 'FontSize', 16)

figure()
% sigma__xx_bar
sigma__xx_bar = importdata("sigma__xx_bar.txt");
plot(sigma__xx_bar(:, 1), sigma__xx_bar(:, 2), 'k', 'LineWidth', 1)
xlabel('$\overline{\sigma}_{xx}(a/2, b/2, z)$', 'Interpreter','latex', 'FontSize', 24)
ylabel('$\frac{z}{h}$', 'Interpreter','latex', 'FontSize', 36); set(get(gca,'ylabel'),'rotation',0)
box on
set(gca, 'FontSize', 16)

figure()
% sigma__yy_bar
sigma__yy_bar = importdata("sigma__yy_bar.txt");
plot(sigma__yy_bar(:, 1), sigma__yy_bar(:, 2), 'k', 'LineWidth', 1)
xlabel('$\overline{\sigma}_{yy}(a/2, b/2, z)$', 'Interpreter','latex', 'FontSize', 24)
ylabel('$\frac{z}{h}$', 'Interpreter','latex', 'FontSize', 36); set(get(gca,'ylabel'),'rotation',0)
box on
set(gca, 'FontSize', 16)

figure()
% tau__xy_bar
tau__xy_bar = importdata("tau__xy_bar.txt");
plot(tau__xy_bar(:, 1), tau__xy_bar(:, 2), 'k', 'LineWidth', 1)
xlabel('$\overline{\tau}_{xy}(0, 0, z)$', 'Interpreter','latex', 'FontSize', 24)
ylabel('$\frac{z}{h}$', 'Interpreter','latex', 'FontSize', 36); set(get(gca,'ylabel'),'rotation',0)
box on
set(gca, 'FontSize', 16)

figure()
% tau__xz_bar
tau__xz_bar = importdata("tau__xz_bar.txt");
plot(tau__xz_bar(:, 1), tau__xz_bar(:, 2), 'k', 'LineWidth', 1)
xlabel('$\overline{\tau}_{xy}(0, 0, z)$', 'Interpreter','latex', 'FontSize', 24)
ylabel('$\frac{z}{h}$', 'Interpreter','latex', 'FontSize', 36); set(get(gca,'ylabel'),'rotation',0)
box on
set(gca, 'FontSize', 16)

figure()
% tau__yz_bar
tau__yz_bar = importdata("tau__yz_bar.txt");
plot(tau__yz_bar(:, 1), tau__yz_bar(:, 2), 'k', 'LineWidth', 1)
xlabel('$\overline{\tau}_{xy}(0, 0, z)$', 'Interpreter','latex', 'FontSize', 24)
ylabel('$\frac{z}{h}$', 'Interpreter','latex', 'FontSize', 36); set(get(gca,'ylabel'),'rotation',0)
box on
set(gca, 'FontSize', 16)


% tau__yz_bar
w__0_bar = importdata("w__0_bar.txt");

exact = [0, 2.006, 0.801, 0.534, 0.0505, 0.256, 0.217];
theory = [u_bar(end, 1), -w__0_bar(300, 1), sigma__xx_bar(1, 1), sigma__yy_bar(201, 1), tau__xy_bar(1, 1), tau__xz_bar(301, 1), tau__yz_bar(301, 1)];
round(theory, 3)

abs((theory - exact) ./ exact * 100)


