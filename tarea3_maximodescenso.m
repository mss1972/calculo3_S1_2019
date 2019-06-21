%% Script para maximo Descenso para resolver sistema de ecuaciones lineales

% matriz y parte derecha del sistema de ecuaciones lineales
A = [3 2;2 6];
b = [2;-8];

% se generara una malla de N^2 pares ordenados
% los valores de x e y son tales que la solucion exacta al sistema de
% ecuaciones pertenece al rectangulo generado por x e y
N = 20;
x = linspace(-1,5,N);
y = linspace(-5,1,N);
[X,Y] = meshgrid(x,y);

% evaluando funcion: f(x) = <Ax-b;Ax-b>
X = reshape(X,N^2,1);
Y = reshape(Y,N^2,1);
Z11 = A(1,1)*X + A(1,2)*Y - b(1);
Z12 = A(2,1)*X + A(2,2)*Y - b(2);
Z1 = Z11.^2 + Z12.^2;
Z1 = reshape(Z1,N,N);
X = reshape(X,N,N);
Y = reshape(Y,N,N);
% graficando funcion f 
figure(1)
surf(X,Y,Z1)
% graficando curvas de nivel de f y vector gradiente en distintos
% puntos del dominio de f
figure(2)
hold on
contour(x,y,Z1,100)
[u,v] = gradient(Z1);
quiver(x,y,2*u,2*v);
axis([-1 5 -5 1])

% solucion exacta al sistema de ecuaciones
% para comprobar que las iteraciones del metodo de maximo
% descenso se acercan a ella
sol = A\b;
% se muestra solucion exacta con un asterisco rojo
plot(sol,'r*')

% valor inicial para metodo de maximo descenso
x0 = [0;0];
% se muestra valor de f en x0 para comprobar que 
% en cada iteracion del metodo de maximo descenso
% este valor disminuye
disp(['iteracion 0'])
(norm(A*x0-b))^2

% mostrando aproximacion inicial como un asterisco rojo
plot(x0(1),x0(2),'k*')

% las aproximaciones sucesivas del metodo de maximo descenso
% se mostraran con los siguientes colores
colors = {'bs','gs','bo','go','bd','gd'};

% solo realizaremos 6 iteaciones del metodo de maximo descenso
% si quieren hacer mas de 6 iteraciones deben completar los
% colores con que se mostraran en colors
for i = 1 : 6
    % un paso de metodo de maximo descenso
    % calcular nuevo valor de x0
    % en cada paso mostrar en la figura 2:
    % 1. direccion de descenso (-gradiente en x0) desde x0
    % para mostrar esto basta hacer
    % quiver(x0(1),x0(2),direccion(1),direccion(2))
    % 2. nueva aproximacion x0
    % para hacer esto basta hacer plot(x0(1),x0(2),colors{i})
    display(['iteracion: ',num2str(i)]);
    (norm(A*x0-b))^2
end
