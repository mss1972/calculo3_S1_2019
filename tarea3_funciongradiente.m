% Script para graficar funcion de R2 en R y su gradiente
% en distintos puntos de su dominio

x = -2:.1:2;
y = -2:.1:2;
[X,Y] = meshgrid(x,y);
Z = X.*exp(-X.^2-Y.^2);
surf(X,Y,Z);

% Grafico de funcion
figure()
hold on
contour(X,Y,Z,25)

% funcion matlab para determinar gradiente de f en puntos de su dominio
[u,v] = gradient(Z);

% observar que el gradiente es perpendicular a curvas de nivel.
% El valor de f(x) es constante cuando x pertenece a una curva de nivel de
% f, tiene que ocurrir entonces que la derivada direccional de 
% f a lo largo de una curva de nivel sea 0.
% Esto debido a que la derivada direccional 
% de una funcion a lo largo de una curva mide la razon de cambio
% de la funcion a lo largo de esa curva y a lo largo de una curva 
% de nivel f no cambia.
% Dado que la derivada direccional es el producto interior entre el
% gradiente y el vector direccion, que esta sea cero significa que el
% gradiente es ortogonal al vector tangente a la curva de nivel
quiver(x,y,5*u,5*v);

