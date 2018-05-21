

function ejemploOctave()
  A = [ 1 1 1; 2 2 2];
  %submatriz
  U = A(1:2, 1:2);
  S = A(1:end, 2:end);
  %seleccionar vector columna 1
  columna = A(:, 1);
  
  %transpuesta
  tA = A';
  
  B = [3 3 3; 4 4 4];
  
  %Multiplicacion de matrices
  N = A * B';
  
  C = [A B]
  
  %matriz logical
  Q = logical([1 0 0; 0 0 1]);

  
  M1s = A == 1
  
  A(M1s) = 50;
  A(A==50) = 2;
  A(Q) = 5;
  
  D = A + B;
  
  v = D(:)
  suma = sum(v);
  media = mean(v);
  minimo = min([-5 v'])
  maximo = max(500, v)
  desvEstandar = std(v);
  tamanio = size(A)
  %crear un arreglo de 1 a 6, de 0.1 en 0.1
  x = 1:0.1:6;
  y = 2 * x;
  %graficar el arreglo
  figure; 
  plot(x, y);
  
  %replicar matriz
  v = 1:3:9;
  M = repmat(v, [4 1])
  

end