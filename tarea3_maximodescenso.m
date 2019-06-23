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

% Ejercicio 1. Si z = (x,y), evalue f(z) = <Az-b;Az-b> y muestre el grafico
% de f y sus curvas de nivel (en figuras diferentes). 
% En el grafico de las curvas de nivel muestre el vector gradiente 
% de f evaluado en distintos puntos.

% Mostrando la solucion exacta al
% sistema de ecuaciones en el grafico con curvas de nivel de f. 
% Esto se hace para comprobar, graficamente, que las iteraciones 
% del metodo de maximo descenso se acercan a ella
sol = A\b;
% se muestra solucion exacta con un asterisco rojo
plot(sol,'r*')


% valor inicial para metodo de maximo descenso
x0 = [0;0];
% se muestra en pantalla el valor de f en x0 para comprobar que 
% en cada iteracion del metodo de maximo descenso
% este valor disminuye
disp(['iteracion 0'])
(norm(A*x0-b))^2

% mostrando aproximacion inicial como un asterisco negro
plot(x0(1),x0(2),'k*')

% las aproximaciones sucesivas del metodo de maximo descenso
% se mostraran con los siguientes colores
colors = {'bs','gs','bo','go','bd','gd'};

% solo realizaremos 6 iteaciones del metodo de maximo descenso
% si quieren hacer mas de 6 iteraciones deben completar los
% colores con que se mostraran en colors
for i = 1 : 6
    % un paso de metodo de maximo descenso
    % Ejercicio 2: calcular nuevo valor de x0 segun metodo de maximo
    % descenso
    % Ejercicio 3: Mostrar en la figura 2:
    % 3.1. direccion de descenso (-gradiente de f en x0) desde x0
    % para mostrar esto basta hacer 
    % quiver(x0(1),x0(2),direccion(1),direccion(2))
    % 3.2. nueva aproximacion x0
    % para hacer esto basta hacer plot(x0(1),x0(2),colors{i})
    display(['iteracion: ',num2str(i)]);
    (norm(A*x0-b))^2
end
