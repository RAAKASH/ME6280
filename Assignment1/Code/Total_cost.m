function [Tot ] = Total_cost( d,rho,mu,V,l,n,h,eff,t,inc)
%% Fixed Cost 
y = 16; % Expected lifetime in years
pump_price = 5891*2; %Rs
pipe_cost = Pipe_cost(l,d);
%% Electricity cost
Electricity_price=0;
for i=0:1:(y-1)
Electricity_price = Electricity_price + 365*Power_Consum( rho,mu,V,l,d,n,h,eff)/1000*t*2*5.5*(inc.^(i)); % Rs 5.5 cost per unit
end
%% Maintenance cost
Maintenance_cost = (pump_price+pipe_cost)*1/100*2*4*y; % 1% of pump cost for every 3 months
%% Total Cost
Tot = pump_price + pipe_cost +Electricity_price+ Maintenance_cost;
Tot = Tot(2);
end

