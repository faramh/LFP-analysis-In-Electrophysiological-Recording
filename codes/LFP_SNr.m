%% Monkey LFP analysis 
clc; clear; close all;

%load('complete_data_both.mat');
load('data_JP_final_tptf_12_18.mat');

%% Define Tags and parameters for Data set
TP=4;
TA=3;
Displaysize = [3 5 7 9];
correct=1;
Incorrect=0;
SaccTypeGood = 2;
SaccTypeBad = 3;
SaccTypeRej = 0;
SaccTypeBadRej = 1;



Fs = 1000; % in Hz
% 
% data([584:767 1537 1923:2114 2355:2594 2821 4113 5701:5781 7049:7288 8105:8346 9348],:)=[];% for "Junior" data 
% data([2713:2953 4177 4674 5884 6795 7219 7343 7503 7986 8500 9508 10040 10054 10088 10123 10202 10471 10495 10513 10802 10809 13523 13571 14208 14584 14837 15610],:)=[];% for "Peunut" data 



%% baseline normalize data of all sessions
clc;
% 
unique_sessions = unique(data.Session_Name);
% n_data = size(data,1);
% 
% t_baseline = 0.5;
% for idata = 1:n_data
%     disp("Normalizing data " + idata)
%     selected_data = data.Data(idata);
%     data.Data(idata) = {baseline_normalization(selected_data{1,1},...
%         t_baseline, Fs)};
% end

% Z_scoring
% data_zscored = data;
% for i=1:length(unique_sessions)
%     session_trials = find(data.Session_Name==unique_sessions(i));
%     session_data = data.Data(session_trials);
%     session_data_mat = cell2mat(session_data');
%     session_data_zscored = zscore(session_data_mat);
%     session_data_cell = mat2cell(session_data_zscored,size(session_data_mat,1),ones(size(session_data_mat,2),1))';
%     data_zscored.Data(session_trials) = session_data_cell;
% end
% data = data_zscored;

%% Trial separation based on conditions
clc;
unique_sessions = unique(data.Session_Name);

TPtrials = find(data.TA_TP==4);
TAtrials = find(data.TA_TP==3);
% 
% Eff=find(data.TP_Slope<=20 & data.TP_Slope~=0);
% Ineff=find(data.TP_Slope>=35);
Eff = find(data.Search_Type=="p");
Ineff = find(data.Search_Type=="s");
AddIneff=find(data.TP_Slope>=35);
AddEff=find(floor(data.TP_Slope)==13);
Eff=union(Eff,AddEff);
Ineff=union(Ineff,AddIneff);

DspSize3 = find(data.Display_Size==3);
DspSize5 = find(data.Display_Size==5);
DspSize7 = find(data.Display_Size==7);
DspSize9 = find(data.Display_Size==9);


Correct=find(data.Accuracy==1);
InCorrect=find(data.Accuracy==0);

TPtrials_Dspsize3_EFF_tmp=intersect(intersect(DspSize3,TPtrials),Eff);
TAtrials_Dspsize3_EFF_tmp=intersect(intersect(DspSize3,TAtrials),Eff);

TPtrials_Dspsize3_InEFF_tmp=intersect(intersect(DspSize3,TPtrials),Ineff);
TAtrials_Dspsize3_InEFF_tmp=intersect(intersect(DspSize3,TAtrials),Ineff);

TPtrials_Dspsize5_EFF_tmp=intersect(intersect(DspSize5,TPtrials),Eff);
TAtrials_Dspsize5_EFF_tmp=intersect(intersect(DspSize5,TAtrials),Eff);

TPtrials_Dspsize5_InEFF_tmp=intersect(intersect(DspSize5,TPtrials),Ineff);
TAtrials_Dspsize5_InEFF_tmp=intersect(intersect(DspSize5,TAtrials),Ineff);

TPtrials_Dspsize7_EFF_tmp=intersect(intersect(DspSize7,TPtrials),Eff);
TAtrials_Dspsize7_EFF_tmp=intersect(intersect(DspSize7,TAtrials),Eff);

TPtrials_Dspsize7_InEFF_tmp=intersect(intersect(DspSize7,TPtrials),Ineff);
TAtrials_Dspsize7_InEFF_tmp=intersect(intersect(DspSize7,TAtrials),Ineff);

TPtrials_Dspsize9_EFF_tmp=intersect(intersect(DspSize9,TPtrials),Eff);
TAtrials_Dspsize9_EFF_tmp=intersect(intersect(DspSize9,TAtrials),Eff);

TPtrials_Dspsize9_InEFF_tmp=intersect(intersect(DspSize9,TPtrials),Ineff);
TAtrials_Dspsize9_InEFF_tmp=intersect(intersect(DspSize9,TAtrials),Ineff);


%DSP3
TPtrials_Dspsize3_EFF=data(TPtrials_Dspsize3_EFF_tmp,:);
TAtrials_Dspsize3_EFF=data(TAtrials_Dspsize3_EFF_tmp,:);

TPtrials_Dspsize3_InEFF=data(TPtrials_Dspsize3_InEFF_tmp,:);
TAtrials_Dspsize3_InEFF=data(TAtrials_Dspsize3_InEFF_tmp,:);
%DSP5
TPtrials_Dspsize5_EFF=data(TPtrials_Dspsize5_EFF_tmp,:);
TAtrials_Dspsize5_EFF=data(TAtrials_Dspsize5_EFF_tmp,:);

TPtrials_Dspsize5_InEFF=data(TPtrials_Dspsize5_InEFF_tmp,:);
TAtrials_Dspsize5_InEFF=data(TAtrials_Dspsize5_InEFF_tmp,:);
%DSP7
TPtrials_Dspsize7_EFF=data(TPtrials_Dspsize7_EFF_tmp,:);
TAtrials_Dspsize7_EFF=data(TAtrials_Dspsize7_EFF_tmp,:);

TPtrials_Dspsize7_InEFF=data(TPtrials_Dspsize7_InEFF_tmp,:);
TAtrials_Dspsize7_InEFF=data(TAtrials_Dspsize7_InEFF_tmp,:);
%DSP9
TPtrials_Dspsize9_EFF=data(TPtrials_Dspsize9_EFF_tmp,:);
TAtrials_Dspsize9_EFF=data(TAtrials_Dspsize9_EFF_tmp,:);

TPtrials_Dspsize9_InEFF=data(TPtrials_Dspsize9_InEFF_tmp,:);
TAtrials_Dspsize9_InEFF=data(TAtrials_Dspsize9_InEFF_tmp,:);


%% Target signal (TP-TA)

Eff_data=data(Eff,:);
Ineff_data=data(Ineff,:);
disp(size(unique(Eff_data.Session_Name)));
disp(size(unique(Ineff_data.Session_Name)));

Eff_sessionNames=unique(Eff_data.Session_Name);
InEff_sessionNames=unique(Ineff_data.Session_Name);
%% 

%DSP3
TPtrials_Dspsize3_EFF_data=cell2mat((TPtrials_Dspsize3_EFF.Data)');
TPtrials_Dspsize3_EFF_data(:, any(isnan(TPtrials_Dspsize3_EFF_data), 1)) = [];

TAtrials_Dspsize3_EFF_data=cell2mat((TAtrials_Dspsize3_EFF.Data)');
TAtrials_Dspsize3_EFF_data(:, any(isnan(TAtrials_Dspsize3_EFF_data), 1)) = [];

TPtrials_Dspsize3_InEFF_data=cell2mat((TPtrials_Dspsize3_InEFF.Data)');
TPtrials_Dspsize3_InEFF_data(:, any(isnan(TPtrials_Dspsize3_InEFF_data), 1)) = [];

TAtrials_Dspsize3_InEFF_data=cell2mat((TAtrials_Dspsize3_InEFF.Data)');
TAtrials_Dspsize3_InEFF_data(:, any(isnan(TAtrials_Dspsize3_InEFF_data), 1)) = [];

%DSP5
TPtrials_Dspsize5_EFF_data=cell2mat((TPtrials_Dspsize5_EFF.Data)');
TPtrials_Dspsize5_EFF_data(:, any(isnan(TPtrials_Dspsize5_EFF_data), 1)) = [];

TAtrials_Dspsize5_EFF_data=cell2mat((TAtrials_Dspsize5_EFF.Data)');
TAtrials_Dspsize5_EFF_data(:, any(isnan(TAtrials_Dspsize5_EFF_data), 1)) = [];

TPtrials_Dspsize5_InEFF_data=cell2mat((TPtrials_Dspsize5_InEFF.Data)');
TPtrials_Dspsize5_InEFF_data(:, any(isnan(TPtrials_Dspsize5_InEFF_data), 1)) = [];

TAtrials_Dspsize5_InEFF_data=cell2mat((TAtrials_Dspsize5_InEFF.Data)');
TAtrials_Dspsize5_InEFF_data(:, any(isnan(TAtrials_Dspsize5_InEFF_data), 1)) = [];

%DSP7
TPtrials_Dspsize7_EFF_data=cell2mat((TPtrials_Dspsize7_EFF.Data)');
TPtrials_Dspsize7_EFF_data(:, any(isnan(TPtrials_Dspsize7_EFF_data), 1)) = [];

TAtrials_Dspsize7_EFF_data=cell2mat((TAtrials_Dspsize7_EFF.Data)');
TAtrials_Dspsize7_EFF_data(:, any(isnan(TAtrials_Dspsize7_EFF_data), 1)) = [];


TPtrials_Dspsize7_InEFF_data=cell2mat((TPtrials_Dspsize7_InEFF.Data)');
TPtrials_Dspsize7_InEFF_data(:, any(isnan(TPtrials_Dspsize7_InEFF_data), 1)) = [];

TAtrials_Dspsize7_InEFF_data=cell2mat((TAtrials_Dspsize7_InEFF.Data)');
TAtrials_Dspsize7_InEFF_data(:, any(isnan(TAtrials_Dspsize7_InEFF_data), 1)) = [];

%DSP9
TPtrials_Dspsize9_EFF_data=cell2mat((TPtrials_Dspsize9_EFF.Data)');
TPtrials_Dspsize9_EFF_data(:, any(isnan(TPtrials_Dspsize9_EFF_data), 1)) = [];

TAtrials_Dspsize9_EFF_data=cell2mat((TAtrials_Dspsize9_EFF.Data)');
TAtrials_Dspsize9_EFF_data(:, any(isnan(TAtrials_Dspsize9_EFF_data), 1)) = [];

TPtrials_Dspsize9_InEFF_data=cell2mat((TPtrials_Dspsize9_InEFF.Data)');
TPtrials_Dspsize9_InEFF_data(:, any(isnan(TPtrials_Dspsize9_InEFF_data), 1)) = [];

TAtrials_Dspsize9_InEFF_data=cell2mat((TAtrials_Dspsize9_InEFF.Data)');
TAtrials_Dspsize9_InEFF_data(:, any(isnan(TAtrials_Dspsize9_InEFF_data), 1)) = [];


%% Wavelet transform

wname = 'amor';
t_baseline = 0.5;
time = -0.5:1/Fs:3-1/Fs;

%DSP3
[wt_TP_DSP3_EFF_avg, f_TP_DSP3_EFF_avg] = cal_cwt_1(TPtrials_Dspsize3_EFF_data', wname, Fs, 3, 'Meow');
wt_TP_DSP3_EFF_avg = baseline_normalization_mat(wt_TP_DSP3_EFF_avg, t_baseline, Fs);

[wt_TA_DSP3_EFF_avg, f_TA_DSP3_EFF_avg] = cal_cwt_1(TAtrials_Dspsize3_EFF_data', wname, Fs, 3, 'Meow');
wt_TA_DSP3_EFF_avg = baseline_normalization_mat(wt_TA_DSP3_EFF_avg, t_baseline, Fs);

[wt_TP_DSP3_InEFF_avg, f_TP_DSP3_InEFF_avg] = cal_cwt_1(TPtrials_Dspsize3_InEFF_data', wname, Fs, 3, 'Meow');
wt_TP_DSP3_InEFF_avg = baseline_normalization_mat(wt_TP_DSP3_InEFF_avg, t_baseline, Fs);

[wt_TA_DSP3_InEFF_avg, f_TA_DSP3_InEFF_avg] = cal_cwt_1(TAtrials_Dspsize3_InEFF_data', wname, Fs, 3, 'Meow');
wt_TA_DSP3_InEFF_avg = baseline_normalization_mat(wt_TA_DSP3_InEFF_avg, t_baseline, Fs);
 



%DSP5
[wt_TP_DSP5_EFF_avg, f_TP_DSP5_EFF_avg] = cal_cwt_1(TPtrials_Dspsize5_EFF_data', wname, Fs, 5, 'Meow');
wt_TP_DSP5_EFF_avg = baseline_normalization_mat(wt_TP_DSP5_EFF_avg, t_baseline, Fs);

[wt_TA_DSP5_EFF_avg, f_TA_DSP5_EFF_avg] = cal_cwt_1(TAtrials_Dspsize5_EFF_data', wname, Fs, 5, 'Meow');
wt_TA_DSP5_EFF_avg = baseline_normalization_mat(wt_TA_DSP5_EFF_avg, t_baseline, Fs);


[wt_TP_DSP5_InEFF_avg, f_TP_DSP5_InEFF_avg] = cal_cwt_1(TPtrials_Dspsize5_InEFF_data', wname, Fs, 5, 'Meow');
wt_TP_DSP5_InEFF_avg = baseline_normalization_mat(wt_TP_DSP5_InEFF_avg, t_baseline, Fs);

[wt_TA_DSP5_InEFF_avg, f_TA_DSP5_InEFF_avg] = cal_cwt_1(TAtrials_Dspsize5_InEFF_data', wname, Fs, 5, 'Meow');
wt_TA_DSP5_InEFF_avg = baseline_normalization_mat(wt_TA_DSP5_InEFF_avg, t_baseline, Fs);



%DSP7
[wt_TP_DSP7_EFF_avg, f_TP_DSP7_EFF_avg] = cal_cwt_1(TPtrials_Dspsize7_EFF_data', wname, Fs, 7, 'Meow');
wt_TP_DSP7_EFF_avg = baseline_normalization_mat(wt_TP_DSP7_EFF_avg, t_baseline, Fs);

[wt_TA_DSP7_EFF_avg, f_TA_DSP7_EFF_avg] = cal_cwt_1(TAtrials_Dspsize7_EFF_data', wname, Fs, 7, 'Meow');
wt_TA_DSP7_EFF_avg = baseline_normalization_mat(wt_TA_DSP7_EFF_avg, t_baseline, Fs);


[wt_TP_DSP7_InEFF_avg, f_TP_DSP7_InEFF_avg] = cal_cwt_1(TPtrials_Dspsize7_InEFF_data', wname, Fs, 7, 'Meow');
wt_TP_DSP7_InEFF_avg = baseline_normalization_mat(wt_TP_DSP7_InEFF_avg, t_baseline, Fs);

[wt_TA_DSP7_InEFF_avg, f_TA_DSP7_InEFF_avg] = cal_cwt_1(TAtrials_Dspsize7_InEFF_data', wname, Fs, 7, 'Meow');
wt_TA_DSP7_InEFF_avg = baseline_normalization_mat(wt_TA_DSP7_InEFF_avg, t_baseline, Fs);


%DSP9
[wt_TP_DSP9_EFF_avg, f_TP_DSP9_EFF_avg] = cal_cwt_1(TPtrials_Dspsize9_EFF_data', wname, Fs, 9, 'Meow');
wt_TP_DSP9_EFF_avg = baseline_normalization_mat(wt_TP_DSP9_EFF_avg, t_baseline, Fs);

[wt_TA_DSP9_EFF_avg, f_TA_DSP9_EFF_avg] = cal_cwt_1(TAtrials_Dspsize9_EFF_data', wname, Fs, 9, 'Meow');
wt_TA_DSP9_EFF_avg = baseline_normalization_mat(wt_TA_DSP9_EFF_avg, t_baseline, Fs);


[wt_TP_DSP9_InEFF_avg, f_TP_DSP9_InEFF_avg] = cal_cwt_1(TPtrials_Dspsize9_InEFF_data', wname, Fs, 9, 'Meow');
wt_TP_DSP9_InEFF_avg = baseline_normalization_mat(wt_TP_DSP9_InEFF_avg, t_baseline, Fs);

[wt_TA_DSP9_InEFF_avg, f_TA_DSP9_InEFF_avg] = cal_cwt_1(TAtrials_Dspsize9_InEFF_data', wname, Fs, 9, 'Meow');
wt_TA_DSP9_InEFF_avg = baseline_normalization_mat(wt_TA_DSP9_InEFF_avg, t_baseline, Fs);

%% Smooth matrices across time
% Assuming your matrix is named 'data' (89x3500 matrix)
windowSize=35;
wt_TP_DSP3_EFF_avg_smoothed = smoothdata(wt_TP_DSP3_EFF_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP3_EFF_avg_smoothed = smoothdata(wt_TA_DSP3_EFF_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_DSP3_InEFF_avg_smoothed = smoothdata(wt_TP_DSP3_InEFF_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP3_InEFF_avg_smoothed = smoothdata(wt_TA_DSP3_InEFF_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_DSP5_EFF_avg_smoothed = smoothdata(wt_TP_DSP5_EFF_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP5_EFF_avg_smoothed = smoothdata(wt_TA_DSP5_EFF_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_DSP5_InEFF_avg_smoothed = smoothdata(wt_TP_DSP5_InEFF_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP5_InEFF_avg_smoothed = smoothdata(wt_TA_DSP5_InEFF_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_DSP7_EFF_avg_smoothed = smoothdata(wt_TP_DSP7_EFF_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP7_EFF_avg_smoothed = smoothdata(wt_TA_DSP7_EFF_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_DSP7_InEFF_avg_smoothed = smoothdata(wt_TP_DSP7_InEFF_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP7_InEFF_avg_smoothed = smoothdata(wt_TA_DSP7_InEFF_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_DSP9_EFF_avg_smoothed = smoothdata(wt_TP_DSP9_EFF_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP9_EFF_avg_smoothed = smoothdata(wt_TA_DSP9_EFF_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_DSP9_InEFF_avg_smoothed = smoothdata(wt_TP_DSP9_InEFF_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP9_InEFF_avg_smoothed = smoothdata(wt_TA_DSP9_InEFF_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)





%% Plot LFPs in different conditions of Eff/Ineff and Dsp Sizes = [3,5,7,9]
fig = figure('units','normalized','outerposition',[0 0 1 1]);

subplot(4,4,5);

pcolor(time,f_TP_DSP3_EFF_avg,wt_TP_DSP3_EFF_avg);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Present - Display size 3 - Efficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);


subplot(4,4,13);

pcolor(time,f_TA_DSP3_EFF_avg,wt_TA_DSP3_EFF_avg);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Absent - Display size 3 - Efficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);
 
subplot(4,4,1);

pcolor(time,f_TP_DSP3_InEFF_avg,wt_TP_DSP3_InEFF_avg);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Present - Display size 3 - InEfficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);


subplot(4,4,9);

pcolor(time,f_TA_DSP3_InEFF_avg,wt_TA_DSP3_InEFF_avg);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Absent - Display size 3 - InEfficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);


subplot(4,4,6);

pcolor(time,f_TP_DSP5_EFF_avg,wt_TP_DSP5_EFF_avg);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Present - Display size 5 - Efficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);


subplot(4,4,14);

pcolor(time,f_TA_DSP5_EFF_avg,wt_TA_DSP5_EFF_avg);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Absent - Display size 5 - Efficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);
 
subplot(4,4,2);

pcolor(time,f_TP_DSP5_InEFF_avg,wt_TP_DSP5_InEFF_avg);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Present - Display size 5 - InEfficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);


subplot(4,4,10);

pcolor(time,f_TA_DSP5_InEFF_avg,wt_TA_DSP5_InEFF_avg);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Absent - Display size 5 - InEfficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);

subplot(4,4,7);

pcolor(time,f_TP_DSP7_EFF_avg,wt_TP_DSP7_EFF_avg);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Present - Display size 7 - Efficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);


subplot(4,4,15);

pcolor(time,f_TA_DSP7_EFF_avg,wt_TA_DSP7_EFF_avg);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Absent - Display size 7 - Efficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);
 
subplot(4,4,3);

pcolor(time,f_TP_DSP7_InEFF_avg,wt_TP_DSP7_InEFF_avg);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Present - Display size 7 - InEfficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);


subplot(4,4,11);

pcolor(time,f_TA_DSP7_InEFF_avg,wt_TA_DSP7_InEFF_avg);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Absent - Display size 7 - InEfficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);

subplot(4,4,8);

pcolor(time,f_TP_DSP9_EFF_avg,wt_TP_DSP9_EFF_avg);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Present - Display size 9 - Efficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);


subplot(4,4,16);

pcolor(time,f_TA_DSP9_EFF_avg,wt_TA_DSP9_EFF_avg);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Absent - Display size 9 - Efficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);
 
subplot(4,4,4);

pcolor(time,f_TP_DSP9_InEFF_avg,wt_TP_DSP9_InEFF_avg);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Present - Display size 9 - InEfficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);


subplot(4,4,12);

pcolor(time,f_TA_DSP9_InEFF_avg,wt_TA_DSP9_InEFF_avg);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Absent - Display size 9 - InEfficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);



%% Plot Smoothed LFPs in different conditions of Eff/Ineff and Dsp Sizes = [3,5,7,9]
fig = figure('units','normalized','outerposition',[0 0 1 1]);

subplot(4,4,5);

pcolor(time,f_TP_DSP3_EFF_avg,wt_TP_DSP3_EFF_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Present - Display size 3 - Efficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);


subplot(4,4,13);

pcolor(time,f_TA_DSP3_EFF_avg,wt_TA_DSP3_EFF_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Absent - Display size 3 - Efficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);
 
subplot(4,4,1);

pcolor(time,f_TP_DSP3_InEFF_avg,wt_TP_DSP3_InEFF_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Present - Display size 3 - InEfficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);


subplot(4,4,9);

pcolor(time,f_TA_DSP3_InEFF_avg,wt_TA_DSP3_InEFF_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Absent - Display size 3 - InEfficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);


subplot(4,4,6);

pcolor(time,f_TP_DSP5_EFF_avg,wt_TP_DSP5_EFF_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Present - Display size 5 - Efficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);


subplot(4,4,14);

pcolor(time,f_TA_DSP5_EFF_avg,wt_TA_DSP5_EFF_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Absent - Display size 5 - Efficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);
 
subplot(4,4,2);

pcolor(time,f_TP_DSP5_InEFF_avg,wt_TP_DSP5_InEFF_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Present - Display size 5 - InEfficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);


subplot(4,4,10);

pcolor(time,f_TA_DSP5_InEFF_avg,wt_TA_DSP5_InEFF_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Absent - Display size 5 - InEfficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);

subplot(4,4,7);

pcolor(time,f_TP_DSP7_EFF_avg,wt_TP_DSP7_EFF_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Present - Display size 7 - Efficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);


subplot(4,4,15);

pcolor(time,f_TA_DSP7_EFF_avg,wt_TA_DSP7_EFF_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Absent - Display size 7 - Efficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);
 
subplot(4,4,3);

pcolor(time,f_TP_DSP7_InEFF_avg,wt_TP_DSP7_InEFF_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Present - Display size 7 - InEfficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);


subplot(4,4,11);

pcolor(time,f_TA_DSP7_InEFF_avg,wt_TA_DSP7_InEFF_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Absent - Display size 7 - InEfficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);

subplot(4,4,8);

pcolor(time,f_TP_DSP9_EFF_avg,wt_TP_DSP9_EFF_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Present - Display size 9 - Efficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);


subplot(4,4,16);

pcolor(time,f_TA_DSP9_EFF_avg,wt_TA_DSP9_EFF_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Absent - Display size 9 - Efficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);
 
subplot(4,4,4);

pcolor(time,f_TP_DSP9_InEFF_avg,wt_TP_DSP9_InEFF_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Present - Display size 9 - InEfficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);


subplot(4,4,12);

pcolor(time,f_TA_DSP9_InEFF_avg,wt_TA_DSP9_InEFF_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
title("Taget Absent - Display size 9 - InEfficient")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1]);
colormap jet
caxis([-7 7]);


%% Eff/Ineff TA/TP  Correct/Incorrect
wname = 'amor';
t_baseline = 0.5;
Fs=1000;

time = -0.5:1/Fs:3-1/Fs;

TPtrials = find(data.TA_TP==4);
TAtrials = find(data.TA_TP==3);
% 
Eff = find(data.Search_Type=="p");
Ineff = find(data.Search_Type=="s");
AddIneff=find(data.TP_Slope>=35);
AddEff=find(floor(data.TP_Slope)==13);
Eff=union(Eff,AddEff);
Ineff=union(Ineff,AddIneff);

Correct=find(data.Accuracy==1);
InCorrect=find(data.Accuracy==0);

TP_Eff_Correct_tmp=intersect(intersect(Eff,TPtrials),Correct);

TP_Eff_InCorrect_tmp=intersect(intersect(Eff,TPtrials),InCorrect);

TA_Eff_Correct_tmp=intersect(intersect(Eff,TAtrials),Correct);

TA_Eff_InCorrect_tmp=intersect(intersect(Eff,TAtrials),InCorrect);


TP_Ineff_Correct_tmp=intersect(intersect(Ineff,TPtrials),Correct);

TP_Ineff_InCorrect_tmp=intersect(intersect(Ineff,TPtrials),InCorrect);

TA_Ineff_Correct_tmp=intersect(intersect(Ineff,TAtrials),Correct);

TA_Ineff_InCorrect_tmp=intersect(intersect(Ineff,TAtrials),InCorrect);


TP_Eff_Correct=data(TP_Eff_Correct_tmp,:);

TP_Eff_InCorrect=data(TP_Eff_InCorrect_tmp,:);

TA_Eff_Correct=data(TA_Eff_Correct_tmp,:);

TA_Eff_InCorrect=data(TA_Eff_InCorrect_tmp,:);

TP_Ineff_Correct=data(TP_Ineff_Correct_tmp,:);

TP_Ineff_InCorrect=data(TP_Ineff_InCorrect_tmp,:);

TA_Ineff_Correct=data(TA_Ineff_Correct_tmp,:);

TA_Ineff_InCorrect=data(TA_Ineff_InCorrect_tmp,:);



TP_Eff_Correct_data=cell2mat((TP_Eff_Correct.Data)');

TP_Eff_InCorrect_data=cell2mat((TP_Eff_InCorrect.Data)');

TA_Eff_Correct_data=cell2mat((TA_Eff_Correct.Data)');

TA_Eff_InCorrect_data=cell2mat((TA_Eff_InCorrect.Data)');

TP_Ineff_Correct_data=cell2mat((TP_Ineff_Correct.Data)');

TP_Ineff_InCorrect_data=cell2mat((TP_Ineff_InCorrect.Data)');

TA_Ineff_Correct_data=cell2mat((TA_Ineff_Correct.Data)');

TA_Ineff_InCorrect_data=cell2mat((TA_Ineff_InCorrect.Data)');


[wt_TP_Eff_Correct_avg, f_TP_Eff_Correct_avg] = cal_cwt_1(TP_Eff_Correct_data', wname, Fs,3, 'TP eff Corr');
wt_TP_Eff_Correct_avg = baseline_normalization_mat(wt_TP_Eff_Correct_avg, t_baseline, Fs);

[wt_TP_Eff_InCorrect_avg, f_TP_Eff_InCorrect_avg] = cal_cwt_1(TP_Eff_InCorrect_data', wname, Fs, 3, 'TP_Eff_InCorrect');
wt_TP_Eff_InCorrect_avg = baseline_normalization_mat(wt_TP_Eff_InCorrect_avg, t_baseline, Fs);

[wt_TA_Eff_Correct_avg, f_TA_Eff_Correct_avg] = cal_cwt_1(TA_Eff_Correct_data', wname, Fs, 3, 'TA_Eff_Correct');
wt_TA_Eff_Correct_avg = baseline_normalization_mat(wt_TA_Eff_Correct_avg, t_baseline, Fs);

[wt_TA_Eff_InCorrect_avg, f_TA_Eff_InCorrect_data_avg] = cal_cwt_1(TA_Eff_InCorrect_data', wname, Fs, 3, 'TA_Eff_InCorrect');
wt_TA_Eff_InCorrect_avg = baseline_normalization_mat(wt_TA_Eff_InCorrect_avg, t_baseline, Fs);

[wt_TP_Ineff_Correct_avg, f_TP_Ineff_Correct_avg] = cal_cwt_1(TP_Ineff_Correct_data', wname, Fs,3, 'TP_Ineff_Correc');
wt_TP_Ineff_Correct_avg = baseline_normalization_mat(wt_TP_Ineff_Correct_avg, t_baseline, Fs);

[wt_TP_Ineff_InCorrect_avg, f_TP_Ineff_InCorrect_avg] = cal_cwt_1(TP_Ineff_InCorrect_data', wname, Fs, 3, 'TP_Ineff_InCorrect');
wt_TP_Ineff_InCorrect_avg = baseline_normalization_mat(wt_TP_Ineff_InCorrect_avg, t_baseline, Fs);

[wt_TA_Ineff_Correct_avg, f_TA_Ineff_Correct_avg] = cal_cwt_1(TA_Ineff_Correct_data', wname, Fs, 3, 'TA_Ineff_Correct');
wt_TA_Ineff_Correct_avg = baseline_normalization_mat(wt_TA_Ineff_Correct_avg, t_baseline, Fs);

[wt_TA_Ineff_InCorrect_avg, f_TA_Ineff_InCorrect_data_avg] = cal_cwt_1(TA_Ineff_InCorrect_data', wname, Fs, 3, 'TA_Ineff_InCorrect');
wt_TA_Ineff_InCorrect_avg = baseline_normalization_mat(wt_TA_Ineff_InCorrect_avg, t_baseline, Fs);

%% Smooth matrices across time
% Assuming your matrix is named 'data' (89x3500 matrix)
windowSize=35;
wt_TP_Eff_Correct_avg_smoothed = smoothdata(wt_TP_Eff_Correct_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_Eff_InCorrect_avg_smoothed = smoothdata(wt_TP_Eff_InCorrect_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_Eff_Correct_avg_smoothed = smoothdata(wt_TA_Eff_Correct_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_Eff_InCorrect_avg_smoothed = smoothdata(wt_TA_Eff_InCorrect_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_Ineff_Correct_avg_smoothed = smoothdata(wt_TP_Ineff_Correct_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_Ineff_InCorrect_avg_smoothed = smoothdata(wt_TP_Ineff_InCorrect_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_Ineff_Correct_avg_smoothed = smoothdata(wt_TA_Ineff_Correct_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_Ineff_InCorrect_avg_smoothed = smoothdata(wt_TA_Ineff_InCorrect_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)




%% Plot

fig = figure('units','normalized','outerposition',[0 0 1 1]);

subplot(2,4,1);
pcolor(time,f_TP_Eff_Correct_avg,wt_TP_Eff_Correct_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',15); 

title("Taget Present - Efficient - correct")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


subplot(2,4,2);

pcolor(time,f_TP_Ineff_Correct_avg,wt_TP_Ineff_Correct_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',15); 

title("Taget Present  - InEfficient - Correct")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);
 
subplot(2,4,3);

pcolor(time,f_TA_Eff_Correct_avg,wt_TA_Eff_Correct_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',15); 

title("Taget Absent  - Efficient - Correct")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


subplot(2,4,4);

pcolor(time,f_TA_Ineff_Correct_avg,wt_TA_Ineff_Correct_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',15); 

title("Taget Absent - InEfficient - Correct")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);



subplot(2,4,5);

pcolor(time,f_TP_Eff_InCorrect_avg,wt_TP_Eff_InCorrect_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',15); 
title("Taget Present - Efficient - InCorrect")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


subplot(2,4,6);

pcolor(time,f_TP_Ineff_InCorrect_avg,wt_TP_Ineff_InCorrect_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',15); 

title("Taget Present  - InEfficient - InCorrect")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);
 
subplot(2,4,7);

pcolor(time,f_TA_Eff_InCorrect_data_avg,wt_TA_Eff_InCorrect_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',15); 

title("Taget Absent  - Efficient - InCorrect")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


subplot(2,4,8);

pcolor(time,f_TA_Ineff_InCorrect_data_avg,wt_TA_Ineff_InCorrect_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',15); 

title("Taget Absent - InEfficient - InCorrect")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);




