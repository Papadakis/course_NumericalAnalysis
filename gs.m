%% H synarthsh ayth ylopoiei thn epanalhptikh me8odo gauss-seidel


function [sol, err, it] = gs(a , x0, b, eps, maxiter)

xold = x0;
error = eps + 1;
iter = 0;
d = tril(a);
mat = - triu(a, 1);
clf; 
title('Gauss-Seidel iterations');
xlabel('iterations');
ylabel('log_{10} of error , ||.||_2');
hold on;
while (iter < maxiter & error > eps)
  xnew = d\(mat*xold + b);
  error = norm(xnew - xold);
  xold = xnew;
  iter = iter + 1;
  fprintf('Sthn %d epanalhpsh to diadoxiko sfalma %f12.8 . \n',...
      iter,error );
  plot([iter],[log10(error)], 'g*');
end

err = error;
it = iter; 
sol = xnew;