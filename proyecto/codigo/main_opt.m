%%-------------------------------------------------------------------------
% Trainee: Cristian C. Rendon
% Supervisor: Oscar E. Ruiz
% 07/04/2018
%%-------------------------------------------------------------------------

clear all
close all
clc

%% REad the data 

velocity = csvread('velocity.csv');

velocity(:,3 ) = [];
velocity(:,5) = [];

Mag(:,1) = sqrt(velocity(:,3).^2 + velocity(:,4).^2);
Mag(:,2) = Mag(:,1)./128.3591;

%% Draw the field
figure(1)
hold on


quiver(velocity(:,1),velocity(:,2),velocity(:,3),velocity(:,4),0.75)

grid on

plot(velocity(:,1),velocity(:,2),'.')
title('Velocity over \Gamma')

axis([-4 4 -2 2])
axis equal
title('Velocity vector field')


%% Read the datas set for trajecotries
data = load('trajectories.txt');

cut = find(data(:,1) == inf);

curves(1).node = 1;
curves(1).data = data(1:cut(1)-1,:);

for i = 2 : length(cut)
    ind = cut(i);
    curves(i).node = i;
    curves(i).data = data(cut(i-1)+1:cut(i)-1,:);
    
end

n_curv = size(curves,2);
figure(2)
hold on

for i = 2 : n_curv
    it = sprintf('%i',i); 
    text(curves(i).data(10,1),curves(i).data(10,2),it)
    plot(curves(i).data(:,1),curves(i).data(:,2))
end

title('Particle trajectories')

axis equal