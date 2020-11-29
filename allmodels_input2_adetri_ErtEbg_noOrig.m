function temp_all_adetri = allmodels_input2_adetri_ErtEbg_noOrig(models,data)

size_id = max(size(data));
temp_all_adetri = zeros(2,size_id);

% Regression Ensemble - Bagged
temp_all_adetri(1,:) = predict(models.rensemble_adetri_model_bag,data);
fprintf('Regression Ensemble bagged model completed\n');

% Extremely Randomized Trees
temp_output = zeros(size_id,1);
temp_all_adetri(2,:) = predictWithAnEnsemble(models.ert_adetri_model.ertadetri,[data,temp_output],0);
fprintf('Extremely randomized trees model completed\n');

