function visualizingClassification(data, assignedClasses, adjustedCentroids)
  % Nombres de los atributos evaluados según sus índices
  features = {'Age', 'BMI (Body Mass Index)', 'Glucose', 'WaistCircumference',
              'HipCircumference', 'FamilyHistory', 'DietType', 'Hypertension'};

  % Crear carpeta para guardar los gráficos si no existe
  output_folder = 'classificationResults';
  if ~exist(output_folder, 'dir')
    mkdir(output_folder);
  endif

  % Obtener la cantidad de atributos evaluados
  numFeatures = length(features);

  % Generar comparaciones entre cada par de atributos sin repetir
  for i = 1:numFeatures-1
    for j = i+1:numFeatures
      figure;
      hold on;
      grid on;

      % Dibujar los puntos de cada clase
      plot(data(assignedClasses == 0, i), data(assignedClasses == 0, j), 'g*', 'MarkerSize', 6); % Clase 0 (Verde)
      plot(data(assignedClasses == 1, i), data(assignedClasses == 1, j), 'r*', 'MarkerSize', 6); % Clase 1 (Rojo)

      % Dibujar los centroides en negro
      plot(adjustedCentroids(:, i), adjustedCentroids(:, j), 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');

      % Etiquetas y título
      xlabel(features{i});
      ylabel(features{j});
      title(sprintf('Classification: %s vs %s', features{i}, features{j}));

      % Guardar el gráfico en la carpeta
      filename = sprintf('%s/classification_%s_vs_%s.png', output_folder, features{i}, features{j});
      print(filename, '-dpng');

      % Cerrar la figura para liberar memoria
      close;
    endfor
  endfor
end

