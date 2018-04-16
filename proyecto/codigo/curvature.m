%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cristian Camilo Rendon Cardona
% 201510021014
% 10/08/2017
% Supervisor: Prof. Oscar E. Ruiz Salguero
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [t,k] = curvature(X)

%% Input:
    % X: Matrix (3xN) wich contains the curve's points
    
%% Outputs:
% t: Matrix (Nx3) with the tangent at any point of the curve
% k: Matrix (Nx1) with the curvature at any point of the curve

%% Function

%% Intial variables
n_pts = size(X,2);

k = zeros(1,n_pts);



%% Find the curvature and tangent in each point
for i = 2 : n_pts - 1
    
    %% Stage change
    if X(:,i) == X(:,i-1)
        %% Find the tangent and create the vector
        ti = X(:,i+1) - X(:,i);
        t(:,i) = ti/norm(ti);
%         ti_1 = X(:,i) - X(:,i-2);
%         t(:,i-1) = ti_1/norm(ti_1);
        
        %% Find the points i-1, i, i+1
        vi = X(:,i);
        vi_1 = X(:,i-1);
        vi_p1 = X(:,i+1);
        
        deno = (vi + vi_p1)/2 - (vi_1 + vi)/2;
        
        %% Find the curvature
        k(i) = norm(t(:,i) - t(:,i-1))/norm(deno);
    elseif X(:,i) == X(:,i+1)
        %% Find the tangent and create the vector
        ti = X(:,i+2) - X(:,i);
        t(:,i) = ti/norm(ti);
%         ti_1 = X(:,i) - X(:,i-1);
%         t(:,i-1) = ti_1/norm(ti_1);
        
        %% Find the points i-1, i, i+1
        vi = X(:,i);
        vi_1 = X(:,i-1);
        vi_p1 = X(:,i+2);
        
        deno = (vi + vi_p1)/2 - (vi_1 + vi)/2;
        
        %% Find the curvature
        k(i) = norm(t(:,i) - t(:,i-1))/norm(deno);
    
    
    
    
    else
        %% Find the tangent and create the vector
        ti = X(:,i+1) - X(:,i);
        t(:,i) = ti/norm(ti);
%         ti_1 = X(:,i) - X(:,i-1);
%         t(:,i-1) = ti_1/norm(ti_1);
        
        %% Find the points i-1, i, i+1
        vi = X(:,i);
        vi_1 = X(:,i-1);
        vi_p1 = X(:,i+1);
        
        deno = (vi + vi_p1)/2 - (vi_1 + vi)/2;
        
        %% Find the curvature
        k(i) = norm(t(:,i) - t(:,i-1))/norm(deno);
        
    end
end

end

