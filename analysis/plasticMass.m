d = load( [HOMEDIR '/parsedData/plasticWeighing.dat']);

experimentalConstants

%To SI!
d = d*scaleToSI;

w = weighMe(d, calibrationMass, calibrationMassVar);

%cull non-measurements
w = w( max(abs(w')) < 1e80 ,:);

mPM = mean(w(:,5));
sPM = std (w(:,5)); 
