%%-------------------------------------------------------------------------
% Trainee: Cristian C. Rendon
% Supervisor: Oscar E. Ruiz
% 07/04/2018
%%-------------------------------------------------------------------------

clear 
close all
clc

iteration = 100;                % iteration to analize

%% Dat5a location
im_velocity = sprintf('./ansys_data/%i/velocity.csv',iteration);
im_trajectories = sprintf('./ansys_data/%i/trajectories.txt',iteration);
im_pts = sprintf('./Clipping/It_%i',iteration);
im_pres = sprintf('./ansys_data/%i/pressure.csv',iteration);


%% Import Gamma poiints
points = import_pts(im_pts);

%% Import pressure data
pressure = csvread(im_pres);
pressure(:,3) = 0;

%% Calc the lift

gamma = points';
gamma(3,:) = 0;
lift = calc_lift(pressure,gamma);

%% Import velocity vector field
velocity = csvread(im_velocity);

velocity(:,3 ) = [];
velocity(:,5) = [];

Mag(:,1) = sqrt(velocity(:,3).^2 + velocity(:,4).^2);
Mag(:,2) = Mag(:,1)./128.3591;

%% Draw the field
figure(1)
hold on

% Draw the velocity vectors
quiver(velocity(:,1),velocity(:,2),velocity(:,3),velocity(:,4),0.6)

grid on

% Draw the nodes
plot(velocity(:,1),velocity(:,2),'.')
title('Velocity over \Gamma')

% Draw the pts
plot(points(:,1),points(:,2),'-ob')

axis([-4 4 -2 2])
axis equal
title('Velocity vector field')


%% Read the datas set for trajecotries
data = load(im_trajectories);

cut = find(data(:,1) == inf);

curves(1).curve = 1;
curves(1).streamline = data(1:cut(1)-1,:);

figure(2)
hold on

for i = 2 : length(cut)
    ind = cut(i);
    curves(i).curve = i;
    curves(i).streamline = data(cut(i-1)+1:cut(i)-1,:);
    plot(curves(i).streamline(:,1),curves(i).streamline(:,2))
end

% Draw the pts
plot(points(:,1),points(:,2),'-ob')

title('Particle trajectories')
axis equal


n_curv = size(curves,2);


%% Calculation of the curvatures 
for i = 1 : n_curv
    [curves(i).tangent curves(i).curvature] = curvature_calc(curves(i).streamline');
    maxi = max(curves(i).curvature);
    mini = min(curves(i).curvature(2:end-1));
    curves(i).rgb = curves(i).curvature./(maxi);
end

figure(3)
hold on

plot(curves(52).streamline(:,1),curves(52).streamline(:,2),'r')
plot(curves(52).streamline(:,1),curves(52).curvature,'r')


plot(curves(60).streamline(:,1),curves(60).streamline(:,2),'k')
plot(curves(60).streamline(:,1),curves(60).curvature,'k')
