function temp_all_agelb = allmodels_input2_agelb_ErtEbg_noOrig(models,data)

size_id = max(size(data));
temp_all_agelb = zeros(2,size_id);

% Regression Ensemble - Bagged
temp_all_agelb(1,:) = predict(models.rensemble_agelb_model_bag,data);
fprintf('Regression Ensemble bagged model completed\n');

% Extremely Randomized Trees
temp_output = zeros(size_id,1);
temp_all_agelb(2,:) = predictWithAnEnsemble(models.ert_agelb_model.ertagelb,[data,temp_output],0);
fprintf('Extremely randomized trees model completed\n');
