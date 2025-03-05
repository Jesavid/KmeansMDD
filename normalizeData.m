function [normalizedDataSet] = normalizeData(data)
  [fila, columna] = size(data);
  normalizedDataSet = zeros(fila, columna);
  for i = 1:columna
    % Obtener todas las filas de la columna i
    col = data(:, i);

    % Obtener máximo y mínimo
    minCol = min(col);
    maxCol = max(col);

    % Normalizar los valores de la columna
    if maxCol == minCol
      normalizeCol = zeros(fila, 1);
    else
      normalizeCol = (col - minCol) / (maxCol - minCol);
    endif

    % Guardar la normalización
    normalizedDataSet(:, i) = normalizeCol;
  endfor
endfunction
