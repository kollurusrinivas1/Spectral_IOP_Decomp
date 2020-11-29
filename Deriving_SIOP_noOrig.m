addpath('E:\Paper_updates\ML_comparison\For_Cageo\New folder\rtaormina-MATLAB_ExtraTrees-438b121\rtaormina-MATLAB_ExtraTrees-438b121');

%% aph
ML_aph(:,:,1) = allmodels_input2_aph_ErtEbg_noOrig(models_aph412anwinp,orig_anw);
ML_aph(:,:,2) = allmodels_input2_aph_ErtEbg_noOrig(models_aph443anwinp,orig_anw);
ML_aph(:,:,3) = allmodels_input2_aph_ErtEbg_noOrig(models_aph490anwinp,orig_anw);
ML_aph(:,:,4) = allmodels_input2_aph_ErtEbg_noOrig(models_aph510anwinp,orig_anw);
ML_aph(:,:,5) = allmodels_input2_aph_ErtEbg_noOrig(models_aph555anwinp,orig_anw);
ML_aph(:,:,6) = allmodels_input2_aph_ErtEbg_noOrig(models_aph670anwinp,orig_anw);

EBG_aph = squeeze(ML_aph(1,:,:));
ERT_aph = squeeze(ML_aph(2,:,:));
%% adg
ML_adg(:,:,1) = allmodels_input2_adg_ErtEbg_noOrig(models_adg412anwinp,orig_anw);
ML_adg(:,:,2) = allmodels_input2_adg_ErtEbg_noOrig(models_adg443anwinp,orig_anw);
ML_adg(:,:,3) = allmodels_input2_adg_ErtEbg_noOrig(models_adg490anwinp,orig_anw);
ML_adg(:,:,4) = allmodels_input2_adg_ErtEbg_noOrig(models_adg510anwinp,orig_anw);
ML_adg(:,:,5) = allmodels_input2_adg_ErtEbg_noOrig(models_adg555anwinp,orig_anw);
ML_adg(:,:,6) = allmodels_input2_adg_ErtEbg_noOrig(models_adg670anwinp,orig_anw);

EBG_adg = squeeze(ML_adg(1,:,:));
ERT_adg = squeeze(ML_adg(2,:,:));

%% detritus - adm
ML_adetri(:,:,1) = allmodels_input2_adetri_ErtEbg_noOrig(models_adetri412anwinp,orig_anw);
ML_adetri(:,:,2) = allmodels_input2_adetri_ErtEbg_noOrig(models_adetri443anwinp,orig_anw);
ML_adetri(:,:,3) = allmodels_input2_adetri_ErtEbg_noOrig(models_adetri490anwinp,orig_anw);
ML_adetri(:,:,4) = allmodels_input2_adetri_ErtEbg_noOrig(models_adetri510anwinp,orig_anw);
ML_adetri(:,:,5) = allmodels_input2_adetri_ErtEbg_noOrig(models_adetri555anwinp,orig_anw);
ML_adetri(:,:,6) = allmodels_input2_adetri_ErtEbg_noOrig(models_adetri670anwinp,orig_anw);

EBG_ad = squeeze(ML_adetri(1,:,:));
ERT_ad = squeeze(ML_adetri(2,:,:));

%% gelbstoff-ag
ML_agelb(:,:,1) = allmodels_input2_agelb_ErtEbg_noOrig(models_agelb412anwinp,orig_anw);
ML_agelb(:,:,2) = allmodels_input2_agelb_ErtEbg_noOrig(models_agelb443anwinp,orig_anw);
ML_agelb(:,:,3) = allmodels_input2_agelb_ErtEbg_noOrig(models_agelb490anwinp,orig_anw);
ML_agelb(:,:,4) = allmodels_input2_agelb_ErtEbg_noOrig(models_agelb510anwinp,orig_anw);
ML_agelb(:,:,5) = allmodels_input2_agelb_ErtEbg_noOrig(models_agelb555anwinp,orig_anw);
ML_agelb(:,:,6) = allmodels_input2_agelb_ErtEbg_noOrig(models_agelb670anwinp,orig_anw);

EBG_ag = squeeze(ML_agelb(1,:,:));
ERT_ag = squeeze(ML_agelb(2,:,:));