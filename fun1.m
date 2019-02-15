function [s,iter]=fun1(x0,x1,maxiter, tol)

f = inline('x^3-2*x^2+5');
ezplot(f);hold on;
plot(x0,0,'r*',x1,0,'r*')
xold = x0
xcurr = x1
fxo = f(xold)
fxc= f(xcurr)
it = 1;
dif = abs(xcurr - xold);
while it <= maxiter && dif > tol
   xnew = xcurr - (fxc*(xcurr-xold))/(fxc-fxo)
   plot(xnew,0,'r*'); pause
   it = it+1;
   dif = abs(xnew-xcurr);
   xold = xcurr;
   xcurr = xnew;
   fxo= fxc;
   fxc = f(xcurr)  
end
hold off
s = xnew;
iter = it;