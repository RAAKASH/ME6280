function [ power ] = Power_Consum( rho,mu,V,l,d,n,h,eff)
Head = total_head(rho,mu,V,l,d,n,h );
power = Head*V/eff;
if((power-370)>0.01)
power = 10^6;
fprintf('Choose higher diameter pipe , Cost = %d \n',power);
end
end

