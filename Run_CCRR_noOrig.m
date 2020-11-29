%% if measured absorption subcomponents are not available
% Assign measured a_nw data at six wavelengths to orig_anw
clear variables
% load ERT and EBG models
load_models
% load CCRR data
load('CCRR_all_new2.mat');
% Input anw data at six wavelengths of 412, 443, 490, 510, 555, 665 nm
orig_anw = anw_CCRR_Florida_temp; 
Deriving_SIOP_noOrig;
% The derived absorption subcomponents are assigned as ERT_aph, EBT_aph
% etc.