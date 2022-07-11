function [O,P,Q,R,S] = interesting_parameters(stats_bin,stats1000)
%Interesting parameters
Maximo = max(stats_bin.MajorAxisLength)*10^-3;
Minimo = min(stats_bin.MajorAxisLength)*10^-3;
Media = mean(stats_bin.MajorAxisLength)*10^-3;
Total_Area = (sum(stats_bin.Area))*10^-6;
Total_Area_1000 = (sum(stats1000.Area))*10^-6;

O = ['The largest emboli measures ',num2str(Maximo),' mm.'];
P = ['The shortest emboli measures ',num2str(Minimo),' mm.'];
Q = ['Average emboli size = ',num2str(Media),' mm.'];
R = ['Total area = ',num2str(Total_Area),' mm^2.'];
S = ['Total area of thrombi larger than 1mm = ',num2str(Total_Area_1000),' mm^2.'];
end

