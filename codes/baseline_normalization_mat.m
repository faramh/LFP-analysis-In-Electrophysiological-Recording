function bn_sig = baseline_normalization_mat(sig, t_baseline, Fs)
    % baseline normalization on a matrix according to the
    % t_basline, (n_freqs(or trials), nsamples)
    
    bn_sig = (sig - mean(sig(:,1:t_baseline*Fs),2))./std(sig(:,1:t_baseline*Fs),[],2);
end
