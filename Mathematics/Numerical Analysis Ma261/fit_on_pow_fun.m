
function retval = fit_on_pow_fun (u, v )

x = log(u)
y = log(v)  


syms  a  b  n   x_sum    y_sum    x_sq_sum    x_y_sum
 
normal_eqs = [ y_sum == n*a + b*x_sum ; x_y_sum == a*x_sum + b*x_sq_sum ]; 

min_max = (size(x));

n = vpa(min_max(2),16)

x_sum = vpa(sum(x) ,16)

y_sum = vpa(sum(y) ,16)

x_sq = (x.^2);

x_sq_sum = vpa(sum(x_sq),16)

x_y = (x.*y);

x_y_sum = vpa(sum(x_y) ,16)

i_eq =  eval(normal_eqs)

m = vpasolve(i_eq , [a,b])


i = m(1);
j = m(2);

disp("A = " ) 
disp(i)
disp("b = ") 
disp(j)

syms f(x) x  a  b

eq = f(x) == a*(x^b)
a = exp(i);
b = j;

eval(eq)


endfunction
