d = load( [HOMEDIR '/parsedData/plasticWeighing.dat']);

experimentalConstants
FixedParameters

%To SI!
d = d*scaleToSI;

w = weigh(d, calibrationMass, calibrationMassVar);

%cull non-measurements
w = w( max(abs(w')) < 1e80 ,:);

[mPM sPM] = bootstrapMean(w(:,DiffWeightColumn), nBootstrap);


