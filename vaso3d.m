% Definir el rango de valores para x
x = linspace(0, 12, 200);
% Definir las funciones piecewise
funcion1 = zeros(size(x));
funcion1(2 < x & x < 8.37) = -0.04836 * x(2 < x & x < 8.37).^2
+ 0.74 * x(2 < x & x < 8.37) + 1.2333;
funcion2 = zeros(size(x));
funcion2(8.37 < x & x < 10) = 1.3076 * x(8.37 < x & x < 10).^2
- 24.0538 * x(8.37 < x & x < 10) + 113.7815;
funcion3 = zeros(size(x));
funcion3(10 < x & x < 12) = -0.2820 * x(10 < x & x < 12).^2 + 6.6110 * x(10 < x & x < 12) - 33.9145;
funcion4 = zeros(size(x));
funcion4((0 < x & x < 1.5)) = 3.5;
funcion5 = zeros(size(x));
funcion5((1.5 <= x & x <= 2)) = -1.9607 * x((1.5 <= x & x <=2)) + 6.4215;
% Calcular la suma de las funciones
suma = funcion1 + funcion2 + funcion3 + funcion4 + funcion5;
% Calcular las coordenadas X, Y, Z para el cilindro
[X, Y, Z] = cylinder(suma);
% Definir el rango de valores para x del mango
x_mango = linspace(2.5, 7.8925, 100); % Rango de valores para el mango
% Definir las funciones piecewise para el mango
mango1 = -0.4966 * x_mango.^2 + 5.3947 * x_mango - 7.5828;
x_mango_extended = linspace(2.092, 8.209, 100); % Extender el rango de x para la conexión con el vaso
mango2 = -0.4686 * x_mango_extended.^2 + 5.0689 *x_mango_extended - 5.9844;
% Graficar la superficie
figure(1)
surf(X, Y, Z)
title('Superficie 3D')
% Graficar el cilindro
figure(2)
mesh(X, Y, Z)
title('Cilindro 3D')
% Crear una figura 3D para el mango del vaso
figure(3)
plot3(x_mango, mango1, zeros(size(x_mango)), 'b', 'LineWidth',2)
hold on
plot3(x_mango_extended, mango2, zeros(size(x_mango_extended)),'b', 'LineWidth', 2)
hold off
title('Mango del Vaso')
xlabel('X')
ylabel('Y')
zlabel('Z')
grid on
view(3)