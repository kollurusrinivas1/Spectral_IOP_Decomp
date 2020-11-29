# Spectral_IOP_Decomp
Deriving spectral absorption coefficients of phytoplankton, CDOM and detrital matter from total spectral non-water absorption coefficient using Extremely Randomized Trees and Ensemble Bagged model. 

Before executing the code, Please add the folders and subfolders in the folder "rtaormina-MATLAB_ExtraTrees-438b121".

The two publicly available datasets used are Global bio-optical Insitu Dataset (GBID) and Coast Color Round Robin dataset (CCRR). Following are the references for the datasets.

Valente, A., Sathyendranath, S., Brotas, V., Groom, S., Grant, M., Taberner, M., Antoine, D., Arnone Prof, R.A., Balch, W.M., Baker, K. and Barlow, R., 2016. A compilation of global bio-optical in situ data for ocean-colour satellite applications. Earth System Science Data, 8(1), p.235.

Nechad, B., Ruddick, K.G., Schroeder, T.A., Oubelkheir, K., Blondeau-Patissier, D., Cherukuru, N.R., Brando, V.E., Dekker, A.G., Clementson, L.A., Banks, A.C. and Maritorena, S., 2015. CoastColour Round Robin data sets: a database to evaluate the performance of algorithms for the retrieval of water quality parameters in coastal waters

This respository consists of three main codes.
1. "Run_CCRR.m". Execute this code to derive the absorption subcomponents from a_nw(wl) of CCRR dataset. 
2. "Run_GBID.m". Execute this code to derive the absorption subcomponents from a_nw(wl) of GBID dataset. 
3. "Run_CCRR_noOrig.m". Execute this code if measured absorption subcomponents are not avaialbe. 

