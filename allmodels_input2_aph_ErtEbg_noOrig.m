function temp_all_aph = allmodels_input2_aph_ErtEbg_noOrig(models,data)


size_id = max(size(data));
temp_all_aph = zeros(2,size_id);


% Regression Ensemble - Bagged
tic
temp_all_aph(1,:) = predict(models.rensemble_aph_model_bag.rensembleaph,data);
toc
fprintf('Regression Ensemble bagged model completed\n');

% Extremely Randomized Trees
temp_output = zeros(size_id,1);
tic
temp_all_aph(2,:) = predictWithAnEnsemble(models.ert_aph_model.ertaph,[data,temp_output],0);
toc
fprintf('Extremely randomized trees model completed\n');

