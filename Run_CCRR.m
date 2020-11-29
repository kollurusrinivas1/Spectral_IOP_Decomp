%% If measured absorption subcomponents are available in addition to measured 
% total non-water absorption coefficient (a_nw)
clear variables
% add rtaormina-MATLAB_ExtraTrees-438b121 and all subfolders to the path
% Inputs are a_nw at six wavelengths of 412, 443, 490, 510, 555, 665 nm
% Outputs is absorption due to phytoplankton - a_ph, colored detrital matter - a_dg, 
% detrital matter - a_detri, colored dissolved organic matter or gelbstoff
% - agelb at six wavelengths.

% load ERT and EBG models
load_models
% load CCRR data
load('CCRR_all_new2.mat');
% Input anw data at six wavelengths of 412, 443, 490, 510, 555, 665 nm
orig_anw = anw_CCRR_Florida_temp; 

% if scatter plots of measured vs ML-derived absorption subcomponents are required
% assign the respective flags to 1
plot_flag.aph = 1;
plot_flag.adg = 1;
plot_flag.detri = 1;
plot_flag.gelb = 1;

%if measured absorption subcomponents are available in addition to 
% measured absorption data, change the respective flag to 1.
orig_aph = aph_CCRR_Florida_temp;
orig_adg = adg_CCRR_Florida_temp;
orig_ad = ad_CCRR_Florida_temp;
orig_ag = ag_CCRR_Florida_temp;

orig_flag.aph = 1;
orig_flag.adg = 1;
orig_flag.adetri = 1;
orig_flag.agelb = 1;
Deriving_SIOP_Orig;
% The statistics for aph, adg, ad, ag from ERT and EBG models at various 
% wavelengths are present in variables ERT_stats_aph, EBG_stats_adg etc.

% The derived absorption subcomponents are assigned as ERT_aph, EBT_aph
% etc.
