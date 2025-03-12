function visualizingDataClassification(data)
  % Crear matriz con los nombres de los atributos
  features = {'Age', 'Pregnancies', 'BMI (Body Mass Index)', 'Glucose', 'BloodPressure', ...
              'HbA1c', 'LDL', 'HDL', 'Triglycerides', 'WaistCircumference', 'HipCircumference', ...
              'WHR', 'FamilyHistory', 'DietType', 'Hypertension', 'MedicationUse'};

  % Definir la carpeta de salida
  output_folder = 'dataClassificaton';
  if ~exist(output_folder, 'dir')
    mkdir(output_folder);
  endif

  % Extraer las clases (última columna)
  classes = data(:, end); % Se asume que la última columna contiene la clasificación (0 o 1)

  % Obtener el tamaño de la matriz
  [fila, columna] = size(data);

  % Generar comparaciones entre cada par de atributos sin repetir
  for i = 1:columna-1
    for j = i+1:columna-1
      figure;
      hold on;
      grid on;

      % Filtrar y graficar los datos según su clase
      plot(data(classes == 0, i), data(classes == 0, j), 'r*', 'MarkerSize', 6); % Clase 0 (Rojo)
      plot(data(classes == 1, i), data(classes == 1, j), 'g*', 'MarkerSize', 6); % Clase 1 (Verde)

      % Etiquetas y título
      xlabel(features{i});
      ylabel(features{j});
      title(sprintf('Classification: %s vs %s', features{i}, features{j}));

      % Guardar la figura en la carpeta
      filename = sprintf('%s/classification_%s_vs_%s.png', output_folder, features{i}, features{j});
      print(filename, '-dpng');

      % Cerrar la figura para liberar memoria
      close;
    endfor
  endfor
end

