%% SNr 

%% Monkey LFP analysis 
clc; clear; 

%load('complete_data_both.mat');
load('data_JP_final_tptf_12_18.mat');


%% Trial separation based on conditions 
clc;
unique_sessions = unique(data.Session_Name);
Fs=1000;
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
TPtrials_Dspsize3_EFF_correct_tmp=intersect(TPtrials_Dspsize3_EFF_tmp,Correct);
TPtrials_Dspsize3_EFF_Incorrect_tmp=intersect(TPtrials_Dspsize3_EFF_tmp,InCorrect);
%
TAtrials_Dspsize3_EFF_tmp=intersect(intersect(DspSize3,TAtrials),Eff);
TAtrials_Dspsize3_EFF_correct_tmp=intersect(TAtrials_Dspsize3_EFF_tmp,Correct);
TAtrials_Dspsize3_EFF_Incorrect_tmp=intersect(TAtrials_Dspsize3_EFF_tmp,InCorrect);
%

TPtrials_Dspsize3_InEFF_tmp=intersect(intersect(DspSize3,TPtrials),Ineff);
TPtrials_Dspsize3_InEFF_correct_tmp=intersect(TPtrials_Dspsize3_InEFF_tmp,Correct);
TPtrials_Dspsize3_InEFF_Incorrect_tmp=intersect(TPtrials_Dspsize3_InEFF_tmp,InCorrect);
%

TAtrials_Dspsize3_InEFF_tmp=intersect(intersect(DspSize3,TAtrials),Ineff);
TAtrials_Dspsize3_InEFF_correct_tmp=intersect(TAtrials_Dspsize3_InEFF_tmp,Correct);
TAtrials_Dspsize3_InEFF_Incorrect_tmp=intersect(TAtrials_Dspsize3_InEFF_tmp,InCorrect);
%

TPtrials_Dspsize5_EFF_tmp=intersect(intersect(DspSize5,TPtrials),Eff);
TPtrials_Dspsize5_EFF_correct_tmp=intersect(TPtrials_Dspsize5_EFF_tmp,Correct);
TPtrials_Dspsize5_EFF_Incorrect_tmp=intersect(TPtrials_Dspsize5_EFF_tmp,InCorrect);
%

TAtrials_Dspsize5_EFF_tmp=intersect(intersect(DspSize5,TAtrials),Eff);
TAtrials_Dspsize5_EFF_correct_tmp=intersect(TAtrials_Dspsize5_EFF_tmp,Correct);
TAtrials_Dspsize5_EFF_Incorrect_tmp=intersect(TAtrials_Dspsize5_EFF_tmp,InCorrect);
%

TPtrials_Dspsize5_InEFF_tmp=intersect(intersect(DspSize5,TPtrials),Ineff);
TPtrials_Dspsize5_InEFF_correct_tmp=intersect(TPtrials_Dspsize5_InEFF_tmp,Correct);
TPtrials_Dspsize5_InEFF_Incorrect_tmp=intersect(TPtrials_Dspsize5_InEFF_tmp,InCorrect);
%

TAtrials_Dspsize5_InEFF_tmp=intersect(intersect(DspSize5,TAtrials),Ineff);
TAtrials_Dspsize5_InEFF_correct_tmp=intersect(TAtrials_Dspsize5_InEFF_tmp,Correct);
TAtrials_Dspsize5_InEFF_Incorrect_tmp=intersect(TAtrials_Dspsize5_InEFF_tmp,InCorrect);
%

TPtrials_Dspsize7_EFF_tmp=intersect(intersect(DspSize7,TPtrials),Eff);
TPtrials_Dspsize7_EFF_correct_tmp=intersect(TPtrials_Dspsize7_EFF_tmp,Correct);
TPtrials_Dspsize7_EFF_Incorrect_tmp=intersect(TPtrials_Dspsize7_EFF_tmp,InCorrect);
%

TAtrials_Dspsize7_EFF_tmp=intersect(intersect(DspSize7,TAtrials),Eff);
TAtrials_Dspsize7_EFF_correct_tmp=intersect(TAtrials_Dspsize7_EFF_tmp,Correct);
TAtrials_Dspsize7_EFF_Incorrect_tmp=intersect(TAtrials_Dspsize7_EFF_tmp,InCorrect);
%

TPtrials_Dspsize7_InEFF_tmp=intersect(intersect(DspSize7,TPtrials),Ineff);
TPtrials_Dspsize7_InEFF_correct_tmp=intersect(TPtrials_Dspsize7_InEFF_tmp,Correct);
TPtrials_Dspsize7_InEFF_Incorrect_tmp=intersect(TPtrials_Dspsize7_InEFF_tmp,InCorrect);
%

TAtrials_Dspsize7_InEFF_tmp=intersect(intersect(DspSize7,TAtrials),Ineff);
TAtrials_Dspsize7_InEFF_correct_tmp=intersect(TAtrials_Dspsize7_InEFF_tmp,Correct);
TAtrials_Dspsize7_InEFF_Incorrect_tmp=intersect(TAtrials_Dspsize7_InEFF_tmp,InCorrect);
%

TPtrials_Dspsize9_EFF_tmp=intersect(intersect(DspSize9,TPtrials),Eff);
TPtrials_Dspsize9_EFF_correct_tmp=intersect(TPtrials_Dspsize9_EFF_tmp,Correct);
TPtrials_Dspsize9_EFF_Incorrect_tmp=intersect(TPtrials_Dspsize9_EFF_tmp,InCorrect);
%

TAtrials_Dspsize9_EFF_tmp=intersect(intersect(DspSize9,TAtrials),Eff);
TAtrials_Dspsize9_EFF_correct_tmp=intersect(TAtrials_Dspsize9_EFF_tmp,Correct);
TAtrials_Dspsize9_EFF_Incorrect_tmp=intersect(TAtrials_Dspsize9_EFF_tmp,InCorrect);
%


TPtrials_Dspsize9_InEFF_tmp=intersect(intersect(DspSize9,TPtrials),Ineff);
TPtrials_Dspsize9_InEFF_correct_tmp=intersect(TPtrials_Dspsize9_InEFF_tmp,Correct);
TPtrials_Dspsize9_InEFF_Incorrect_tmp=intersect(TPtrials_Dspsize9_InEFF_tmp,InCorrect);

TAtrials_Dspsize9_InEFF_tmp=intersect(intersect(DspSize9,TAtrials),Ineff);
TAtrials_Dspsize9_InEFF_correct_tmp=intersect(TAtrials_Dspsize9_InEFF_tmp,Correct);
TAtrials_Dspsize9_InEFF_Incorrect_tmp=intersect(TAtrials_Dspsize9_InEFF_tmp,InCorrect);


%DSP3
TPtrials_Dspsize3_EFF_correct=data(TPtrials_Dspsize3_EFF_correct_tmp,:);
TPtrials_Dspsize3_EFF_Incorrect=data(TPtrials_Dspsize3_EFF_Incorrect_tmp,:);

TAtrials_Dspsize3_EFF_correct=data(TAtrials_Dspsize3_EFF_correct_tmp,:);
TAtrials_Dspsize3_EFF_Incorrect=data(TAtrials_Dspsize3_EFF_Incorrect_tmp,:);

TPtrials_Dspsize3_InEFF_correct=data(TPtrials_Dspsize3_InEFF_correct_tmp,:);
TPtrials_Dspsize3_InEFF_Incorrect=data(TPtrials_Dspsize3_InEFF_Incorrect_tmp,:);

TAtrials_Dspsize3_InEFF_correct=data(TAtrials_Dspsize3_InEFF_correct_tmp,:);
TAtrials_Dspsize3_InEFF_Incorrect=data(TAtrials_Dspsize3_InEFF_Incorrect_tmp,:);
%DSP5
TPtrials_Dspsize5_EFF_correct=data(TPtrials_Dspsize5_EFF_correct_tmp,:);
TPtrials_Dspsize5_EFF_Incorrect=data(TPtrials_Dspsize5_EFF_Incorrect_tmp,:);

TAtrials_Dspsize5_EFF_correct=data(TAtrials_Dspsize5_EFF_correct_tmp,:);
TAtrials_Dspsize5_EFF_Incorrect=data(TAtrials_Dspsize5_EFF_correct_tmp,:);

TPtrials_Dspsize5_InEFF_correct=data(TPtrials_Dspsize5_InEFF_correct_tmp,:);
TPtrials_Dspsize5_InEFF_Incorrect=data(TPtrials_Dspsize5_InEFF_Incorrect_tmp,:);

TAtrials_Dspsize5_InEFF_correct=data(TAtrials_Dspsize5_InEFF_correct_tmp,:);
TAtrials_Dspsize5_InEFF_Incorrect=data(TAtrials_Dspsize5_InEFF_Incorrect_tmp,:);

%DSP7
TPtrials_Dspsize7_EFF_correct=data(TPtrials_Dspsize7_EFF_correct_tmp,:);
TPtrials_Dspsize7_EFF_Incorrect=data(TPtrials_Dspsize7_EFF_Incorrect_tmp,:);

TAtrials_Dspsize7_EFF_correct=data(TAtrials_Dspsize7_EFF_correct_tmp,:);
TAtrials_Dspsize7_EFF_Incorrect=data(TAtrials_Dspsize7_EFF_Incorrect_tmp,:);

TPtrials_Dspsize7_InEFF_correct=data(TPtrials_Dspsize7_InEFF_correct_tmp,:);
TPtrials_Dspsize7_InEFF_Incorrect=data(TPtrials_Dspsize7_InEFF_Incorrect_tmp,:);

TAtrials_Dspsize7_InEFF_correct=data(TAtrials_Dspsize7_InEFF_correct_tmp,:);
TAtrials_Dspsize7_InEFF_Incorrect=data(TAtrials_Dspsize7_InEFF_Incorrect_tmp,:);
%DSP9
TPtrials_Dspsize9_EFF_correct=data(TPtrials_Dspsize9_EFF_correct_tmp,:);
TPtrials_Dspsize9_EFF_Incorrect=data(TPtrials_Dspsize9_EFF_Incorrect_tmp,:);

TAtrials_Dspsize9_EFF_correct=data(TAtrials_Dspsize9_EFF_correct_tmp,:);
TAtrials_Dspsize9_EFF_Incorrect=data(TAtrials_Dspsize9_EFF_Incorrect_tmp,:);

TPtrials_Dspsize9_InEFF_correct=data(TPtrials_Dspsize9_InEFF_correct_tmp,:);
TPtrials_Dspsize9_InEFF_Incorrect=data(TPtrials_Dspsize9_InEFF_Incorrect_tmp,:);

TAtrials_Dspsize9_InEFF_correct=data(TAtrials_Dspsize9_InEFF_correct_tmp,:);
TAtrials_Dspsize9_InEFF_Incorrect=data(TAtrials_Dspsize9_InEFF_Incorrect_tmp,:);


%% 

%DSP3
TPtrials_Dspsize3_EFF_correct_data=cell2mat((TPtrials_Dspsize3_EFF_correct.Data)');
TPtrials_Dspsize3_EFF_correct_data(:, any(isnan(TPtrials_Dspsize3_EFF_correct_data), 1)) = [];

TPtrials_Dspsize3_EFF_Incorrect_data=cell2mat((TPtrials_Dspsize3_EFF_Incorrect.Data)');
TPtrials_Dspsize3_EFF_Incorrect_data(:, any(isnan(TPtrials_Dspsize3_EFF_Incorrect_data), 1)) = [];


TAtrials_Dspsize3_EFF_correct_data=cell2mat((TAtrials_Dspsize3_EFF_correct.Data)');
TAtrials_Dspsize3_EFF_correct_data(:, any(isnan(TAtrials_Dspsize3_EFF_correct_data), 1)) = [];

TAtrials_Dspsize3_EFF_Incorrect_data=cell2mat((TAtrials_Dspsize3_EFF_Incorrect.Data)');
TAtrials_Dspsize3_EFF_Incorrect_data(:, any(isnan(TAtrials_Dspsize3_EFF_Incorrect_data), 1)) = [];
%

TPtrials_Dspsize3_InEFF_correct_data=cell2mat((TPtrials_Dspsize3_InEFF_correct.Data)');
TPtrials_Dspsize3_InEFF_correct_data(:, any(isnan(TPtrials_Dspsize3_InEFF_correct_data), 1)) = [];

TPtrials_Dspsize3_InEFF_Incorrect_data=cell2mat((TPtrials_Dspsize3_InEFF_Incorrect.Data)');
TPtrials_Dspsize3_InEFF_Incorrect_data(:, any(isnan(TPtrials_Dspsize3_InEFF_Incorrect_data), 1)) = [];


TAtrials_Dspsize3_InEFF_correct_data=cell2mat((TAtrials_Dspsize3_InEFF_correct.Data)');
TAtrials_Dspsize3_InEFF_correct_data(:, any(isnan(TAtrials_Dspsize3_InEFF_correct_data), 1)) = [];

TAtrials_Dspsize3_InEFF_Incorrect_data=cell2mat((TAtrials_Dspsize3_InEFF_Incorrect.Data)');
TAtrials_Dspsize3_InEFF_Incorrect_data(:, any(isnan(TAtrials_Dspsize3_InEFF_Incorrect_data), 1)) = [];

%DSP5
TPtrials_Dspsize5_EFF_correct_data=cell2mat((TPtrials_Dspsize5_EFF_correct.Data)');
TPtrials_Dspsize5_EFF_correct_data(:, any(isnan(TPtrials_Dspsize5_EFF_correct_data), 1)) = [];

TPtrials_Dspsize5_EFF_Incorrect_data=cell2mat((TPtrials_Dspsize5_EFF_Incorrect.Data)');
TPtrials_Dspsize5_EFF_Incorrect_data(:, any(isnan(TPtrials_Dspsize5_EFF_Incorrect_data), 1)) = [];


TAtrials_Dspsize5_EFF_correct_data=cell2mat((TAtrials_Dspsize5_EFF_correct.Data)');
TAtrials_Dspsize5_EFF_correct_data(:, any(isnan(TAtrials_Dspsize5_EFF_correct_data), 1)) = [];

TAtrials_Dspsize5_EFF_Incorrect_data=cell2mat((TAtrials_Dspsize5_EFF_Incorrect.Data)');
TAtrials_Dspsize5_EFF_Incorrect_data(:, any(isnan(TAtrials_Dspsize5_EFF_Incorrect_data), 1)) = [];


TPtrials_Dspsize5_InEFF_correct_data=cell2mat((TPtrials_Dspsize5_InEFF_correct.Data)');
TPtrials_Dspsize5_InEFF_correct_data(:, any(isnan(TPtrials_Dspsize5_InEFF_correct_data), 1)) = [];

TPtrials_Dspsize5_InEFF_Incorrect_data=cell2mat((TPtrials_Dspsize5_InEFF_Incorrect.Data)');
TPtrials_Dspsize5_InEFF_Incorrect_data(:, any(isnan(TPtrials_Dspsize5_InEFF_Incorrect_data), 1)) = [];


TAtrials_Dspsize5_InEFF_correct_data=cell2mat((TAtrials_Dspsize5_InEFF_correct.Data)');
TAtrials_Dspsize5_InEFF_correct_data(:, any(isnan(TAtrials_Dspsize5_InEFF_correct_data), 1)) = [];

TAtrials_Dspsize5_InEFF_Incorrect_data=cell2mat((TAtrials_Dspsize5_InEFF_Incorrect.Data)');
TAtrials_Dspsize5_InEFF_Incorrect_data(:, any(isnan(TAtrials_Dspsize5_InEFF_Incorrect_data), 1)) = [];

%DSP7
TPtrials_Dspsize7_EFF_correct_data=cell2mat((TPtrials_Dspsize7_EFF_correct.Data)');
TPtrials_Dspsize7_EFF_correct_data(:, any(isnan(TPtrials_Dspsize7_EFF_correct_data), 1)) = [];

TPtrials_Dspsize7_EFF_Incorrect_data=cell2mat((TPtrials_Dspsize7_EFF_Incorrect.Data)');
TPtrials_Dspsize7_EFF_Incorrect_data(:, any(isnan(TPtrials_Dspsize7_EFF_Incorrect_data), 1)) = [];


TAtrials_Dspsize7_EFF_correct_data=cell2mat((TAtrials_Dspsize7_EFF_correct.Data)');
TAtrials_Dspsize7_EFF_correct_data(:, any(isnan(TAtrials_Dspsize7_EFF_correct_data), 1)) = [];

TAtrials_Dspsize7_EFF_Incorrect_data=cell2mat((TAtrials_Dspsize7_EFF_Incorrect.Data)');
TAtrials_Dspsize7_EFF_Incorrect_data(:, any(isnan(TAtrials_Dspsize7_EFF_Incorrect_data), 1)) = [];


TPtrials_Dspsize7_InEFF_correct_data=cell2mat((TPtrials_Dspsize7_InEFF_correct.Data)');
TPtrials_Dspsize7_InEFF_correct_data(:, any(isnan(TPtrials_Dspsize7_InEFF_correct_data), 1)) = [];

TPtrials_Dspsize7_InEFF_Incorrect_data=cell2mat((TPtrials_Dspsize7_InEFF_Incorrect.Data)');
TPtrials_Dspsize7_InEFF_Incorrect_data(:, any(isnan(TPtrials_Dspsize7_InEFF_Incorrect_data), 1)) = [];


TAtrials_Dspsize7_InEFF_correct_data=cell2mat((TAtrials_Dspsize7_InEFF_correct.Data)');
TAtrials_Dspsize7_InEFF_correct_data(:, any(isnan(TAtrials_Dspsize7_InEFF_correct_data), 1)) = [];

TAtrials_Dspsize7_InEFF_Incorrect_data=cell2mat((TAtrials_Dspsize7_InEFF_Incorrect.Data)');
TAtrials_Dspsize7_InEFF_Incorrect_data(:, any(isnan(TAtrials_Dspsize7_InEFF_Incorrect_data), 1)) = [];

%DSP9
TPtrials_Dspsize9_EFF_correct_data=cell2mat((TPtrials_Dspsize9_EFF_correct.Data)');
TPtrials_Dspsize9_EFF_correct_data(:, any(isnan(TPtrials_Dspsize9_EFF_correct_data), 1)) = [];

TPtrials_Dspsize9_EFF_Incorrect_data=cell2mat((TPtrials_Dspsize9_EFF_Incorrect.Data)');
TPtrials_Dspsize9_EFF_Incorrect_data(:, any(isnan(TPtrials_Dspsize9_EFF_Incorrect_data), 1)) = [];


TAtrials_Dspsize9_EFF_correct_data=cell2mat((TAtrials_Dspsize9_EFF_correct.Data)');
TAtrials_Dspsize9_EFF_correct_data(:, any(isnan(TAtrials_Dspsize9_EFF_correct_data), 1)) = [];

TAtrials_Dspsize9_EFF_Incorrect_data=cell2mat((TAtrials_Dspsize9_EFF_Incorrect.Data)');
TAtrials_Dspsize9_EFF_Incorrect_data(:, any(isnan(TAtrials_Dspsize9_EFF_Incorrect_data), 1)) = [];


TPtrials_Dspsize9_InEFF_correct_data=cell2mat((TPtrials_Dspsize9_InEFF_correct.Data)');
TPtrials_Dspsize9_InEFF_correct_data(:, any(isnan(TPtrials_Dspsize9_InEFF_correct_data), 1)) = [];

TPtrials_Dspsize9_InEFF_Incorrect_data=cell2mat((TPtrials_Dspsize9_InEFF_Incorrect.Data)');
TPtrials_Dspsize9_InEFF_Incorrect_data(:, any(isnan(TPtrials_Dspsize9_InEFF_Incorrect_data), 1)) = [];


TAtrials_Dspsize9_InEFF_correct_data=cell2mat((TAtrials_Dspsize9_InEFF_correct.Data)');
TAtrials_Dspsize9_InEFF_correct_data(:, any(isnan(TAtrials_Dspsize9_InEFF_correct_data), 1)) = [];

TAtrials_Dspsize9_InEFF_Incorrect_data=cell2mat((TAtrials_Dspsize9_InEFF_Incorrect.Data)');
TAtrials_Dspsize9_InEFF_Incorrect_data(:, any(isnan(TAtrials_Dspsize9_InEFF_Incorrect_data), 1)) = [];


%% Wavelet transform

wname = 'amor';
t_baseline = 0.5;
time = -0.5:1/Fs:3-1/Fs;

%DSP3
[wt_TP_DSP3_EFF_correct_avg, f_TP_DSP3_EFF_correct_avg] = cal_cwt_1(TPtrials_Dspsize3_EFF_correct_data', wname, Fs, 3, 'Meow');
wt_TP_DSP3_EFF_correct_avg = baseline_normalization_mat(wt_TP_DSP3_EFF_correct_avg, t_baseline, Fs);

[wt_TA_DSP3_EFF_correct_avg, f_TA_DSP3_EFF_correct_avg] = cal_cwt_1(TAtrials_Dspsize3_EFF_correct_data', wname, Fs, 3, 'Meow');
wt_TA_DSP3_EFF_correct_avg = baseline_normalization_mat(wt_TA_DSP3_EFF_correct_avg, t_baseline, Fs);

[wt_TP_DSP3_InEFF_correct_avg, f_TP_DSP3_InEFF_correct_avg] = cal_cwt_1(TPtrials_Dspsize3_InEFF_correct_data', wname, Fs, 3, 'Meow');
wt_TP_DSP3_InEFF_correct_avg = baseline_normalization_mat(wt_TP_DSP3_InEFF_correct_avg, t_baseline, Fs);

[wt_TA_DSP3_InEFF_correct_avg, f_TA_DSP3_InEFF_correct_avg] = cal_cwt_1(TAtrials_Dspsize3_InEFF_correct_data', wname, Fs, 3, 'Meow');
wt_TA_DSP3_InEFF_correct_avg = baseline_normalization_mat(wt_TA_DSP3_InEFF_correct_avg, t_baseline, Fs);
 
[wt_TP_DSP3_EFF_Incorrect_avg, f_TP_DSP3_EFF_Incorrect_avg] = cal_cwt_1(TPtrials_Dspsize3_EFF_Incorrect_data', wname, Fs, 3, 'Meow');
wt_TP_DSP3_EFF_Incorrect_avg = baseline_normalization_mat(wt_TP_DSP3_EFF_Incorrect_avg, t_baseline, Fs);

[wt_TA_DSP3_EFF_Incorrect_avg, f_TA_DSP3_EFF_Incorrect_avg] = cal_cwt_1(TAtrials_Dspsize3_EFF_Incorrect_data', wname, Fs, 3, 'Meow');
wt_TA_DSP3_EFF_Incorrect_avg = baseline_normalization_mat(wt_TA_DSP3_EFF_Incorrect_avg, t_baseline, Fs);

[wt_TP_DSP3_InEFF_Incorrect_avg, f_TP_DSP3_InEFF_Incorrect_avg] = cal_cwt_1(TPtrials_Dspsize3_InEFF_Incorrect_data', wname, Fs, 3, 'Meow');
wt_TP_DSP3_InEFF_Incorrect_avg = baseline_normalization_mat(wt_TP_DSP3_InEFF_Incorrect_avg, t_baseline, Fs);

[wt_TA_DSP3_InEFF_Incorrect_avg, f_TA_DSP3_InEFF_Incorrect_avg] = cal_cwt_1(TAtrials_Dspsize3_InEFF_Incorrect_data', wname, Fs, 3, 'Meow');
wt_TA_DSP3_InEFF_Incorrect_avg = baseline_normalization_mat(wt_TA_DSP3_InEFF_Incorrect_avg, t_baseline, Fs);
 


%DSP5
[wt_TP_DSP5_EFF_correct_avg, f_TP_DSP5_EFF_correct_avg] = cal_cwt_1(TPtrials_Dspsize5_EFF_correct_data', wname, Fs, 5, 'Meow');
wt_TP_DSP5_EFF_correct_avg = baseline_normalization_mat(wt_TP_DSP5_EFF_correct_avg, t_baseline, Fs);

[wt_TA_DSP5_EFF_correct_avg, f_TA_DSP5_EFF_correct_avg] = cal_cwt_1(TAtrials_Dspsize5_EFF_correct_data', wname, Fs, 5, 'Meow');
wt_TA_DSP5_EFF_correct_avg = baseline_normalization_mat(wt_TA_DSP5_EFF_correct_avg, t_baseline, Fs);

[wt_TP_DSP5_InEFF_correct_avg, f_TP_DSP5_InEFF_correct_avg] = cal_cwt_1(TPtrials_Dspsize5_InEFF_correct_data', wname, Fs, 5, 'Meow');
wt_TP_DSP5_InEFF_correct_avg = baseline_normalization_mat(wt_TP_DSP5_InEFF_correct_avg, t_baseline, Fs);

[wt_TA_DSP5_InEFF_correct_avg, f_TA_DSP5_InEFF_correct_avg] = cal_cwt_1(TAtrials_Dspsize5_InEFF_correct_data', wname, Fs, 5, 'Meow');
wt_TA_DSP5_InEFF_correct_avg = baseline_normalization_mat(wt_TA_DSP5_InEFF_correct_avg, t_baseline, Fs);
 
[wt_TP_DSP5_EFF_Incorrect_avg, f_TP_DSP5_EFF_Incorrect_avg] = cal_cwt_1(TPtrials_Dspsize5_EFF_Incorrect_data', wname, Fs, 5, 'Meow');
wt_TP_DSP5_EFF_Incorrect_avg = baseline_normalization_mat(wt_TP_DSP5_EFF_Incorrect_avg, t_baseline, Fs);

[wt_TA_DSP5_EFF_Incorrect_avg, f_TA_DSP5_EFF_Incorrect_avg] = cal_cwt_1(TAtrials_Dspsize5_EFF_Incorrect_data', wname, Fs, 5, 'Meow');
wt_TA_DSP5_EFF_Incorrect_avg = baseline_normalization_mat(wt_TA_DSP5_EFF_Incorrect_avg, t_baseline, Fs);

[wt_TP_DSP5_InEFF_Incorrect_avg, f_TP_DSP5_InEFF_Incorrect_avg] = cal_cwt_1(TPtrials_Dspsize5_InEFF_Incorrect_data', wname, Fs, 5, 'Meow');
wt_TP_DSP5_InEFF_Incorrect_avg = baseline_normalization_mat(wt_TP_DSP5_InEFF_Incorrect_avg, t_baseline, Fs);

[wt_TA_DSP5_InEFF_Incorrect_avg, f_TA_DSP5_InEFF_Incorrect_avg] = cal_cwt_1(TAtrials_Dspsize5_InEFF_Incorrect_data', wname, Fs, 5, 'Meow');
wt_TA_DSP5_InEFF_Incorrect_avg = baseline_normalization_mat(wt_TA_DSP5_InEFF_Incorrect_avg, t_baseline, Fs);
 

%DSP7
[wt_TP_DSP7_EFF_correct_avg, f_TP_DSP7_EFF_correct_avg] = cal_cwt_1(TPtrials_Dspsize7_EFF_correct_data', wname, Fs, 7, 'Meow');
wt_TP_DSP7_EFF_correct_avg = baseline_normalization_mat(wt_TP_DSP7_EFF_correct_avg, t_baseline, Fs);

[wt_TA_DSP7_EFF_correct_avg, f_TA_DSP7_EFF_correct_avg] = cal_cwt_1(TAtrials_Dspsize7_EFF_correct_data', wname, Fs, 7, 'Meow');
wt_TA_DSP7_EFF_correct_avg = baseline_normalization_mat(wt_TA_DSP7_EFF_correct_avg, t_baseline, Fs);

[wt_TP_DSP7_InEFF_correct_avg, f_TP_DSP7_InEFF_correct_avg] = cal_cwt_1(TPtrials_Dspsize7_InEFF_correct_data', wname, Fs, 7, 'Meow');
wt_TP_DSP7_InEFF_correct_avg = baseline_normalization_mat(wt_TP_DSP7_InEFF_correct_avg, t_baseline, Fs);

[wt_TA_DSP7_InEFF_correct_avg, f_TA_DSP7_InEFF_correct_avg] = cal_cwt_1(TAtrials_Dspsize7_InEFF_correct_data', wname, Fs, 7, 'Meow');
wt_TA_DSP7_InEFF_correct_avg = baseline_normalization_mat(wt_TA_DSP7_InEFF_correct_avg, t_baseline, Fs);
 
[wt_TP_DSP7_EFF_Incorrect_avg, f_TP_DSP7_EFF_Incorrect_avg] = cal_cwt_1(TPtrials_Dspsize7_EFF_Incorrect_data', wname, Fs, 7, 'Meow');
wt_TP_DSP7_EFF_Incorrect_avg = baseline_normalization_mat(wt_TP_DSP7_EFF_Incorrect_avg, t_baseline, Fs);

[wt_TA_DSP7_EFF_Incorrect_avg, f_TA_DSP7_EFF_Incorrect_avg] = cal_cwt_1(TAtrials_Dspsize7_EFF_Incorrect_data', wname, Fs, 7, 'Meow');
wt_TA_DSP7_EFF_Incorrect_avg = baseline_normalization_mat(wt_TA_DSP7_EFF_Incorrect_avg, t_baseline, Fs);

[wt_TP_DSP7_InEFF_Incorrect_avg, f_TP_DSP7_InEFF_Incorrect_avg] = cal_cwt_1(TPtrials_Dspsize7_InEFF_Incorrect_data', wname, Fs, 7, 'Meow');
wt_TP_DSP7_InEFF_Incorrect_avg = baseline_normalization_mat(wt_TP_DSP7_InEFF_Incorrect_avg, t_baseline, Fs);

[wt_TA_DSP7_InEFF_Incorrect_avg, f_TA_DSP7_InEFF_Incorrect_avg] = cal_cwt_1(TAtrials_Dspsize7_InEFF_Incorrect_data', wname, Fs, 7, 'Meow');
wt_TA_DSP7_InEFF_Incorrect_avg = baseline_normalization_mat(wt_TA_DSP7_InEFF_Incorrect_avg, t_baseline, Fs);
 

%DSP9
[wt_TP_DSP9_EFF_correct_avg, f_TP_DSP9_EFF_correct_avg] = cal_cwt_1(TPtrials_Dspsize9_EFF_correct_data', wname, Fs, 9, 'Meow');
wt_TP_DSP9_EFF_correct_avg = baseline_normalization_mat(wt_TP_DSP9_EFF_correct_avg, t_baseline, Fs);

[wt_TA_DSP9_EFF_correct_avg, f_TA_DSP9_EFF_correct_avg] = cal_cwt_1(TAtrials_Dspsize9_EFF_correct_data', wname, Fs, 9, 'Meow');
wt_TA_DSP9_EFF_correct_avg = baseline_normalization_mat(wt_TA_DSP9_EFF_correct_avg, t_baseline, Fs);

[wt_TP_DSP9_InEFF_correct_avg, f_TP_DSP9_InEFF_correct_avg] = cal_cwt_1(TPtrials_Dspsize9_InEFF_correct_data', wname, Fs, 9, 'Meow');
wt_TP_DSP9_InEFF_correct_avg = baseline_normalization_mat(wt_TP_DSP9_InEFF_correct_avg, t_baseline, Fs);

[wt_TA_DSP9_InEFF_correct_avg, f_TA_DSP9_InEFF_correct_avg] = cal_cwt_1(TAtrials_Dspsize9_InEFF_correct_data', wname, Fs, 9, 'Meow');
wt_TA_DSP9_InEFF_correct_avg = baseline_normalization_mat(wt_TA_DSP9_InEFF_correct_avg, t_baseline, Fs);
 
[wt_TP_DSP9_EFF_Incorrect_avg, f_TP_DSP9_EFF_Incorrect_avg] = cal_cwt_1(TPtrials_Dspsize9_EFF_Incorrect_data', wname, Fs, 9, 'Meow');
wt_TP_DSP9_EFF_Incorrect_avg = baseline_normalization_mat(wt_TP_DSP9_EFF_Incorrect_avg, t_baseline, Fs);

[wt_TA_DSP9_EFF_Incorrect_avg, f_TA_DSP9_EFF_Incorrect_avg] = cal_cwt_1(TAtrials_Dspsize9_EFF_Incorrect_data', wname, Fs, 9, 'Meow');
wt_TA_DSP9_EFF_Incorrect_avg = baseline_normalization_mat(wt_TA_DSP9_EFF_Incorrect_avg, t_baseline, Fs);

[wt_TP_DSP9_InEFF_Incorrect_avg, f_TP_DSP9_InEFF_Incorrect_avg] = cal_cwt_1(TPtrials_Dspsize9_InEFF_Incorrect_data', wname, Fs, 9, 'Meow');
wt_TP_DSP9_InEFF_Incorrect_avg = baseline_normalization_mat(wt_TP_DSP9_InEFF_Incorrect_avg, t_baseline, Fs);

[wt_TA_DSP9_InEFF_Incorrect_avg, f_TA_DSP9_InEFF_Incorrect_avg] = cal_cwt_1(TAtrials_Dspsize9_InEFF_Incorrect_data', wname, Fs, 9, 'Meow');
wt_TA_DSP9_InEFF_Incorrect_avg = baseline_normalization_mat(wt_TA_DSP9_InEFF_Incorrect_avg, t_baseline, Fs);
 
%% Smooth matrices across time
% Assuming your matrix is named 'data' (89x3500 matrix)
windowSize=35;
wt_TP_DSP3_EFF_correct_avg_smoothed = smoothdata(wt_TP_DSP3_EFF_correct_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP3_EFF_correct_avg_smoothed = smoothdata(wt_TA_DSP3_EFF_correct_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_DSP3_InEFF_correct_avg_smoothed = smoothdata(wt_TP_DSP3_InEFF_correct_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP3_InEFF_correct_avg_smoothed = smoothdata(wt_TA_DSP3_InEFF_correct_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_DSP5_EFF_correct_avg_smoothed = smoothdata(wt_TP_DSP5_EFF_correct_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP5_EFF_correct_avg_smoothed = smoothdata(wt_TA_DSP5_EFF_correct_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_DSP5_InEFF_correct_avg_smoothed = smoothdata(wt_TP_DSP5_InEFF_correct_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP5_InEFF_correct_avg_smoothed = smoothdata(wt_TA_DSP5_InEFF_correct_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_DSP7_EFF_correct_avg_smoothed = smoothdata(wt_TP_DSP7_EFF_correct_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP7_EFF_correct_avg_smoothed = smoothdata(wt_TA_DSP7_EFF_correct_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_DSP7_InEFF_correct_avg_smoothed = smoothdata(wt_TP_DSP7_InEFF_correct_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP7_InEFF_correct_avg_smoothed = smoothdata(wt_TA_DSP7_InEFF_correct_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_DSP9_EFF_correct_avg_smoothed = smoothdata(wt_TP_DSP9_EFF_correct_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP9_EFF_correct_avg_smoothed = smoothdata(wt_TA_DSP9_EFF_correct_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_DSP9_InEFF_correct_avg_smoothed = smoothdata(wt_TP_DSP9_InEFF_correct_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP9_InEFF_correct_avg_smoothed = smoothdata(wt_TA_DSP9_InEFF_correct_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

%Incorr
wt_TP_DSP3_EFF_Incorrect_avg_smoothed = smoothdata(wt_TP_DSP3_EFF_Incorrect_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP3_EFF_Incorrect_avg_smoothed = smoothdata(wt_TA_DSP3_EFF_Incorrect_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_DSP3_InEFF_Incorrect_avg_smoothed = smoothdata(wt_TP_DSP3_InEFF_Incorrect_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP3_InEFF_Incorrect_avg_smoothed = smoothdata(wt_TA_DSP3_InEFF_Incorrect_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_DSP5_EFF_Incorrect_avg_smoothed = smoothdata(wt_TP_DSP5_EFF_Incorrect_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP5_EFF_Incorrect_avg_smoothed = smoothdata(wt_TA_DSP5_EFF_Incorrect_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_DSP5_InEFF_Incorrect_avg_smoothed = smoothdata(wt_TP_DSP5_InEFF_Incorrect_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP5_InEFF_Incorrect_avg_smoothed = smoothdata(wt_TA_DSP5_InEFF_Incorrect_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_DSP7_EFF_Incorrect_avg_smoothed = smoothdata(wt_TP_DSP7_EFF_Incorrect_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP7_EFF_Incorrect_avg_smoothed = smoothdata(wt_TA_DSP7_EFF_Incorrect_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_DSP7_InEFF_Incorrect_avg_smoothed = smoothdata(wt_TP_DSP7_InEFF_Incorrect_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP7_InEFF_Incorrect_avg_smoothed = smoothdata(wt_TA_DSP7_InEFF_Incorrect_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_DSP9_EFF_Incorrect_avg_smoothed = smoothdata(wt_TP_DSP9_EFF_Incorrect_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP9_EFF_Incorrect_avg_smoothed = smoothdata(wt_TA_DSP9_EFF_Incorrect_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TP_DSP9_InEFF_Incorrect_avg_smoothed = smoothdata(wt_TP_DSP9_InEFF_Incorrect_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)

wt_TA_DSP9_InEFF_Incorrect_avg_smoothed = smoothdata(wt_TA_DSP9_InEFF_Incorrect_avg, 2, 'gaussian', windowSize); % Smooth along the time axis (dimension 2)



%% Plot LFPs in different conditions of Eff/Ineff and Dsp Sizes = [3,5,7,9]
%% Plot TP
fig = figure('units','normalized','outerposition',[0 0 1 1]);

subplot(4,4,1);

pcolor(time,f_TP_DSP3_EFF_correct_avg,wt_TP_DSP3_EFF_correct_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 
title("Taget Present - Display size 3 - Efficient _ correct")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


subplot(4,4,2);

pcolor(time,f_TP_DSP5_EFF_correct_avg,wt_TP_DSP5_EFF_correct_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 
title("Taget Present - Display size 5 - Efficient _ correct")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);
 
subplot(4,4,3);

pcolor(time,f_TP_DSP7_EFF_correct_avg,wt_TP_DSP7_EFF_correct_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 
title("Taget Present - Display size 7 - Efficient _ correct")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


subplot(4,4,4);

pcolor(time,f_TP_DSP9_EFF_correct_avg,wt_TP_DSP9_EFF_correct_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Present - Display size 9 - Efficient _ correct")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


subplot(4,4,5);

pcolor(time,f_TP_DSP3_EFF_Incorrect_avg,wt_TP_DSP3_EFF_Incorrect_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Present - Display size 3 - Efficient _ Incorrect")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


subplot(4,4,6);

pcolor(time,f_TP_DSP5_EFF_Incorrect_avg,wt_TP_DSP5_EFF_Incorrect_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Present - Display size 5 - Efficient _ Incorrect")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);
 
subplot(4,4,7);

pcolor(time,f_TP_DSP7_EFF_Incorrect_avg,wt_TP_DSP7_EFF_Incorrect_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Present - Display size 7 - Efficient _ Incorrect")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


subplot(4,4,8);

pcolor(time,f_TP_DSP9_EFF_Incorrect_avg,wt_TP_DSP9_EFF_Incorrect_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Present - Display size 9 - Efficient _ Incorrect")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);

subplot(4,4,9);

pcolor(time,f_TP_DSP3_InEFF_correct_avg,wt_TP_DSP3_InEFF_correct_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Present - Display size 3 - InEfficient - correct")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


subplot(4,4,10);

pcolor(time,f_TP_DSP5_InEFF_correct_avg,wt_TP_DSP5_InEFF_correct_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Present - Display size 5 - InEfficient - correct")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);
 
subplot(4,4,11);

pcolor(time,f_TP_DSP7_InEFF_correct_avg,wt_TP_DSP7_InEFF_correct_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Present - Display size 7 - InEfficient - correct")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


subplot(4,4,12);

pcolor(time,f_TP_DSP9_InEFF_correct_avg,wt_TP_DSP9_InEFF_correct_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Present - Display size 9 - InEfficient - correct")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);

subplot(4,4,13);

pcolor(time,f_TP_DSP3_InEFF_Incorrect_avg,wt_TP_DSP3_InEFF_Incorrect_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Present - Display size 3 - InEfficient - Incorrect")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


subplot(4,4,14);

pcolor(time,f_TP_DSP5_InEFF_Incorrect_avg,wt_TP_DSP5_InEFF_Incorrect_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Present - Display size 5 - InEfficient - Incorrect")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);
 
subplot(4,4,15);

pcolor(time,f_TP_DSP7_InEFF_Incorrect_avg,wt_TP_DSP7_InEFF_Incorrect_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Present - Display size 7 - InEfficient - Incorrect")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


subplot(4,4,16);

pcolor(time,f_TP_DSP9_InEFF_Incorrect_avg,wt_TP_DSP9_InEFF_Incorrect_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Present - Display size 9 - InEfficient - Incorrect")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);




%% Plot TA

fig = figure('units','normalized','outerposition',[0 0 1 1]);

subplot(4,4,1);

pcolor(time,f_TA_DSP3_EFF_correct_avg,wt_TA_DSP3_EFF_correct_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 
title("Taget Absent - Display size 3 - Efficient _ correct")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


subplot(4,4,2);

pcolor(time,f_TA_DSP5_EFF_correct_avg,wt_TA_DSP5_EFF_correct_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 
title("Taget Absent - Display size 5 - Efficient _ correct")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);
 
subplot(4,4,3);

pcolor(time,f_TA_DSP7_EFF_correct_avg,wt_TA_DSP7_EFF_correct_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 
title("Taget Absent - Display size 7 - Efficient _ correct")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


subplot(4,4,4);

pcolor(time,f_TA_DSP9_EFF_correct_avg,wt_TA_DSP9_EFF_correct_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Absent - Display size 9 - Efficient _ correct")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


subplot(4,4,5);

pcolor(time,f_TA_DSP3_EFF_Incorrect_avg,wt_TA_DSP3_EFF_Incorrect_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Absent - Display size 5 - Efficient _ Incorrect")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


subplot(4,4,6);

pcolor(time,f_TA_DSP5_EFF_Incorrect_avg,wt_TA_DSP5_EFF_Incorrect_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Absent - Display size 5 - Efficient _ Incorrect")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);
 
subplot(4,4,7);

pcolor(time,f_TA_DSP7_EFF_Incorrect_avg,wt_TA_DSP7_EFF_Incorrect_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Absent - Display size 7 - Efficient _ Incorrect")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


subplot(4,4,8);

pcolor(time,f_TA_DSP9_EFF_Incorrect_avg,wt_TA_DSP9_EFF_Incorrect_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Absent - Display size 9 - Efficient _ Incorrect")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);

subplot(4,4,9);

pcolor(time,f_TA_DSP3_InEFF_correct_avg,wt_TA_DSP3_InEFF_correct_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Absent - Display size 3 - InEfficient - correct")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


subplot(4,4,10);

pcolor(time,f_TA_DSP5_InEFF_correct_avg,wt_TA_DSP5_InEFF_correct_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Absent - Display size 5 - InEfficient - correct")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);
 
subplot(4,4,11);

pcolor(time,f_TA_DSP7_InEFF_correct_avg,wt_TA_DSP7_InEFF_correct_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Absent - Display size 7 - InEfficient - correct")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


subplot(4,4,12);

pcolor(time,f_TA_DSP9_InEFF_correct_avg,wt_TA_DSP9_InEFF_correct_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Absent - Display size 9 - InEfficient - correct")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);

subplot(4,4,13);

pcolor(time,f_TA_DSP3_InEFF_Incorrect_avg,wt_TA_DSP3_InEFF_Incorrect_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Absent - Display size 3 - InEfficient - Incorrect")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


subplot(4,4,14);

pcolor(time,f_TA_DSP5_InEFF_Incorrect_avg,wt_TA_DSP5_InEFF_Incorrect_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Absent - Display size 5 - InEfficient - Incorrect")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);
 
subplot(4,4,15);

pcolor(time,f_TA_DSP7_InEFF_Incorrect_avg,wt_TA_DSP7_InEFF_Incorrect_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Absent - Display size 7 - InEfficient - Incorrect")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


subplot(4,4,16);

pcolor(time,f_TA_DSP9_InEFF_Incorrect_avg,wt_TA_DSP9_InEFF_Incorrect_avg_smoothed);
%xline(0,'LineWidth',1.5,'LineStyle','--'); % baseline
set(gca,'FontSize',12); 

title("Taget Absent - Display size 9 - InEfficient - Incorrect")
xlabel('time(s)','interpreter','latex');
ylabel('frequency(Hz)','interpreter','latex');
shading flat;
ylim([0 200]);
xlim([-0.5,1.5]);
colormap jet
caxis([-7 7]);


%%--------------------------------------------------------------
%% vlPFC
