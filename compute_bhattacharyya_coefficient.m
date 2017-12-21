function [ k ] = compute_bhattacharyya_coefficient(p,q)
% This Function was created by Mohit Kumar Ahuja for Visual Tracking Lab.
% Submtted to: Dr. Desire

k = sum(sqrt(p.*q));    % Bhattacharya Coefficient

end

