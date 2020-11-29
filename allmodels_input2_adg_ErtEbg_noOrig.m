function temp_all_adg = allmodels_input2_adg_ErtEbg_noOrig(models,data)

size_id = max(size(data));
temp_all_adg = zeros(2,size_id);

% Regression Ensemble - Bagged
temp_all_adg(1,:) = predict(models.rensemble_adg_model_bag,data);
fprintf('Regression Ensemble bagged model completed\n');

% Extremely Randomized Trees
temp_output = zeros(size_id,1);
temp_all_adg(2,:) = predictWithAnEnsemble(models.ert_adg_model.ertadg,[data,temp_output],0);
fprintf('Extremely randomized trees model completed\n');

