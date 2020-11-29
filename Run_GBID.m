%% If measured absorption subcomponents are available in addition to measured 
% total non-water absorption coefficient (a_nw)
clear variables
addpath('E:\rtaormina-MATLAB_ExtraTrees-438b121\rtaormina-MATLAB_ExtraTrees-438b121\Functions\Regression');
% add rtaormina-MATLAB_ExtraTrees-438b121 and all subfolders to the path
% Inputs are a_nw at six wavelengths of 412, 443, 490, 510, 555, 665 nm
% Outputs is absorption due to phytoplankton - a_ph, colored detrital matter - a_dg, 
% detrital matter - a_detri, colored dissolved organic matter or gelbstoff
% - agelb at six wavelengths.

% load ERT and EBG models
load_models
% load Valente or GBID
load('Valente_Rrs_aph_adg_new2_swifs6w.mat');
% Input anw data at six wavelengths of 412, 443, 490, 510, 555, 665 nm
orig_anw = anw_swifs6w_valente_new2; 

% if scatter plots of measured vs ML-derived absorption subcomponents are required
% assign the respective flags to 1
% In case of GBID, only a_ph and a_dg only are available. Hence, the
% respective flags are assiged to 0.
plot_flag.aph = 1;
plot_flag.adg = 1;
plot_flag.detri = 0;
plot_flag.gelb = 0;

%if measured absorption subcomponents are available in addition to 
% measured absorption data, change the respective flag to 1.
% In case of GBID, only a_ph and a_dg only are available. Hence, the
% respective flags are assiged to 0.
orig_flag.aph = 1;
orig_flag.adg = 1;
orig_flag.adetri = 0;
orig_flag.agelb = 0;

orig_aph = aph_swifs6w_valente_new2;
orig_adg = adg_swifs6w_valente_new2;
Deriving_SIOP_Orig;
% The statistics for aph, adg, ad, ag from ERT and EBG models at various 
% wavelengths are present in variables ERT_stats_aph, EBG_stats_adg etc.

% The derived absorption subcomponents are assigned as ERT_aph, EBT_aph
% etc.
