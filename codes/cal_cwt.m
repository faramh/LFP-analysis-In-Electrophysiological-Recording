function [wt, f] = cal_cwt(data, wname, Fs, disp_size, cond, start, endd)
    % cal cwt of a data with n_trials*n_sample and average over all
    % trials
    wt = 0;
   
    n_trials = size(data,1);
   
    for i = 1:n_trials
        fprintf("Now calculating cwt of " + cond + " , trial " + i +...
            " , Disp Size " + disp_size + "\n");
        selected_data = data(i,:);
        if(~isempty(selected_data))
            [wt_temp, f] = cwt(selected_data(start:endd), wname, Fs);
            wt = wt + abs(wt_temp);
        else
            wt = nan; f = nan;
        end
    end
    wt = wt./n_trials;
   
    if n_trials == 0
        wt = nan; f = nan;          
    end
end
