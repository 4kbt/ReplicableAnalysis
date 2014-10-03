d = load( [HOMEDIR '/parsedData/plasticWeighing.dat']);

experimentalConstants

%To SI!
d = d*scaleToSI;

w = weigh(d, calibrationMass, calibrationMassVar);

%cull non-measurements
w = w( max(abs(w')) < 1e80 ,:);

'bootstrapping plastic mass'

[mPM sPM plasticMeanDistribution] = bootstrapMean(w(:,DiffWeightColumn), nBootstrap);


