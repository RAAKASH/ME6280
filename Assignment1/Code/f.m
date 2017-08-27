function [ f ] = f( rho,v,d,mu )
Re = rho*v.*d/mu;
if(Re>2300)
f = 0.182*Re.^(-0.2);
else 
f = 64./Re;
end
end
