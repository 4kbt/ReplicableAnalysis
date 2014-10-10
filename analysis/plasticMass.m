d = load( [HOMEDIR '/parsedData/plasticWeighing.dat']);

experimentalConstants

%To SI!
d = d*scaleToSI;

w = weigh(d, calibrationMass, calibrationMassVar);

%cull non-measurements
w = w( max(abs(w')) < 1e80 ,:);

'bootstrapping plastic mass'

[meanPlastic stdPlastic plasticMeanDistribution] = bootstrapMean(w(:,DiffWeightColumn), nBootstrap);

printSIErr( meanPlastic, stdPlastic, 2, 0, 'g', [HOMEDIR '/extracted/meanPlasticStatistical.tex']);

%a lack of noise is a bad thing
if(stdPlastic < 1e-6)
	stdPlastic = scaleResolution; %minimum resolution of the scale
end

[plasticN, plasticX] = hist( plasticMeanDistribution, sqrt(nBootstrap));

plasticHistOut = [plasticX' plasticN'];
save 'extracted/plasticHistOut.dat' plasticHistOut

