% H synarthsh newtonc ylopoiei th me8odo tou Newton gia thn 
% eyresh ths rizas ths synarthshs f(x) = ekfrash me arxikh timh to x0.
% gia version 7 tou Matlab



function [xstar, iter] = newtonc(ekfrash, x0, tol, maxiter)

f = inline(ekfrash);
df = diff(sym(ekfrash));

fid = fopen('newton.dat','w');
fprintf(fid,'Iter        xold              xnew           fxnew\n');
fprintf(    'Iter        xold              xnew           fxnew\n');
hold on; plot(x0, 0,'ro'); hold off;
xold = x0;
fxold = feval(f, xold);
x=xold;
dfxold = eval(df);
if abs(dfxold) <= eps
   fprintf('H paragwgos mhdenizetai sto %f kai h me8odos Newton den mporei na synexisei.\n',xold);
   return;
end
xnew = xold - fxold/dfxold;
fxnew = feval(f, xnew); 
fprintf(fid,'%d     %12.10f       %12.10f      %12.10f\n',1, xold, xnew, fxnew);
fprintf(    '%d     %12.10f       %12.10f      %12.10f\n',1, xold, xnew, fxnew);
iter = 1;
hold on; plot(xnew, 0,'ro'); hold off;
while (iter < maxiter) & (abs(xold-xnew) > tol)
   xold = xnew;
   fxold = fxnew; 
   x = xold;
   dfxold = eval(df);
   if abs(dfxold) > eps
      xnew = xold - fxold/dfxold;
      fxnew = feval(f, xnew);
      fprintf(fid,'%d     %12.10f       %12.10f      %12.10f\n',iter+1, xold, xnew, fxnew);
      fprintf(    '%d     %12.10f       %12.10f      %12.10f\n',iter+1, xold, xnew, fxnew);      
   else
      fprintf('H paragwgos mhdenizetai sto %f kai h me8odos Newton den mporei na synexisei.\n',xold);
      xstar = xnew;
      return;
   end
   iter = iter + 1 ;
   hold on; plot(xnew, 0,'ro'); hold off;
 end

xstar = xnew;
fclose(fid);

