function [adjustedCentroids,assignedClasses] = kMeansCentroidsAdjust(data)
  % Excluir a la columna que contiene a la clase
  % Se evalúan las clases
  % 1. Age: The age of the individual (18-90 years).
  % 3. BMI (Body Mass Index): A measure of body fat based on height and weight (kg/m²).
  % 4. Glucose: Blood glucose concentration (mg/dL), a key diabetes indicator.
  % 10. WaistCircumference: Waist measurement (cm), an indicator of central obesity.
  % 11. HipCircumference: Hip measurement (cm), used to calculate WHR.
  % 13. FamilyHistory: Indicates if the individual has a family history of diabetes (1 = Yes, 0 = No).
  % 14. DietType: Dietary habits (0 = Unbalanced, 1 = Balanced, 2 = Vegan/Vegetarian).
  % 15. Hypertension: Presence of high blood pressure (1 = Yes, 0 = No).
  features = data(:, [1, 3, 4, 10, 11, 13, 14, 15]);
  %Obtener tamaños de la matriz features
  [filas,columnas] = size(features);
  % Crear la matriz de los centroides (pre para antes de reajustar)
  % Agrear a la matriz pre con los valores entre 0 y 1
  centroids = 2;
  AdjustCentroids = rand(centroids,columnas);
  adjustedCentroids = zeros(centroids,columnas);
  % Crear la matriz de la asignación de los centroides para antes (pre)
  preAssignament = zeros(filas,1);
  postAssignament = zeros(filas,1);
  % Repetir ajuste de centroides mientras pre y post sean diferentes
  while any(preAssignament != postAssignament);
    preAssignament = postAssignament;
    % Calcular distancia entre el cluster y cada punto
    % Para cada fila
    for i=1:filas
      % Se crea una matriz distancia
      distance = zeros(centroids, 1);
      for j=1:centroids
        % Que guarda la diferencia entre la fila i y el centroide j
        distance(j) = norm(features(i,:)-adjustedCentroids(j,:));
      endfor
      % Guardando el id de la distancia minima
      [~,postAssignament(i)] = min(distance);
    endfor

    % Los centroides se reajustan.
    % Se crea una matriz para guardar las nuevas posiciones
    postAdjustCentroids = zeros(centroids,columnas);
    % Para cada centroide
    for i=1:centroids
      % Obtener los datos asigandos a ese cluster
      clusterPoints=data(postAssignament == i,:);
      % Si el cluster tiene puntos asignados
      if size(clusterPoints,1) > 0
        postAdjustCentroids(i,:) = mean(clusterPoints,1);
      else
        % Mantener el centroide en su lugar si no tiene puntos asignados
        postAdjustCentroids(i,:) = adjustedCentroids(i,:);
      endif
    endfor
    adjustedCentroids = postAdjustCentroids;
    return adjustedCentroids
  endwhile
  assignedClasses = postAssignament;
  return assignedClasses
endfunction
