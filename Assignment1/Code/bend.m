function [ploss] = bend( n,v,rho )
ploss = rho*n*0.15*v.^2/2;
end

