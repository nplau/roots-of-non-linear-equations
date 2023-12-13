resistance = input("Choose an input resistance: ");
tolerance = input("Choose a tolerance: ");

disp(bisection(resistance, tolerance))
fprintf("\n")

disp(fixed_point(resistance, tolerance))
fprintf("\n")

disp(newton(resistance, tolerance))
fprintf("\n")

