function [ cd ] = color_distribution( imagePatch, m )
% This Function was created by Mohit Kumar Ahuja for Visual Tracking Lab.
% Submtted to: Dr. Desire

cd = zeros(1,m);
c = round([size(imagePatch,1)/2, size(imagePatch,2)/2]);

% Compute distances
for i = 1:size(imagePatch,1)
    for j = 1:size(imagePatch,2)
        dist(i,j) = sqrt((i-c(1))^2 + (j-c(2))^2);
    end
end

% Normalize the distances
dist = dist./max(max(dist));

% Build histogram and weight with the kernel
for i = 1:size(imagePatch,1)
    for j = 1:size(imagePatch,2)
        %Compute which bin is corresponding to the pixel value
        val = ceil(imagePatch(i,j)/255*m);
        %If it is zero, round to 1
        if(val == 0)
            val = 1;
        end
        % Epachnikov profile
        if(dist(i,j)^2 < 1)
            kE = 2/pi*(1-dist(i,j)^2);
        else
            kE = 0;
        end
        % Add the kernel value to the bin
        cd(val) = cd(val)+kE;
    end
end

cd = cd./sum(sum(cd));

end

