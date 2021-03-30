close all;
clear all;

%% Slide 3

b0 = 1;
b1 = 5;
x = 0:0.1:10;
y = b0 + b1*x;

figure;
plot(x,y);
xlabel('x-axis');
ylabel('y-axis');
hold on

%% Slide 4

error = normrnd(0,1,[1 size(x,2)]);
y = b0 + b1*x + error;
plot(x,y);
hold off