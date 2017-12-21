function [ weights ] =  compute_weights(imPatch, qTarget, pCurrent, Nbins)
% This Function was created by Mohit Kumar Ahuja for Visual Tracking Lab.
% Submtted to: Dr. Desire


% Compute the ratio vector btw both color distributions
ratio = sqrt(qTarget./pCurrent);

% Find weights over all the patch, for every pixels
for i = 1:size(imPatch,1)
    for j = 1:size(imPatch,2)
        % Check in which bin is the current pixel value
        val = imPatch(i,j);
        bin = ceil(val*Nbins/255);
        if(bin==0)
            bin = 1;
        end
        % Compute the weight
        weights(i,j) = ratio(bin);
    end
end

