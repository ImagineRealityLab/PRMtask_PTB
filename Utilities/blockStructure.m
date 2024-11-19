function trials = blockStructure(nDet,nIma,nRep)

nBlocks = nDet*nIma*nRep;
nPerRep = nIma*nDet;
trials  = nan(nBlocks,2);

for r = 1:nRep
    
    idx = (r-1)*nPerRep+1:r*nPerRep;
    
    for d = 1:nDet
        idx2 = (d-1)*nDet+1:d*nDet;
        trials(idx(idx2),1) = d;
        for i = 1:nIma
            trials(idx(idx2(i)),2) = i;
        end
    end
    
    % shuffle per rep
    trials(idx,:) = trials(idx(randperm(nPerRep)),:);
    
end