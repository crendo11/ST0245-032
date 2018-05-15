%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cristian Camilo Rendon Cardona
% 201510021014
% 10/08/2017
% Supervisor: Prof. Oscar E. Ruiz Salguero
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [tangent,curvature] = curvature_calc(curve)

%% Input:
    % X: Matrix (3xN) wich contains the curve's points
    
%% Outputs:
% t: Matrix (Nx3) with the tangent at any point of the curve
% k: Matrix (Nx1) with the curvature at any point of the curve

%% Function

%% Intial variables
n_pts = size(curve,2);

curvature = zeros(1,n_pts);
tangent = zeros(3,n_pts);

%% Find the curvature and tangent in each point
for i = 2 : n_pts - 1
    
    %% Find the tangent and create the vector
    ti = curve(:,i+1) - curve(:,i);
    tangent(:,i) = ti/norm(ti);
    %         ti_1 = X(:,i) - X(:,i-1);
    %         t(:,i-1) = ti_1/norm(ti_1);
    
    %% Find the points i-1, i, i+1
    vi = curve(:,i);
    vi_1 = curve(:,i-1);
    vi_p1 = curve(:,i+1);
    
    deno = (vi + vi_p1)/2 - (vi_1 + vi)/2;
    
    %% Find the curvature
    curvature(i) = norm(tangent(:,i) - tangent(:,i-1))/norm(deno);
    
    
end

end

