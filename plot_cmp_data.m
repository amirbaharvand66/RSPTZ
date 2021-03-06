clc
clear
close all

% LateX interpreter for plots
set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');

% import data
s1 = ["CLPT\plots"; "FSDT\plots"; "RSPTZ\plots"];
marker = {'k'; '--b';':r'};
leg_info = {'CLPT'; 'FSDT'; 'RSPTZ'};

for ii = 1:size(s1, 1)
    restoredefaultpath
    addpath(char(s1{ii, 1}))
    
    % u_bar
    u_bar = importdata("u_bar.txt");
    fig_u_bar = figure (1);
    hold on
    set(fig_u_bar, 'Pos', [0 0 800 600])
    box on
    set(gca, 'FontSize', 18)
    plot(u_bar(:, 1), u_bar(:, 2), marker{ii}, 'LineWidth', 2)
    xlabel('$\overline{u}(0, b/2, z)$', 'Interpreter','latex', 'FontSize', 28)
    ylabel('$\frac{z}{h}$', 'Interpreter','latex', 'FontSize', 40); set(get(gca,'ylabel'),'rotation',0)
    yticks([-0.5, -0.16, 0.16, 0.5])
    if ii == size(s1, 1)
        legend(leg_info, 'Interpreter','latex', 'FontSize', 15)
    end
    
    % sigma__xx_bar
    sigma__xx_bar = importdata("sigma__xx_bar.txt");
    fig_sigma__xx_bar = figure (2);
    hold on
    set(fig_sigma__xx_bar, 'Pos', [0 0 800 600])
    plot(sigma__xx_bar(:, 1), sigma__xx_bar(:, 2), marker{ii}, 'LineWidth', 2)
    xlabel('$\overline{\sigma}_{x}(a/2, b/2, z)$', 'Interpreter','latex', 'FontSize', 28)
    box on
    set(gca,'FontSize', 18)
    ylabel('$\frac{z}{h}$', 'Interpreter','latex', 'FontSize', 40); set(get(gca,'ylabel'),'rotation',0)
    yticks([-0.5, -0.16, 0.16, 0.5])
    if ii == size(s1, 1)
        legend(leg_info, 'Interpreter','latex', 'FontSize', 15, 'location', 'southeast')
    end
    
    % sigma__yy_bar
    sigma__yy_bar = importdata("sigma__yy_bar.txt");
    fig_sigma__yy_bar = figure (3);
    hold on
    set(fig_sigma__yy_bar, 'Pos', [0 0 800 600])
    plot(sigma__yy_bar(:, 1), sigma__yy_bar(:, 2), marker{ii}, 'LineWidth', 2)
    box on
    set(gca,'FontSize', 18)
    xlabel('$\overline{\sigma}_{y}(a/2, b/2, z)$', 'Interpreter','latex', 'FontSize', 28)
    ylabel('$\frac{z}{h}$', 'Interpreter','latex', 'FontSize', 40); set(get(gca,'ylabel'),'rotation',0)
    yticks([-0.5, -0.16, 0.16, 0.5])
    if ii == size(s1, 1)
        legend(leg_info, 'Interpreter','latex', 'FontSize', 15)
    end
    
    % tau__xy_bar
    tau__xy_bar = importdata("tau__xy_bar.txt");
    fig_tau__xy_bar = figure (4);
    hold on
    set(fig_tau__xy_bar, 'Pos', [0 0 800 600])
    plot(tau__xy_bar(:, 1), tau__xy_bar(:, 2), marker{ii}, 'LineWidth', 2)
    box on
    set(gca,'FontSize', 18)
    xlabel('$\overline{\tau}_{xy}(0, 0, z)$', 'Interpreter','latex', 'FontSize', 28)
    ylabel('$\frac{z}{h}$', 'Interpreter','latex', 'FontSize', 40); set(get(gca,'ylabel'),'rotation',0)
    yticks([-0.5, -0.16, 0.16, 0.5])
    if ii == size(s1, 1)
        legend(leg_info, 'Interpreter','latex', 'FontSize', 15, 'location', 'southeast')
    end
    
    % tau__xz_bar
    tau__xz_bar = importdata("tau__xz_bar.txt");
    int_tau__xz = trapz(tau__xz_bar(:, 1), tau__xz_bar(:, 2));
    
    fig_tau__xz_bar = figure (5);
    hold on
    set(fig_tau__xz_bar, 'Pos', [0 0 800 600])
    plot(tau__xz_bar(:, 1), tau__xz_bar(:, 2), marker{ii}, 'LineWidth', 2)
    box on
    set(gca,'FontSize', 18)
    xlabel('$\overline{\tau}_{xz}(0, b/2, z)$', 'Interpreter','latex', 'FontSize', 28)
    ylabel('$\frac{z}{h}$', 'Interpreter','latex', 'FontSize', 40); set(get(gca,'ylabel'),'rotation',0)
    yticks([-0.5, -0.16, 0.16, 0.5])
    if ii == size(s1, 1)
        legend(leg_info, 'Interpreter','latex', 'FontSize', 15, 'location', 'east')
    end
    
    % tau__yz_bar
    tau__yz_bar = importdata("tau__yz_bar.txt");
    int_tau__yz = trapz(tau__yz_bar(:, 1), tau__yz_bar(:, 2));
    
    fig_tau__yz_bar = figure (6);
    hold on
    set(fig_tau__yz_bar, 'Pos', [0 0 800 600])
    plot(tau__yz_bar(:, 1), tau__yz_bar(:, 2), marker{ii}, 'LineWidth', 2)
    box on
    set(gca,'FontSize', 18)
    xlabel('$\overline{\tau}_{yz}(a/2, 0, z)$', 'Interpreter','latex', 'FontSize', 28)
    ylabel('$\frac{z}{h}$', 'Interpreter','latex', 'FontSize', 40); set(get(gca,'ylabel'),'rotation',0)
    yticks([-0.5, -0.16, 0.16, 0.5])
    if ii == size(s1, 1)
        legend(leg_info, 'Interpreter','latex', 'FontSize', 15)
    end
    
    % tau__yz_bar
    w__0_bar = importdata("w__0_bar.txt");
    
    exact = [0, 2.006, 0.801, 0.534, 0.0505, 0.256, 0.217, 0.256, 0.217];
    theory = [u_bar(end, 1), -w__0_bar(300, 1), sigma__xx_bar(1, 1), sigma__yy_bar(201, 1), tau__xy_bar(1, 1), tau__xz_bar(301, 1), tau__yz_bar(301, 1)...
                    int_tau__xz, int_tau__yz];
    round(theory, 3)
    
    round(abs((theory - exact) ./ exact * 100), 1)
    
    rmpath(char( s1{ii, 1}))
end

% saveas(fig_u_bar, 'figures/u_bar', 'epsc')
% saveas(fig_sigma__xx_bar, 'figures/sigma__xx_bar', 'epsc')
% saveas(fig_sigma__yy_bar, 'figures/sigma__yy_bar', 'epsc')
% saveas(fig_tau__xy_bar, 'figures/tau__xy_bar', 'epsc')
% saveas(fig_tau__xz_bar, 'figures/tau__xz_bar', 'epsc')
% saveas(fig_tau__yz_bar, 'figures/tau__yz_bar', 'epsc')
