%%-------------------------------------------------------------------------
% Trainee: Cristian C. Rendon
% Supervisor: Oscar E. Ruiz
% 07/04/2018
%%-------------------------------------------------------------------------

%% Function that calcs the lift for a given polylines gamma
    %% INPUT:
        % pressure: matrix (N x 4) thta contains the pressure information
        %for each node
        % gamma: (3 x M) contains the polyline or border of the wing
        
    %% OUTPUT:
        % Lift: vector (3 x 1) that contains the result lift 

%% Fcuntion

function [lift] = calc_lift(pressure,gamma)

number_points = size(gamma,2);
number_elem = size(pressure,1);

lift = 0;

for i = 1:number_points - 1
    % Find the vector form point i to point i + 1
    line = gamma(:,i+1) - gamma(:,i);
    length_l = norm(line); 
    mid_p = (gamma(:,i+1) + gamma(:,i))/2;
    
    %Normal vector
    auxiliar = [0 0 1]';
    normal_v = cross(auxiliar,line);
    normal_v = normal_v/norm(normal_v);
    
    k = 1;
    pres = [];
    
    
    %Find the average pressure
    for j = 1:number_elem
        node = pressure(j,1:3)';
        if norm(node - mid_p) <= length_l
            pres(k) = pressure(j,4);
            k = k + 1;
        end
    end
    
    % Average pressure
    avg_p = mean(pres);
    
    % Multiply the presure by the length
    force_m = avg_p * length_l;
    
    % Sum te lift
    lift = lift + force_m * normal_v;
end

    
    