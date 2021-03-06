function junk_remover(file_name)
% - delete residual files
% INPUT(S)
% - file name to delete

% coded by Amir Baharvand (03-21)

if isfile(file_name) % delete files
    delete(file_name)
elseif isfolder(file_name) % delete folders
    rmdir(file_name)
end