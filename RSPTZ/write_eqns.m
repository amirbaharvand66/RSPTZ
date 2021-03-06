function write_eqns(m_eqns, file_name, extension)
% write equilibrium equations to a .txt file
% INPUT(S)
% - m_eqns: modified equations
% - file name
% - file extension
% OUTPUT(S)
% a file containing modified equations

% coded by Amir Baharvand (03-21)

% opening ...
diary(strcat(file_name, ".", extension))

for ii = 1:length(m_eqns)
    fprintf("eq%d := %s :\n", ii, m_eqns(ii))
end

% ... closing
diary off