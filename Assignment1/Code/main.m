% Cost of PVC pipes, pumps, running cost and maintenance cost, pump efficincy
clc
close all
%% Question 1
close all
rho = 10^3;
mu = 8*10^(-4);
l = 270;
V = 12000*10^-3/3600;
n = 4;
h = 22;
d = 0.01;
efficiency = 0.8;
plot(0.03:0.001:0.07,total_head(rho,mu,V,l,0.03:0.001:0.07,n,h )*V/efficiency)
xlabel('Diameter of pipe [m]'); ylabel('Power rating of pump [W]'); title('Power required vs Diameter of pipe');
grid on
pause
close all
plot(0.03:0.001:0.07,total_head(rho,mu,V,l,0.03:0.001:0.07,n,h )/rho/9.81)
grid on
xlabel('Diameter of pipe [m]'); ylabel('Total head [m]'); title('Total head vs Diameter of pipe');
hold on
plot([0.055,.055],[0,total_head(rho,mu,V,l,[0.055],n,h )/rho/9.81],'r--');
plot([0.03,.055],[total_head(rho,mu,V,l,[0.055],n,h ),total_head(rho,mu,V,l,[0.055],n,h )]/rho/9.81,'r--');
hold off
%% Question 2

% Pump data
% 2 pumps , each of 0.37 KW
eff = 0.7; % Efficiency
V = 2160/3600*10^-3; % m^3/s
Power = 0.37; % Rated power in KW
h = 25; % Maximum head
t = 24000/V/3600/2*10^-3; % Time to fill tanks 5 hrs

% Electricty price
inc = [106,107]/100; % Increment in power price

% Pipe data
l = 270; %m
%% Fixed Cost 
pump_price = 5891*2; %Rs
pipe_cost = Pipe_cost(l,d)*2;
%% Electricity cost
h = 22;
d = 0.05;
Electricity_price=0;
for i=0:1:19
Electricity_price = Electricity_price + 365*Power_Consum( rho,mu,V,l,d,n,h,eff)/1000*t*2*5.5*(inc.^(i)); % Rs 5.5 cost per unit
end
%% Maintenance cost
Maintenance_cost = (pump_price+pipe_cost)*1/100*2*4*20; % 1% of fixed for every 3 months
%% Total Cost - Optimizing
fun =  @(X)Total_cost(X,rho,mu,V,l,n,h,eff,t,inc);
[d,fval] = fminunc(fun,0.04);

for k = 6:2:16
    j=0;
    val = 0;
    inc =[100+k,107]/100;
for i =0.03:0.001:0.05 
    j = j+1;
    val(j) = Total_cost(i,rho,mu,V,l,n,h,eff,t,inc);
end
plot(0.03:0.001:0.05,val);
xlabel('Diameter of pipe [m]'); ylabel('Cost in Rs'); title('Cost vs Diameter');   
grid on
hold on
end