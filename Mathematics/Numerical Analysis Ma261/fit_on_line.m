
function retval = fit_on_line (x, y )

syms  a  b  n   x_sum    y_sum    x_sq_sum    x_y_sum
 
normal_eqs = [ y_sum == n*a + b*x_sum ; x_y_sum == a*x_sum + b*x_sq_sum ]; 

x_sum = vpa(sum(x));

min_max = vpa(size(x));

n = vpa(min_max(2));

x_sum = vpa(sum(x));

y_sum = vpa(sum(y));

x_sq = vpa(x.^2);

x_sq_sum = vpa(sum(x_sq));

x_y = vpa(x.*y);

x_y_sum = vpa(sum(x_y));

i_eq =  eval(normal_eqs);

m = vpasolve(i_eq , [a,b]);


i = m(1);
j = m(2);

disp("a = " ) 
disp(i)
disp("b = ") 
disp(j)

endfunction
