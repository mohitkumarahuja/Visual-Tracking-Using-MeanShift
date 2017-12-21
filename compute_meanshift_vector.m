function [ z ] = compute_meanshift_vector(imPatch, prev_center, weights)
% This Function was created by Mohit Kumar Ahuja for Visual Tracking Lab.
% Submtted to: Dr. Desire

sz = floor(size(imPatch)/2);

% get array of coordinates
[x, y] = meshgrid(1:size(imPatch,2),1:size(imPatch,1));
x = x - sz(2) + prev_center(1);
y = y - sz(1) + prev_center(2);

% Compute new center of mass
z = [sum(sum(x.*weights)) sum(sum(y.*weights))]./sum(sum(weights));

% Add to previous center
z = round(z);% + prev_center);

end

