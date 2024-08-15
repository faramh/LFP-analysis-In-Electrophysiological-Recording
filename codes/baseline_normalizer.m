function Data_normalized=baseline_normalizer(Data,varargin)

global Tm  
if any(strcmpi('sec',varargin)), time=Tm.*1000;else time=Tm; end
if any(strcmpi('baseline',varargin)), baseline=varargin{find(strcmpi('baseline',varargin))+1}; else baseline=[-500 -100]; end  
if any(strcmpi('method',varargin)), method=varargin{find(strcmpi('method',varargin))+1}; else method='Z_transform'; end

switch method
    case 'Z_transform'
        Data_normalized=bsxfun(@rdivide,bsxfun(@minus,Data,...
                    repmat(nanmean(Data(:,ismember(time,baseline(1):baseline(2))),2),1,length(time))),...
                    repmat(nanstd(Data(:,ismember(time,baseline(1):baseline(2))),[],2),1,length(time)));


    case 'db'

        Data_normalized=10*log10(bsxfun(@rdivide,Data,...
            repmat(nanmean(Data(:,ismember(time,baseline(1):baseline(2))),2),1,length(time))));
end


end
