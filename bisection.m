function T = bisection(R, tol)

  reached_error = false;
  iters = 0;

  % Bisection Method Function 1
  if R < 100
    high = -200;
    low = 0;
    mid = (high + low)/2;

    while reached_error == false
      iters = iters + 1;
      if g(mid) == 0
          break
      elseif g(mid)*g(low) < 0
        high = mid;
      else
        low = mid;
      end
      old = mid;
      mid = (high + low)/2;
      error = abs((mid - old) / mid);
      
      if error < tol
        reached_error = true;
      end
    end

  % Bisection Method Function 2
  else 
    high = 0;
    low = 850;
    mid = (high + low)/2;

    while reached_error == false
      iters = iters + 1;
      if f(mid) == 0
          break
      elseif f(mid)*f(low) < 0
        high = mid;
      else
        low = mid;
      end
      old = mid;
      mid = (high + low)/2;
      error = abs((mid - old) / mid);
      
      if error < tol
        reached_error = true;
      end
    end
  end

  % Temperature Function 1
  function y = f(x)
    % Constants
    R0 = 100;
    A = 3.9083 * 10^-3;
    B = -5.775 * 10^-7;

    y = -A*x - B*x^2 + R/R0 - 1;
  end

  % Temperature Function 2
  function y = g(x)
    % Constants
    R0 = 100;
    A = 3.9083 * 10^-3;
    B = -5.775 * 10^-7;
    C = -4.183 * 10^-12;

    y = -A*x - B*x^2 - C*(x-100)*x^3 + R/R0 - 1;
  end

  fprintf("The temperature obtained by bisection is: " + mid + "\n");
  fprintf("The number of required iterations for bisection is: " + iters + "\n");
  fprintf("The absolute relative approximate error %% for fixed point is: " + error*100 + "%%" + "\n");
  
  T = [];
  return
end