function [h, N, NumTrombosActualizado] = label_size_diagram(NumTrombosActualizado,stats_bin)
%Diagram that represents every labeled thrombus with its corresponding
%major axis length in um. The black ones represent the thrombi below
%200um. The red ones; below 500um. The green ones; below 100um. The blue
%ones; above 1000um.
figure
hold on
for i = 1:NumTrombosActualizado
    h = bar(i,stats_bin.MajorAxisLength(i));
    if (stats_bin.MajorAxisLength(i)) < 200
        set(h, 'FaceColor', 'k');
    elseif stats_bin.MajorAxisLength(i) < 500
        set(h,'FaceColor','r');
    elseif stats_bin.MajorAxisLength(i) < 1000
        set(h,'FaceColor','g' )
    else
        set(h,'FaceColor','b');
    end
end
title('Thrombi')
xlabel('Label (Thrombus)')
ylabel('Size (micrometers)')
hold off
hold off

N = [' A total of ',num2str(NumTrombosActualizado),' emboli were generated.'];
end

