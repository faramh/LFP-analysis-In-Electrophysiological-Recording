function bn_sig = baseline_normalization(sig, t_baseline, Fs)
    % baseline normalization on a time vector signal according to the
    % t_basline
    bn_sig = (sig - mean(sig(1:t_baseline*Fs)))./std(sig(1:t_baseline*Fs));
end