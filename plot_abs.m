
function plot_abs(data,estimate,title_str)
wl = {'412 nm','443 nm','490 nm','510 nm','555 nm','665 nm'};
for i=1:6
   subplot(2,3,i); 
    scatter(estimate(:,i),data(:,i));hold on
    set(gca,'xscale','log');
    set(gca,'yscale','log');
    title(strcat(title_str,'(',wl(i),')'));
    ylabel('ML-derived');
    xlabel('Measured');
    box on
    xlim([0.001 10]);
    ylim([0.001 10]);
%     plot([0.0001 10],[0.0001 10],'-r');
end