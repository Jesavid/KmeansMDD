function [adjustedCentroids, assignedClasses] = kMeansCentroidsAdjust(data)
  % Excluir la columna de clase y seleccionar características relevantes
  features = data(:, [1, 3, 4, 10, 11, 13, 14, 15]);

  % Obtener tamaño de la matriz de características
  [filas, columnas] = size(features);

  % Número de centroides
  centroids = 2;

  % Inicialización aleatoria de centroides
  adjustedCentroids = rand(centroids, columnas);

  % Inicialización de asignaciones de clusters
  preAssignament = zeros(filas, 1);
  postAssignament = zeros(filas, 1);

  % Iterar hasta que las asignaciones no cambien
  while any(preAssignament ~= postAssignament)
    preAssignament = postAssignament;

    % Asignar cada punto al centroide más cercano
    for i = 1:filas
      distances = zeros(centroids, 1);
      for j = 1:centroids
        distances(j) = norm(features(i, :) - adjustedCentroids(j, :));
      end
      [~, postAssignament(i)] = min(distances);
    end

    % Recalcular centroides
    postAdjustCentroids = zeros(centroids, columnas);
    for i = 1:centroids
      clusterPoints = features(postAssignament == i, :);
      if size(clusterPoints, 1) > 0
        postAdjustCentroids(i, :) = mean(clusterPoints, 1);
      else
        % Mantener el centroide si no tiene puntos asignados
        postAdjustCentroids(i, :) = adjustedCentroids(i, :);
      end
    end

    adjustedCentroids = postAdjustCentroids;
  end

  assignedClasses = postAssignament;
end

