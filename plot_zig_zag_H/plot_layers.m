function plot_layers(x1, x2, z)
% plot layers

for ii = 2:length(z) - 1
    plot([x1, x2], [z(ii), z(ii)], ':k')
end


