function write_lam(a, b, h, n_layup, lam, mat, file_name, extension, theta, k, tre_elas)
% write laminate properties to a file
% INPUT(S)
% - a, b, h: plate geometry
% - n_layup: number of layups
% - lam: laminate properties
% - mat: mechanical properties
% - file name
% - file extension
% - theta: ply angle
% OUTPUT(S)
% - a file containing [Q], strain and stress for each layer

% coded by Amir Baharvand (03-21)

% assigning relevant data
E__22 = mat.mprop.E__22;
Q = lam.((string("A" + theta) + "L" + k)).Qmat.Q;
strain = lam.((string("A" + theta) + "L" + k)).strsstrn.strain;
stress = lam.((string("A" + theta) + "L" + k)).strsstrn.stress;
tau__yz = lam.((string("A" + theta) + "L" + k)).strsstrn.stress(5);
tau__xz = lam.((string("A" + theta) + "L" + k)).strsstrn.stress(6);

% writing laminate data
if k == 1
    % opening ...
    diary(strcat("maple_input_files\laminate", ".", extension))

    fprintf("a_h_ratio := %s: \n", simplify(a / h));
    fprintf("b_h_ratio := %s: \n", simplify(b / h));
    fprintf("n_layup := %d: \n", n_layup);
    fprintf("Z := RegularArray(-0.5..0.5, n_layup + 1): \n");
    fprintf("E__22 := %d: \n", E__22);
    
    % ... closing
    diary off
end

% opening ...
diary(strcat(file_name, num2str(k), ".", extension))

% writing [Q]
fprintf("Q := \n")
fprintf("Matrix([")
for ii = 1:size(Q, 1)
    if ii == 6
        fprintf("[%f, %f, %f, %f, %f, %f] \n", Q(ii, :)')
    else
        fprintf("[%f, %f, %f, %f, %f, %f], \n", Q(ii, :)')
    end
end
fprintf("]); \n")

% writing strain
fprintf("strain := \n")
fprintf("Vector[column]([")
for ii = 1:length(strain)
    if ii == 6
        fprintf("%s \n", strain(ii)')
    else
        fprintf("%s, \n", strain(ii)')
    end
end
fprintf("]); \n")

% writing stress
fprintf("stress := \n")
fprintf("Matrix([")
for ii = 1:length(stress)
    if ii == 6
        fprintf("[%s] \n", stress(ii)')
    else
        fprintf("[%s], \n", stress(ii)')
    end
end
fprintf("]); \n")

% using 3D elasticity equations sigma__zz, tau__yz, tau__xz are calculated
% from these equations
if strcmpi (tre_elas, 'on')
    fprintf("tre_elas := %s: \n", '"on"');
    fprintf("tau__yz := %s: \n", tau__yz);
    fprintf("tau__xz := %s: \n", tau__xz);
else
    fprintf("tre_elas := %s: \n", "off");
end

% ... closing
diary off