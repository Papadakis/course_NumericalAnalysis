function val = my_exp(x,n)
% Evaluate exponential function exp(x) 
% by Taylor series expansion
% f(x)=1 + x + x^2/2! + x^3/3! + … + x^n/n!

term(1) =1 ; s(1)= term(1);
disp('i         term(i)        sum(i)')
fprintf ('%2d   %10.5f  %10.5f \n',1, term(1), s(1))
for i = 1 : n-1
   term(i+1) = term(i)*x/i;
   s(i+1) =  s(i) + term(i+1);
   fprintf ('%2d   %10.5f  %10.5f \n',i+1, term(i+1), s(i+1))
end
val = s(n);
