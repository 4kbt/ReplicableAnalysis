d = load([HOMEDIR '/parsedData/waterWeighing.dat']);

%to SI units, of course!
d = d/1000;

plot(d)


calibrationMass = 0.2;
%expected variation for parsing the measurements, not the standard's accuracy
calibrationMassVar = 0.0005; 


w = weighMe(d, calibrationMass, calibrationMassVar);

%cull non-measurements
w = w( max(abs(w')) < 1e80 ,:);

weightCut = 0.24; 

withPlastic = w( w(:,5) > weightCut,:);
withWater   = w( w(:,5) < weightCut,:);

mP = mean(withPlastic(:,5));
mW = mean(withWater(:,5));
sP = std( withPlastic(:,5));
sW = std( withWater(:,5));



