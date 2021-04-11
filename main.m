clear all;
close all;

%% Data import

V = niftiread('bold.nii.gz'); % Load NiFTI file
dm = readmatrix('design_matrix.txt');

%% GLM computation

x = 50;
y = 50;
z = 50;

Vp = reshape(V(x,y,z,:),[1 size(V,4)]);
[B, DEV, stats] = glmfit(dm(1:end-2,1:3),double(Vp),'normal','constant','off');

%% Data visualization

figure;
t = 1:size(Vp,2);
plot(t,Vp);
hold on

y = B(1)*dm(1:end-2,1) + B(2)*dm(1:end-2,2) + B(3)*dm(1:end-2,3);
plot(t,y(1:size(Vp,2)));