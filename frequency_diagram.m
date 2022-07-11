function [T,plot, K, Big_3] = frequency_diagram(NumTrombosActualizado, stats_bin)
%Diagram that groups thrombi by their size
Small = 0;
Medium = 0;
Medium_1 = 0;
Medium_2 = 0;
Medium_3 = 0;
Medium_4 = 0;
Big = 0;
Big_1 = 0;
Big_2 = 0;
Big_3 = 0;
for i = 1:NumTrombosActualizado
    if stats_bin.MajorAxisLength(i) < 200
    Small = Small + 1;
    elseif stats_bin.MajorAxisLength(i) < 300
    Medium = Medium + 1;
    elseif stats_bin.MajorAxisLength(i) < 400
    Medium_1 = Medium_1 + 1;
    elseif stats_bin.MajorAxisLength(i) < 500
    Medium_2 = Medium_2 + 1;
    elseif stats_bin.MajorAxisLength(i) < 600
    Medium_3 = Medium_3 + 1;
    elseif stats_bin.MajorAxisLength(i) < 700
    Medium_4 = Medium_4 + 1;
    elseif stats_bin.MajorAxisLength(i) < 800
    Big = Big + 1;
    elseif stats_bin.MajorAxisLength(i) < 900
    Big_1 = Big_1 + 1;
    elseif stats_bin.MajorAxisLength(i) < 1000
    Big_2 = Big_2 + 1;
    else 
    Big_3 = Big_3 + 1;
    end
end
T = table(Small, Medium, Medium_1, Medium_2, Medium_3, Medium_4, Big, Big_1, Big_2, Big_3);
x = [Small, Medium, Medium_1, Medium_2, Medium_3, Medium_4, Big, Big_1, Big_2, Big_3];
Vector = [Medium_4(1,1) Medium_3(1,1) Medium_2(1,1) Medium_2(1,1) Medium_1(1,1) Medium(1,1) Big_3(1,1) Big_2(1,1) Big_1(1,1) Big(1,1) Small(1,1)];
Maximum = max(Vector) + 1;
figure
plot = bar(x, 0.4);
xticklabels({'100-200', '200-300', '300-400', '400-500', '500-600', '600-700', '700-800', '800-900', '900-1000', '>1000'});
title('Distal emboli distribution');
ylabel ('Number of fragments');
xlabel ('Feret Diameter (um)');
yticks(0:1:Maximum)
ylim([0 Maximum])

K = [' There are ',num2str(Big_3),' emboli larger than 1mm.'];
end

