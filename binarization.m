function [A, BW11, BIN1, iso] = binarization(I,rectangle)
Ig = rgb2gray(I);
J = imcrop(Ig,rectangle);
H = imadjust(J,stretchlim(J),[0.35 0.65]);
iso = isodataAlgorithm(H);
if iso > 160
   iso = 75;
end
BW1 = imbinarize(Ig, iso/256);
BW11 = imcomplement(BW1);
BIN = imbinarize(J, iso/256);
BIN1 = imcomplement(BIN);
figure
A = imshowpair(J, BIN1,'montage');
title('Gray image vs binary cropped image')
end

