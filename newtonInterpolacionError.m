function newtonInterpolacionError()
    % Datos
    x = [1, 2, 3];
    y = [0, 0.6931472, 1.098612];
    x_eval = 2.5;  % Punto a evaluar
    valor_real = log(x_eval);  % Valor real para comparar con el polinomio

    % Calcula diferencias divididas
    n = length(x);
    dd = zeros(n,n); % Matriz para diferencias divididas
    dd(:,1) = y'; % Primera columna: valores de y

    for j = 2:n
        for i = j:n
            dd(i,j) = (dd(i,j-1) - dd(i-1,j-1)) / (x(i) - x(i-j+1));
        end
    end

    % Construcción del polinomio y evaluación
    p = dd(1,1);
    mult = 1;
    for j = 2:n
        mult = mult * (x_eval - x(j-1));
        p = p + dd(j,j) * mult;
    end

    % Calcular error porcentual
    error_porcentual = abs((valor_real - p) / valor_real) * 100;

    % Mostrar resultados
    fprintf('Valor interpolado en x = %.2f: %.6f\n', x_eval, p);
    fprintf('Valor real (ln(%.2f)) = %.6f\n', x_eval, valor_real);
    fprintf('Error porcentual = %.4f%%\n', error_porcentual);
end
