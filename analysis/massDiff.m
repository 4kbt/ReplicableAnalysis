experimentalConstants

d = load([HOMEDIR '/parsedData/waterWeighing.dat']);

%to SI units, of course!
d = d * scaleToSI;

w = weigh(d, calibrationMass, calibrationMassVar);

%cull non-measurements
w = w( max(abs(w')) < 1e80 ,:);

withPlastic = w( w(:,DiffWeightColumn) > weightCut,:);
withWater   = w( w(:,DiffWeightColumn) < weightCut,:);

'bootstrapping mass differences'

[meanWater stdWater waterDistribution] = bootstrapMean(withWater(:,DiffWeightColumn), nBootstrap);

printSIErr( meanWater, stdWater, 2, 0, 'g', [HOMEDIR '/extracted/waterDiff.tex']);

[waterN, waterX] = hist( waterDistribution, nBootstrap);

[meanWetPlastic stdWetPlastic wetPlasticDistribution] = bootstrapMean(withPlastic(:,DiffWeightColumn), nBootstrap);

printSIErr( meanWetPlastic, stdWetPlastic, 2, 0, 'g', [HOMEDIR '/extracted/wetPlasticDiff.tex']);

[wetPlasticN, wetPlasticX] = hist( wetPlasticDistribution, nBootstrap);
