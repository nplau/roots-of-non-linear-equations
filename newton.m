function T = newton(R, tol)
    % Result
    T = 300;  

    iterations = 0;
    cont = true;

    while cont
       % checking to see if T will be positive or negative
            check = (R/100)-1;

        % call appropriate function and use previous value of T
        if check < 0
            temp = T - h(T)/p(T);
        else 
            temp = T - f(T)/g(T);
        end

        prev = T;                   % store the previous value
        T = temp;                   % store the current value

        iterations = iterations +1;

        error = abs((T - prev)/T);
        
        if error < tol              % check if desired error is reached
            cont = false;
        end  
    end    

    fprintf("The temperature obtained by newton-raphson is: " + T + "\n");
    fprintf("The number of required iterations for newton-raphson is: " + iterations + "\n");
    fprintf("The absolute relative approximate error %% for newton-raphson is: " + error*100 + "%%" + "\n");
    
    T = [];
    return

    function y = f(x)       % 0<= T < 850 f(T)
        % constants
        R0 = 100;
        A = 3.9083 * 10^-3;
        B = -5.775 * 10^-7; 

        y = -B*x^2 - A*x + (R/R0)-1;
    end

    function y = g(x)      % 0<= T < 850 f'(T)
        % constants
        A = 3.9083 * 10^-3;
        B = -5.775 * 10^-7; 

        y = -2*B*x - A;
    end

    function y = h(x)     % -200<= T < 0 f(T)
        % constants
        R0 = 100;
        A = 3.9083 * 10^-3;
        B = -5.775 * 10^-7; 
        C = -4.183 * 10^-12;

        y = - C*(x-100)*x^3 - B*x^2 - A*x + (R/R0)-1;
    end    

    function y = p(x)     % -200<= T < 0 f'(T)
        % Constants
        A = 3.9083 * 10^-3;
        B = -5.775 * 10^-7;
        C = -4.183 * 10^-12;

        y = -4*C*x^3 - 3*C*(x-100)*x^2 - 2*B*x - A;
    end
end