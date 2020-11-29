function restats=stats_new(data,estimate)
% Function to calculate root mean square error from a data vector or matrix
% and the corresponding estimates.
% Usage: r=rmse(data,estimate)
% Note: data and estimates have to be of same size
% Example: r=rmse(randn(100,100),randn(100,100));

% delete records with NaNs in both datasets first
I = ~isnan(data) & ~isnan(estimate);
I2 = find(data>0 & estimate>0);
size(I2)
if max(size(I2)) == 1
    data = [1,1];
    estimate = [1,1];
    flag = 0;
else
    flag = 1;
end


data = data(I2); estimate = estimate(I2);
N = max(size(estimate));
rmse=sqrt(sum((data(:)-estimate(:)).^2)/numel(data));
numerator=((sum(estimate(:)-data(:)))/numel(data));
stdev = sqrt(sum((data(:)-estimate(:)).^2)/(numel(data)-1));
for i=1:numel(data)
    numerator1(i)=abs(data(i)-estimate(i));
    num_mape(i)=abs((data(i)-estimate(i))/(data(i)));
end
numerator2=sum(numerator1)/numel(data);
deno=mean(data(:));
pre=100*(numerator/deno);
pmae=100*(numerator2/deno);
prmse=100*(rmse/deno);
mape=100*(1/numel(data))*sum(num_mape);
bias = numerator;
MAE = numerator2;


sigma_data = std(data);
sigma_estimate = std(estimate);
mean_data = mean(data);
mean_estimate = mean(estimate);

norm_bias = bias/sigma_data;
norm_rmse = rmse/sigma_data;
norm_std = sigma_estimate/sigma_data;
cc = corrcoef(estimate,data);
ccoef = cc(1,2);

norm_unbias_rmse = (norm_rmse^2 - norm_bias^2)^0.5;
[slope,yint,ccreg,stdev_slo,stdev_yint]=lsqfitma(data,estimate);

std_err_mean = std(estimate)/sqrt(N);
%CI95_temp = tinv([0.025 0.975], N-1);
% CI95 = bsxfun(@times,std_err_mean,CI95_temp(:));
CI95 = tinv(.975,N-1)*(std_err_mean);

% for calculation of 95% RMSE
rmse_tp = power((estimate - data).^2,0.5);
SEM_rmse = std(rmse_tp)/sqrt(N); % standard error of mean
% CI95_rmse = bsxfun(@times,SEM_rmse,CI95_temp(:));
CI95_rmse = tinv(.975,N-1)*(SEM_rmse);

% for calculation of 95% bias
bias_tp = estimate - data;
SEM_bias = std(bias_tp)/sqrt(N);
%CI95_bias = bsxfun(@times,SEM_bias,CI95_temp(:));
CI95_bias = tinv(.975,N-1)*(SEM_bias);

% for calculation of 95% cprmse - centre pattern root mean square error
cprmse_tp = power(((estimate - mean_estimate) - (data - mean_data)).^2,0.5);
SEM_cprmse = std(cprmse_tp)/sqrt(N);
% CI95_cprmse = bsxfun(@times,SEM_cprmse,CI95_temp(:));
CI95_cprmse = tinv(.975,N-1)*(SEM_cprmse);

%% statistics in log 10 scale
data_log10 = log10(data); estimate_log10 = log10(estimate);
sigma_data_log10 = std(data_log10,1);
sigma_estimate_log10 = std(estimate_log10,1);
mean_data_log10 = mean(data_log10);
mean_estimate_log10 = mean(estimate_log10);

rmse_log10=sqrt(sum((data_log10(:)-estimate_log10(:)).^2)/numel(data_log10));
numerator_log10=((sum(data_log10(:)-estimate_log10(:)))/numel(data_log10));
std_log10 = sqrt(sum((data_log10(:)-estimate_log10(:)).^2)/(numel(data_log10)-1));
for i=1:numel(data_log10)
    numerator1_log10(i)=abs(estimate_log10(i)-data_log10(i));
    num_mape_log10(i)=abs((data_log10(i)-estimate_log10(i))/(data_log10(i)));
end
numerator2_log10=sum(numerator1_log10)/numel(data_log10);
deno_log10=mean(data_log10(:));
pre_log10=100*(numerator_log10/deno_log10);
pmae_log10=100*(numerator2_log10/deno_log10);
prmse_log10=100*(rmse_log10/deno_log10);
mape_log10=100*(1/numel(data_log10))*sum(num_mape_log10);
bias_log10 = numerator_log10;
MAE_log10 = numerator2_log10;
norm_bias_log10 = bias_log10/sigma_data_log10;
norm_rmse_log10 = rmse_log10/sigma_data_log10;
norm_std_log10 = sigma_estimate_log10/sigma_data_log10;
cc_log10 = corrcoef(estimate_log10,data_log10);
ccoef_log10 = cc_log10(1,2);
norm_unbias_rmse_log10 = (norm_rmse_log10^2 - norm_bias_log10^2)^0.5;
[slope_log10,yint_log10,ccreg_log10,stdev_slo_log10,stdev_yint_log10]=lsqfitma(data_log10,estimate_log10);

std_err_mean_log10 = std(estimate_log10)/sqrt(N);
%CI95_temp_log10 = tinv([0.025 0.0975], N-1);
%CI95_log10 = bsxfun(@times,std_err_mean_log10,CI95_temp_log10(:));
CI95_log10 = tinv(.975,N-1)*(std_err_mean_log10);

% for calculation of 95% RMSE
rmse_tp_log10 = power((estimate_log10 - data_log10).^2,0.5);
SEM_rmse_log10 = std(rmse_tp_log10)/sqrt(N); % standard error of mean
%CI95_rmse_log10 = bsxfun(@times,SEM_rmse_log10,CI95_temp_log10(:));
CI95_rmse_log10 = tinv(.975,N-1)*(SEM_rmse_log10);

% for calculation of 95% bias
bias_tp_log10 = estimate_log10 - data_log10;
SEM_bias_log10 = std(bias_tp_log10)/sqrt(N);
%CI95_bias_log10 = bsxfun(@times,SEM_bias_log10,CI95_temp_log10(:));
CI95_bias_log10 = tinv(.975,N-1)*(SEM_bias_log10);

% for calculation of 95% cprmse - centre pattern root mean square error
cprmse_tp_log10 = power(((estimate_log10 - mean_estimate_log10) - (data_log10 - mean_data_log10)).^2,0.5);
SEM_cprmse_log10 = std(cprmse_tp_log10)/sqrt(N);
%CI95_cprmse_log10 = bsxfun(@times,SEM_cprmse_log10,CI95_temp_log10(:));
CI95_cprmse_log10 = tinv(.975,N-1)*(SEM_cprmse_log10);

%% statistics in natural log e scale
data_loge = log(data); estimate_loge = log(estimate);
sigma_data_loge = std(data_loge,1);
sigma_estimate_loge = std(estimate_loge,1);
mean_data_loge = mean(data_loge);
mean_estimate_loge = mean(estimate_loge);

rmse_log=sqrt(sum((data_loge(:)-estimate_loge(:)).^2)/numel(data_loge));
numerator_log=((sum(estimate_loge(:)-data_loge(:)))/numel(data_loge));
std_log = sqrt(sum((data_loge(:)-estimate_loge(:)).^2)/(numel(data_loge)-1));
for i=1:numel(data_loge)
    numerator1_log(i)=abs(data_loge(i)-estimate_loge(i));
    num_mape_log(i)=abs((data_loge(i)-estimate_loge(i))/(data_loge(i)));
end
numerator2_log=sum(numerator1_log)/numel(data_loge);
deno_log=mean(data_loge(:));
pre_log=100*(numerator_log/deno_log);
pmae_log=100*(numerator2_log/deno_log);
prmse_log=100*(rmse_log/deno_log);
mape_log=100*(1/numel(data_loge))*sum(num_mape_log);
bias_log = numerator_log;
MAE_log = numerator2_log;
norm_bias_loge = bias_log/sigma_data_loge;
norm_rmse_loge = rmse_log/sigma_data_loge;
norm_std_loge = sigma_estimate_loge/sigma_data_loge;
cc_loge = corrcoef(estimate_loge,data_loge);
ccoef_loge = cc_loge(1,2);
norm_unbias_rmse_loge = (norm_rmse_loge^2 - norm_bias_loge^2)^0.5;
[slope_loge,yint_loge,ccreg_loge,stdev_slo_loge,stdev_yint_loge]=lsqfitma(data_loge,estimate_loge);

std_err_mean_loge = std(estimate_loge)/sqrt(N);
%CI95_temp_loge = tinv([0.025 0.0975], N-1);
%CI95_loge = bsxfun(@times,std_err_mean_loge,CI95_temp_loge(:));
CI95_loge = tinv(.975,N-1)*(std_err_mean_loge);


% for calculation of 95% RMSE
rmse_tp_loge = power((estimate_loge - data_loge).^2,0.5);
SEM_rmse_loge = std(rmse_tp_loge)/sqrt(N); % standard error of mean
%CI95_rmse_loge = bsxfun(@times,SEM_rmse_loge,CI95_temp_loge(:));
CI95_rmse_loge = tinv(.975,N-1)*(SEM_rmse_loge);

% for calculation of 95% bias
bias_tp_loge = estimate_loge - data_loge;
SEM_bias_loge = std(bias_tp_loge)/sqrt(N);
%CI95_bias_loge = bsxfun(@times,SEM_bias_loge,CI95_temp_loge(:));
CI95_bias_loge = tinv(.975,N-1)*(SEM_bias_loge);

% for calculation of 95% cprmse - centre pattern root mean square error
cprmse_tp_loge = power(((estimate_loge - mean_estimate_loge) - (data_loge - mean_data_loge)).^2,0.5);
SEM_cprmse_loge = std(cprmse_tp_loge)/sqrt(N);
%CI95_cprmse_loge = bsxfun(@times,SEM_cprmse_loge,CI95_temp_loge(:));
CI95_cprmse_loge = tinv(.975,N-1)*(SEM_cprmse_loge);


% to output
restats.pre=pre;
restats.pmae=pmae;
restats.prmse=prmse;
restats.N=N;
restats.rmse=rmse;
if flag == 0
    restats.mape=1000;
else
    restats.mape=mape;
end
restats.std=stdev;
restats.bias = bias;
restats.MAE = MAE;
restats.bias_norm = norm_bias;
restats.rmse_norm = norm_rmse;
restats.corrcoef = ccoef;
restats.norm_std = norm_std;
restats.norm_unbias_rmse = norm_unbias_rmse;
restats.slope = slope;
restats.yint = yint;
restats.ccreg = ccreg;
restats.stdev_slo = stdev_slo;
restats.stdev_yint = stdev_yint;
restats.std_err_mean = std_err_mean;
restats.SEM_rmse = SEM_rmse;
restats.SEM_bias = SEM_bias;
restats.SEM_cprmse = SEM_cprmse;
restats.CI95 = CI95;
restats.CI95_rmse = CI95_rmse;
restats.CI95_bias = CI95_bias;
restats.CI95_cprmse = CI95_cprmse;


restats.pre_log10=pre_log10;
restats.pmae_log10=pmae_log10;
restats.prmse_log10=prmse_log10;
restats.N_log10=N;
restats.rmse_log10=rmse_log10;
restats.mape_log10=mape_log10;
restats.std_log10=std_log10;
restats.bias_log10 = bias_log10;
restats.MAE_log10 = MAE_log10;
restats.bias_norm_log10 = norm_bias_log10;
restats.rmse_norm_log10 = norm_rmse_log10;
restats.corrcoef_log10 = ccoef_log10;
restats.norm_std_log10 = norm_std_log10;
restats.norm_unbias_rmse_log10 = norm_unbias_rmse_log10;
restats.slope_log10 = slope_log10;
restats.yint_log10 = yint_log10;
restats.ccreg_log10 = ccreg_log10;
restats.stdev_slo_log10 = stdev_slo_log10;
restats.stdev_yint_log10 = stdev_yint_log10;
restats.std_err_mean_log10 = std_err_mean_log10;
restats.SEM_rmse_log10 = SEM_rmse_log10;
restats.SEM_bias_log10 = SEM_bias_log10;
restats.SEM_cprmse_log10 = SEM_cprmse_log10;
restats.CI95_log10 = CI95_log10;
restats.CI95_rmse_log10 = CI95_rmse_log10;
restats.CI95_bias_log10 = CI95_bias_log10;
restats.CI95_cprmse_log10 = CI95_cprmse_log10;

restats.pre_log=pre_log;
restats.pmae_log=pmae_log;
restats.prmse_log=prmse_log;
restats.N_loge=N;
restats.rmse_log=rmse_log;
restats.mape_log=mape_log;
restats.std_log=std_log;
restats.bias_log = bias_log;
restats.MAE_log = MAE_log;
restats.bias_norm_log = norm_bias_loge;
restats.rmse_norm_log = norm_rmse_loge;
restats.norm_std_log = norm_std_loge;
restats.corrcoef_loge = ccoef_loge;
restats.norm_unbias_rmse_loge = norm_unbias_rmse_loge;
restats.slope_loge = slope_loge;
restats.yint_loge = yint_loge;
restats.ccreg_loge = ccreg_loge;
restats.stdev_slo_loge = stdev_slo_loge;
restats.stdev_yint_loge = stdev_yint_loge;
restats.std_err_mean_loge = std_err_mean_loge;
restats.SEM_rmse_loge = SEM_rmse_loge;
restats.SEM_bias_loge = SEM_bias_loge;
restats.SEM_cprmse_loge = SEM_cprmse_loge;
restats.CI95_loge = CI95_loge;
restats.CI95_rmse_loge = CI95_rmse_loge;
restats.CI95_bias_loge = CI95_bias_loge;
restats.CI95_cprmse_loge = CI95_cprmse_loge;

end