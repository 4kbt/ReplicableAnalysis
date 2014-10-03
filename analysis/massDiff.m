experimentalConstants

d = load([HOMEDIR '/parsedData/waterWeighing.dat']);

%to SI units, of course!
d = d/1000;

w = weigh(d, calibrationMass, calibrationMassVar);

%cull non-measurements
w = w( max(abs(w')) < 1e80 ,:);

withPlastic = w( w(:,DiffWeightColumn) > weightCut,:);
withWater   = w( w(:,DiffWeightColumn) < weightCut,:);

'bootstrapping mass differences'

[meanWater stdWater waterDistribution] = bootstrapMean(withWater(:,DiffWeightColumn), nBootstrap);

[waterN, waterX] = hist( waterDistribution, nBootstrap);

[meanWetPlastic stdWetPlastic wetPlasticDistribution] = bootstrapMean(withPlastic(:,DiffWeightColumn), nBootstrap);

[wetPlasticN, wetPlasticX] = hist( wetPlasticDistribution, nBootstrap);
