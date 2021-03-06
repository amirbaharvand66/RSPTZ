function replacer(file_name, extension)
% replace == to = for Maple input
% INPUT(S)
% - file name
% - file extension
% OUTPUT(S)
% - modified equations for Maple

% coded by Amir Baharvand (03-21)

tmp = importdata(strcat(file_name, ".", extension));

for ii = 1:length(tmp)
    tmp{ii, 1} = strrep(tmp{ii, 1},"==","=");
end

writecell(tmp, "maple_input_files\eqns.txt")
delete(strcat(file_name, ".", extension))