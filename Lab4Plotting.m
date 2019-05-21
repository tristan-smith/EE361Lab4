% Lab4Plotting

load('Lab4Distances.mat');
load('Lab4Angles.mat');

peaks = [-20, -20, -25, -29, -20, -15, -11, -7, -20, -20, -30, -20, -10, -10, -5, -2, 0];

gains = [38.6, 38.6, 38.6, 38.6, 38.6, 38.6, 38.6, 38.6, 19.7, 19.7, 19.7, 19.7, 19.7, 19.7, 19.7, 19.7, 19.7];

actualPeaks = peaks + gains;

[sortedDistances, indexes] = sort(distances);

sortedActualPeaks(indexes) = actualPeaks;
sortedAngles(indexes) = angles;

figure(1);
plot(sortedDistances,sortedActualPeaks);
title('Peak Values v.s. Distance From Foxhunt');
ylabel('Peak Values (dB)');
xlabel('distance (meters)');
grid on;

[hlowSortedPeaks,indexes] = sort(actualPeaks);

figure(2);
stem(hlowSortedPeaks, sortedAngles(indexes));
title('Peak Values v.s. Angle to Transmitter');
ylabel('Angle to target (\circ)');
xlabel('Peak Values (dB)');
grid on;