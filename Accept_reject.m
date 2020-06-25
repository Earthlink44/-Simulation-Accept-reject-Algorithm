close all;clear variables; clc;

%% accept reject algorithm

N = 50000;

M = 2.669;
alpha = 2.70; beta = 6.3;
% beta(,2) distribution
f = @(x) (x^(alpha-1)*(1-x)^(beta-1))/(gamma(alpha)*gamma(beta)/gamma(alpha+beta)); % target density 
g = @(x) 1; % instrumental density

Y = NaN(N,1);


for i =1:N
   x = rand();
   u = rand();
   
   if u <= f(x)/(M*g(x))
       Y(i,1) = x;
   end
end

Y(isnan(Y)) = [];
acceptrate = length(Y)/N
histogram(Y,50,'Normalization','probability');


