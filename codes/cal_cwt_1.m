function [wt, f] = cal_cwt(data, wname, Fs, disp_size, cond)
    % Armin Panjehpour - Aug 2022
    % cal cwt of a data with n_trials*n_sample and average over all
    % trials
    wt = 0;
    
    n_trials = size(data,1);
    
    for i = 1:n_trials
        fprintf("Now calculating cwt of " + cond + " , trial " + i +...
            " , Disp Size " + disp_size + "\n");
        selected_data = data(i,:);
        [wt_temp, f] = cwt(selected_data, wname, Fs);
        %[wt_temp, f] = wavelet(selected_data, [], Fs);

        wt = wt + abs(wt_temp);
    end
    wt = wt./n_trials;
end