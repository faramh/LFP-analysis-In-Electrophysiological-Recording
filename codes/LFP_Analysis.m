%% Monkey LFP analysis 
clc; clear; close all;

%load('complete_data_both.mat');
load('data_both_16_feb.mat');

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

%% baseline normalize data of all sessions
clc;

n_data = size(data,1);

t_baseline = 0.5;
for idata = 1:n_data
    disp("Normalizing data " + idata)
    selected_data = data.Data(idata);
    data.Data(idata) = {baseline_normalization(selected_data{1,1},...
        t_baseline, Fs)};
end


%% Trial separation based on conditions
clc;
unique_sessions = unique(data.Session_Name);

TPtrials = find(data.TA_TP==4);
TAtrials = find(data.TA_TP==3);

Eff=find(data.TP_Slope<=20);
Ineff=find(data.TP_Slope>=35);


DspSize3 = find(data.Display_Size==3);
DspSize5 = find(data.Display_Size==5);
DspSize7 = find(data.Display_Size==7);
DspSize9 = find(data.Display_Size==9);


Correct=find(data.Accuracy==1);
InCorrect=find(data.Accuracy==0);


TAtrials_Eff_correct_temp=intersect(intersect(TAtrials,Correct),Eff);
TPtrials_Eff_correct_temp=intersect(intersect(TPtrials,Correct),Eff);

TAtrials_Eff_Incorrect_temp=intersect(intersect(TAtrials,InCorrect),Eff);
TPtrials_Eff_Incorrect_temp=intersect(intersect(TPtrials,InCorrect),Eff);

TAtrials_InEff_correct_temp=intersect(intersect(TAtrials,Correct),Ineff);
TPtrials_InEff_correct_temp=intersect(intersect(TPtrials,Correct),Ineff);

TAtrials_InEff_Incorrect_temp=intersect(intersect(TAtrials,InCorrect),Ineff);
TPtrials_InEff_Incorrect_temp=intersect(intersect(TPtrials,InCorrect),Ineff);


TAtrials_Eff_correct=data(TAtrials_Eff_correct_temp,:);
TPtrials_Eff_correct=data(TPtrials_Eff_correct_temp,:);

TAtrials_Eff_Incorrect=data(TAtrials_Eff_Incorrect_temp,:);
TPtrials_Eff_Incorrect=data(TPtrials_Eff_Incorrect_temp,:);

TAtrials_InEff_correct=data(TAtrials_InEff_correct_temp,:);
TPtrials_InEff_correct=data(TPtrials_InEff_correct_temp,:);

TAtrials_InEff_Incorrect=data(TAtrials_InEff_Incorrect_temp,:);
TPtrials_InEff_Incorrect=data(TPtrials_InEff_Incorrect_temp,:);

%%  Ectracting LFP data from tabel

TAtrials_Eff_correct_data=cell2mat((TAtrials_Eff_correct.Data)');
TPtrials_Eff_correct_data=cell2mat((TPtrials_Eff_correct.Data)');

TAtrials_Eff_Incorrect_data=cell2mat((TAtrials_Eff_Incorrect.Data)');
TPtrials_Eff_Incorrect_data=cell2mat((TPtrials_Eff_Incorrect.Data)');

TAtrials_InEff_correct_data=cell2mat((TAtrials_InEff_correct.Data)');
TPtrials_InEff_correct_data=cell2mat((TPtrials_InEff_correct.Data)');

TAtrials_InEff_Incorrect_data=cell2mat((TAtrials_InEff_Incorrect.Data)');
TPtrials_InEff_Incorrect_data=cell2mat((TPtrials_InEff_Incorrect.Data)');



TAtrials_Eff_correct_data_average=nanmean(TAtrials_Eff_correct_data,2);
TPtrials_Eff_correct_data_average=nanmean(TPtrials_Eff_correct_data,2);

TAtrials_Eff_Incorrect_data_average=nanmean(TAtrials_Eff_Incorrect_data,2);
TPtrials_Eff_Incorrect_data_average=nanmean(TPtrials_Eff_Incorrect_data,2);

TAtrials_InEff_correct_data_average=nanmean(TAtrials_InEff_correct_data,2);
TPtrials_InEff_correct_data_average=nanmean(TPtrials_InEff_correct_data,2);

TAtrials_InEff_Incorrect_data_average=nanmean(TAtrials_InEff_Incorrect_data,2);
TPtrials_InEff_Incorrect_data_average=nanmean(TPtrials_InEff_Incorrect_data,2);











