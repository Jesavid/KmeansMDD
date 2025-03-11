function visualizingData(data)
  % Crear matriz con los nombres de los atributos
  features={'Age';'Pregnancies';'BMI (Body Mass Index)';'Glucose';'BloodPressure';
  'HbA1c';'LDL';'HDL';'Triglycerides';'WaistCircumference';'HipCircumference';
  'WHR';'FamilyHistory';'DietType';'Hypertension';'MedicationUse'};
  [fila,columna]=size(data);
  % Crear una carpeta para guardar las imágenes si no existe
  output_folder = 'graficos';
    if ~exist(output_folder, 'dir')
      mkdir(output_folder);
    endif

  %Crearar una gráfica para comparar los atributos entre sí
  for i=1:columna-1
    for j=1:columna-1
      if i > j
         figure;
         plot(data(:,i), data(:,j),'r*','MarkerSize',6);
         xlabel(features{i});
         ylabel(features{j});
         title(sprintf('Comparison between %s and %s', features{i}, features{j}));
         % Crear el nombre del archivo basado en los atributos comparados
         filename = sprintf('%s/comparison_%s_vs_%s.png', output_folder, features{i}, features{j});

         % Guardar la figura en un archivo PNG
         print(filename, '-dpng');

         % Cerrar la figura para evitar consumir demasiada memoria
         close;
      endif
    endfor
  endfor
endfunction

function visualizingClassification(data, assignedClasses, adjustedCentroids)
  uniqueClasses = unique(assignedClasses);
  figure;
  colors = ['r', 'g', 'b', 'c', 'm', 'y', 'k'];
  hold on;

  for i = 1:length(uniqueClasses)
    classData = data(assignedClasses == uniqueClasses(i), :);
    plot(classData(:, 1), classData(:, 2), ['*', colors(mod(i-1, length(colors)) + 1)], 'MarkerSize', 6);
  end

  plot(adjustedCentroids(:, 1), adjustedCentroids(:, 2), 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');
  xlabel('Feature 1');
  ylabel('Feature 2');
  title('Data Classification with Centroids');
  legend(cellstr(num2str(uniqueClasses(:))), 'Location', 'best');
  hold off;
endfunction
