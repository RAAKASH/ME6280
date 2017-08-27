function [Head] = total_head(rho,mu,V,l,d,n,h )
v = velocity(V,d);
Head = bend( n,v,rho)+ rho*f( rho,v,d,mu ).*l.*v.^2./(2*d) + rho*9.81*h;
end
