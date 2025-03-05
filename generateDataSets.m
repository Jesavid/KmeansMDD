function [train_data, test_data] = generateDataSets()
  dataset = csvread("diabetes_dataset.csv", 1, 0);
  [m,n] = size(dataset);
  idx = randperm(m);

  % Dividir 80% entrenamiento, 20% prueba
  train_size = round(0.8 * m);

  train_data = dataset(idx(1:train_size), :);
  test_data = dataset(idx(train_size+1:end), :);

  % Guardar los conjuntos en archivos nuevos (opcional)
  csvwrite("train_data.csv", train_data);
  csvwrite("test_data.csv", test_data);
endfunction
