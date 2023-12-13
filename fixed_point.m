function T = fixed_point(R, tol)
    % Starting point guess
    T = 300; 

    iterations = 0;
    cont = true;

    % Algorithm

    while cont
        
        % checking to see if T will be positive or negative
        check = (R/100)-1;
        
        % call appropriate function and use previous value of T
        if check < 0
            temp = g(T);
        else 
            temp = f(T);
        end
        
                
        prev = T;                   % store the previous value
        T = temp;                   % store the current value
        
        iterations = iterations +1;

        error = abs((T - prev)*100/T);

        if error < tol             % check if desired error is reached
            cont = false;
        end    
    end

    fprintf("The temperature obtained by fixed point is: " + T + "\n");
    fprintf("The number of required iterations for fixed point is: " + iterations + "\n");
    fprintf("The absolute relative approximate error %% for fixed point is: " + error*100 + "%%" + "\n");
    
    T = [];
    return

    function y = f(x)    % 0<= T < 850
        % constants
        R0 = 100;
        R = 260;
        A = 3.9083 * 10^-3;
        B = -5.775 * 10^-7; 
        
        y = ((R/R0)-1 - B*x^2)/A;

    end

    function y = g(x)   % -200<= T < 0 
        % constants
        R0 = 100;
        R = 55;
        A = 3.9083 * 10^-3;
        B = -5.775 * 10^-7; 
        C = -4.183 * 10^-12;
        
        y = ((R/R0)- 1 -B*x^2 + 100*C*x^3 - C*x^4)/A;
    end    
end