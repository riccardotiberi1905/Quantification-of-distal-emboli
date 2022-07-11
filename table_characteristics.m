function [stats_bin, NumTrombosActualizado, stats_below_500, stats500, stats800, stats1000, Circumference] = table_characteristics(BIN1,BW11)
%Initial number of thrombi detected by the algorithm
label = bwlabel(BW11);
label_bin = bwlabel(BIN1);
NumTrombos = max(max(label));
NumTrombos_bin = max(max(label_bin));
bw = bwareafilt(BW11,NumTrombos);
bw_bin = bwareafilt(BIN1,NumTrombos_bin);

%Table that shows the major- and minor axis length + area for each element
stats = sortrows(regionprops('table',bw, 'MajorAxisLength','MinorAxisLength', 'Area'));
stats_bin = sortrows(regionprops('table',bw_bin, 'MajorAxisLength','MinorAxisLength', 'Area'));
LongLinea = (max(stats.MajorAxisLength) + max(stats.MinorAxisLength))/2;
Circumference = max(stats.MajorAxisLength);

%Conversion pixel - 1um
Conversion = (.8*10^4/LongLinea);

%MajorAxisLength de un pixel
a_pixel = 1.154700538379252;

%We convert area, MIL and MAL from pixel units to um units
for i=1:NumTrombos_bin
    stats_bin.MajorAxisLength(i) = stats_bin.MajorAxisLength(i)*Conversion;
    stats_bin.MinorAxisLength(i) = stats_bin.MinorAxisLength(i)*Conversion;
    stats_bin.Area(i) = stats_bin.Area(i)*pi*(a_pixel*Conversion)^2;
end

%We eliminate each thrombi with a major axis length <100um
toDelete = stats_bin.MajorAxisLength < 100; %Elimina todos los trombos menores a 100 micras
stats_bin(toDelete,:) = [];

%The following table shows the updated number of thrombi
NumTrombosActualizado = height(stats_bin);

%We create another table with only values for MAL >500um
stats_below_500 = stats_bin(stats_bin.MajorAxisLength < 500,:);

%We create another table with only values for MAL >500um
stats500 = stats_bin(stats_bin.MajorAxisLength > 500,:);

%We create another table with only values for MAL >800um
stats800 = stats_bin(stats_bin.MajorAxisLength > 800,:);

%We create another table with only values for MAL >1000um
stats1000 = stats_bin(stats_bin.MajorAxisLength > 1000,:);
end

