function onset = onset_detector(avg_ds_sig, time, search_timeband, scale)

    % interpolate data
    time_interp = interp(time, scale);
    sig_interp = interp(avg_ds_sig, scale); 

    lowp_sig = smoothdata(sig_interp,'movmean',200);
    start = find(int32(time_interp) == search_timeband(1),1);
    endd = find(int32(time_interp) == search_timeband(2),1);
    
    [max_peak, max_ind] = max(lowp_sig(start:endd));
    
    % find start
    max_dis = find(lowp_sig(start+max_ind-1:-1:start) <= max_peak/3,1);
    onset = time_interp(start + max_ind - max_dis);
    
    % live plot
%     plot(time_interp,lowp_sig)
%     if(~isnan(onset))
%         xline(onset)
%     end
end