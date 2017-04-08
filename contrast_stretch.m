function [Istretched,H] = contrast_stretch(I, percentiles)
if (~strcmp('uint8', class(I))) % validate input arg
error(' contrast_stretch only works with uint8 images');
end
if 1==nargin % default percentiles
percentiles = [ .05 .95 ]
end
N = length(I(:)); % total # of pixels
I = double(I); % many MATLAB functions don't work with uint8
H = histc(I(:), 0:255); % image histogram
% find the 2 bins that correspond to the specified percentiles
cutoffs = round(percentiles.* N)
CH = cumsum(H);
% lower bound
a = find(CH >= cutoffs(1))
a = a(1)-1; % remember, 0-based pixel values!
% upper bound
b = find(CH >= cutoffs(2));
b = b(1)-1;
% apply scaling function to each pixel
Istretched = I;
R = b-a; % dynamic range
scale = 255/R;
Istretched = round((I-a).* scale);
Istretched = uint8(Istretched);