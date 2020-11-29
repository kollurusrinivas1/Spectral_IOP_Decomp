function [stats_allmodels,stats_allmodels2,temp_all_aph] = allmodels_input2_aph_ErtEbg(models,data,subcomp,lambda_idx)


size_id = max(size(subcomp));
temp_all_aph = zeros(2,size_id);


% Regression Ensemble - Bagged
tic
temp_all_aph(1,:) = predict(models.rensemble_aph_model_bag.rensembleaph,data);
stats_rensemble_ds_aph412_bag_valente = stats_new(subcomp(:,lambda_idx),temp_all_aph(1,:)');
toc
fprintf('Regression Ensemble bagged model completed\n');

% Extremely Randomized Trees
temp_output = zeros(size_id,1);
tic
temp_all_aph(2,:) = predictWithAnEnsemble(models.ert_aph_model.ertaph,[data,temp_output],0);
stats_ert = stats_new(subcomp(:,lambda_idx),temp_all_aph(2,:)');
toc
fprintf('Extremely randomized trees model completed\n');


stats_allmodels.reg_ensem_bag = stats_rensemble_ds_aph412_bag_valente;
stats_allmodels.ert = stats_ert;

stats_allmodels2(1,:) = cell2mat(struct2cell(stats_rensemble_ds_aph412_bag_valente(1,:)));
stats_allmodels2(2,:) = cell2mat(struct2cell(stats_ert(1,:)));
