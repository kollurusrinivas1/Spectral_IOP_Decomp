addpath('E:\Paper_updates\ML_comparison\For_Cageo\New folder\rtaormina-MATLAB_ExtraTrees-438b121\rtaormina-MATLAB_ExtraTrees-438b121');
if orig_flag.aph == 1
[stats_allmodelsaph412,stats_allmodels2aph(:,:,1),ML_aph(:,:,1)] = allmodels_input2_aph_ErtEbg(models_aph412anwinp,orig_anw,orig_aph,1);
[stats_allmodelsaph443,stats_allmodels2aph(:,:,2),ML_aph(:,:,2)] = allmodels_input2_aph_ErtEbg(models_aph443anwinp,orig_anw,orig_aph,2);
[stats_allmodelsaph490,stats_allmodels2aph(:,:,3),ML_aph(:,:,3)] = allmodels_input2_aph_ErtEbg(models_aph490anwinp,orig_anw,orig_aph,3);
[stats_allmodelsaph510,stats_allmodels2aph(:,:,4),ML_aph(:,:,4)] = allmodels_input2_aph_ErtEbg(models_aph510anwinp,orig_anw,orig_aph,4);
[stats_allmodelsaph555,stats_allmodels2aph(:,:,5),ML_aph(:,:,5)] = allmodels_input2_aph_ErtEbg(models_aph555anwinp,orig_anw,orig_aph,5);
[stats_allmodelsaph670,stats_allmodels2aph(:,:,6),ML_aph(:,:,6)] = allmodels_input2_aph_ErtEbg(models_aph670anwinp,orig_anw,orig_aph,6);
EBG_aph = squeeze(ML_aph(1,:,:));
ERT_aph = squeeze(ML_aph(2,:,:));
h_stats = fieldnames(stats_allmodelsaph670.reg_ensem_bag);
EBG_stats_aph = table(h_stats,squeeze(stats_allmodels2aph(1,:,:)));
ERT_stats_aph = table(h_stats,squeeze(stats_allmodels2aph(2,:,:)));

if plot_flag.aph ==1
    figure
    plot_abs(squeeze(ML_aph(1,:,:)),orig_aph,'aph');
    plot_abs(squeeze(ML_aph(2,:,:)),orig_aph,'aph');
    for i=1:6;subplot(2,3,i);plot([0.0001 10],[0.0001 10],'-r');end
    legend('EBG','ERT','1:1 line');
end
end
%% adg
if orig_flag.adg == 1
[stats_allmodelsadg412,stats_allmodels2adg(:,:,1),ML_adg(:,:,1)] = allmodels_input2_adg_ErtEbg(models_adg412anwinp,orig_anw,orig_adg,1);
[stats_allmodelsadg443,stats_allmodels2adg(:,:,2),ML_adg(:,:,2)] = allmodels_input2_adg_ErtEbg(models_adg443anwinp,orig_anw,orig_adg,2);
[stats_allmodelsadg490,stats_allmodels2adg(:,:,3),ML_adg(:,:,3)] = allmodels_input2_adg_ErtEbg(models_adg490anwinp,orig_anw,orig_adg,3);
[stats_allmodelsadg510,stats_allmodels2adg(:,:,4),ML_adg(:,:,4)] = allmodels_input2_adg_ErtEbg(models_adg510anwinp,orig_anw,orig_adg,4);
[stats_allmodelsadg555,stats_allmodels2adg(:,:,5),ML_adg(:,:,5)] = allmodels_input2_adg_ErtEbg(models_adg555anwinp,orig_anw,orig_adg,5);
[stats_allmodelsadg670,stats_allmodels2adg(:,:,6),ML_adg(:,:,6)] = allmodels_input2_adg_ErtEbg(models_adg670anwinp,orig_anw,orig_adg,6);
EBG_adg = squeeze(ML_adg(1,:,:));
ERT_adg = squeeze(ML_adg(2,:,:));
EBG_stats_adg = table(h_stats,squeeze(stats_allmodels2adg(1,:,:)));
ERT_stats_adg = table(h_stats,squeeze(stats_allmodels2adg(2,:,:)));

if plot_flag.adg ==1
    figure
    plot_abs(squeeze(ML_adg(1,:,:)),orig_adg,'a_{dg}');
    plot_abs(squeeze(ML_adg(2,:,:)),orig_adg,'a_{dg}');
    for i=1:6;subplot(2,3,i);plot([0.0001 10],[0.0001 10],'-r');end
    legend('EBG','ERT','1:1 line');
end
end
%% detritus - adm
if orig_flag.adetri == 1
[stats_allmodelsadetri412,stats_allmodels2adetri(:,:,1),ML_adetri(:,:,1)] = allmodels_input2_adetri_ErtEbg(models_adetri412anwinp,orig_anw,orig_ad,1);
[stats_allmodelsadetri443,stats_allmodels2adetri(:,:,2),ML_adetri(:,:,2)] = allmodels_input2_adetri_ErtEbg(models_adetri443anwinp,orig_anw,orig_ad,2);
[stats_allmodelsadetri490,stats_allmodels2adetri(:,:,3),ML_adetri(:,:,3)] = allmodels_input2_adetri_ErtEbg(models_adetri490anwinp,orig_anw,orig_ad,3);
[stats_allmodelsadetri510,stats_allmodels2adetri(:,:,4),ML_adetri(:,:,4)] = allmodels_input2_adetri_ErtEbg(models_adetri510anwinp,orig_anw,orig_ad,4);
[stats_allmodelsadetri555,stats_allmodels2adetri(:,:,5),ML_adetri(:,:,5)] = allmodels_input2_adetri_ErtEbg(models_adetri555anwinp,orig_anw,orig_ad,5);
[stats_allmodelsadetri670,stats_allmodels2adetri(:,:,6),ML_adetri(:,:,6)] = allmodels_input2_adetri_ErtEbg(models_adetri670anwinp,orig_anw,orig_ad,6);
EBG_ad = squeeze(ML_adetri(1,:,:));
ERT_ad = squeeze(ML_adetri(2,:,:));
EBG_stats_adm = table(h_stats,squeeze(stats_allmodels2adetri(1,:,:)));
ERT_stats_adm = table(h_stats,squeeze(stats_allmodels2adetri(2,:,:)));

if plot_flag.detri == 1
    figure
    plot_abs(squeeze(ML_adetri(1,:,:)),orig_ad,'a_{d}');
    plot_abs(squeeze(ML_adetri(2,:,:)),orig_ad,'a_{d}');
    for i=1:6;subplot(2,3,i);plot([0.0001 10],[0.0001 10],'-r');end
    legend('EBG','ERT','1:1 line');
end
end
% gelbstoff-ag
if orig_flag.agelb == 1
[stats_allmodelsagelb412,stats_allmodels2agelb(:,:,1),ML_agelb(:,:,1)] = allmodels_input2_agelb_ErtEbg(models_agelb412anwinp,orig_anw,orig_ag,1);
[stats_allmodelsagelb443,stats_allmodels2agelb(:,:,2),ML_agelb(:,:,2)] = allmodels_input2_agelb_ErtEbg(models_agelb443anwinp,orig_anw,orig_ag,2);
[stats_allmodelsagelb490,stats_allmodels2agelb(:,:,3),ML_agelb(:,:,3)] = allmodels_input2_agelb_ErtEbg(models_agelb490anwinp,orig_anw,orig_ag,3);
[stats_allmodelsagelb510,stats_allmodels2agelb(:,:,4),ML_agelb(:,:,4)] = allmodels_input2_agelb_ErtEbg(models_agelb510anwinp,orig_anw,orig_ag,4);
[stats_allmodelsagelb555,stats_allmodels2agelb(:,:,5),ML_agelb(:,:,5)] = allmodels_input2_agelb_ErtEbg(models_agelb555anwinp,orig_anw,orig_ag,5);
[stats_allmodelsagelb670,stats_allmodels2agelb(:,:,6),ML_agelb(:,:,6)] = allmodels_input2_agelb_ErtEbg(models_agelb670anwinp,orig_anw,orig_ag,6);
EBG_ag = squeeze(ML_agelb(1,:,:));
ERT_ag = squeeze(ML_agelb(2,:,:));
EBG_stats_ag = table(h_stats,squeeze(stats_allmodels2agelb(1,:,:)));
ERT_stats_ag = table(h_stats,squeeze(stats_allmodels2agelb(2,:,:)));

if plot_flag.gelb == 1
    figure
    plot_abs(squeeze(ML_agelb(1,:,:)),orig_ag,'a_{g}');
    plot_abs(squeeze(ML_agelb(2,:,:)),orig_ag,'a_{g}');
    for i=1:6;subplot(2,3,i);plot([0.0001 10],[0.0001 10],'-r');end
    legend('EBG','ERT','1:1 line');
end
end