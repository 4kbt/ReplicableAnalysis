%UNBLIND HERE
cylDiameter = 1.25*0.0254;
cylDiameterMeasurementErr = 0.002*0.0254; %expected
printSIErr( cylDiameter, cylDiameterMeasurementErr, 2, -3, 'm', [HOMEDIR '/extracted/cylDiameter.tex'] );

cylDiameterFabricationErr = 1e-3*0.0254; %determined by dial indicator
printSI(cylDiameterFabricationErr, 1, -3, 'm', [HOMEDIR '/extracted/cylDiameterFabricationErr.tex']);

%UNBLIND HERE
cylLength = 2.6 * 0.0254; 
cylLengthMeasurementErr = 0.002*0.0254; %expected 
printSIErr( cylLength, cylLengthMeasurementErr, 2, -3, 'm', [HOMEDIR '/extracted/cylLength.tex'] );

cylLengthFabricationErr = sqrt(2)*1.5e-3*0.0254; %determined by dial indicator
printSI(cylLengthFabricationErr, 1, -3, 'm', [HOMEDIR '/extracted/cylLengthFabricationErr.tex']);

scaleToSI = 0.001;

calibrationMass = 0.2;
%expected variation for parsing the measurements, not the standard's accuracy
calibrationMassVar = 0.0005; 

%a mass between the wet plastic and water measurements to separate them.
weightCut = 0.24;

nBootstrap = 10000;


%code stuff
DiffWeightColumn = 5;
