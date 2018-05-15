 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cristian Camilo Rendon
% 201510021014
% 09/02/2018
% Supervisor: Prof. Oscar E. Ruiz Salguero
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Fucntion that imports the data set of the typed name
    %% INPUTS:
        % name: Name of the file
        
    %% OUTPUTS:
        % Data: (N x 2) matrix with x y coordinates of the points

%% Function

function [Data] = import_pts(name)

%% load the data
B = xlsread(name);

%% Select just the x and y coodinates
Data = B(:,3:4);

end
       