%Plastic Cylinder Properties
%UNBLIND HERE
cylDiameter = 44.55e-3;
cylDiameterMeasurementErr = 0.05e-3; %expected
cylDiameterFabricationErr = 1e-3*0.0254; %determined by dial indicator

cylDiameterErr = sqrt(cylDiameterMeasurementErr^2 + cylDiameterFabricationErr^2);

printSI(cylDiameterFabricationErr, 1, -3, 'm', [HOMEDIR '/extracted/cylDiameterFabricationErr.tex']);
printSIErr( cylDiameter, cylDiameterErr, 2, -3, 'm', [HOMEDIR '/extracted/cylDiameter.tex'] );

%UNBLIND HERE
cylLength = 55.52e-3; 
cylLengthMeasurementErr = 0.05e-3; %expected 
cylLengthFabricationErr = sqrt(2)*1.5e-3*0.0254; %determined by dial indicator

cylLengthErr = sqrt(cylLengthMeasurementErr^2 + cylLengthFabricationErr^2);

printSI(cylLengthFabricationErr, 1, -3, 'm', [HOMEDIR '/extracted/cylLengthFabricationErr.tex']);
printSIErr( cylLength, cylLengthErr, 2, -3, 'm', [HOMEDIR '/extracted/cylLength.tex'] );


%Calibration Mass properties

calibrationMass = 0.2;
%expected variation for parsing the measurements, not the standard's accuracy
calibrationMassVar = 0.0005; 

%dimensions
calMassDiameter = 1.135*0.0254; calMassDiameterErr = calMassDiameter*0.2;
calMassLength =	1.782*0.0254;   calMassLengthErr   = 0.003*0.0254;
%diameter uncertainty is expanded because of molded handle.

%Conversion from balance readout (g) to SI (kg).
scaleToSI = 0.001;

%Volumes
[calMassVolume calMassVolumeErr] = cylindricalVolume( calMassDiameter,
						      calMassDiameterErr,
						      calMassLength,
						      calMassLengthErr);

[cylVolume cylVolumeErr] = cylindricalVolume( cylDiameter,
			   		      cylDiameterErr,
					      cylLength,
					      cylLengthErr);

%hack to make output correct
mm3Factor = 1e6;
printSIErr( cylVolume*mm3Factor, cylVolumeErr * mm3Factor,
		 2, -3, 'm$^{3}$', [HOMEDIR '/extracted/cylVolume.tex'] );
printSIErr( calMassVolume*mm3Factor, calMassVolumeErr * mm3Factor,
		 2, -3, 'm$^{3}$', [HOMEDIR '/extracted/calMassVolume.tex'] );

%uncertainty terms
airDensity = 1.225;
printSI(airDensity, 4, 3, 'g/m$^{3}$', [HOMEDIR '/extracted/airDensity.tex']);


plasticExpansionCoefficient = 150e-6;
printSigNumber(plasticExpansionCoefficient, [HOMEDIR '/extracted/plasticExpansionCoefficient.tex'], 2);

scaleResolution = 0.1e-3;
printSI(scaleResolution, 1, 0,'g', [HOMEDIR '/extracted/scaleResolution.tex']);

autoZeroing = 0.1e-3;
printSI(autoZeroing, 1, 0,'g', [HOMEDIR '/extracted/autoZeroing.tex']);

scaleNonlinearity = 0.1e-3;
printSI(scaleNonlinearity, 1,0,'g',[HOMEDIR '/extracted/scaleNonlinearity.tex']);

%%%% analysis parameters

%Conservative upper bound
hysteresisErr = 0.0001; 
printSI(hysteresisErr, 1, 0, 'g', [HOMEDIR '/extracted/hysteresisErr.tex']); 

%a mass between the wet plastic and water measurements to separate them.
weightCut = 0.24;

nBootstrap = 10000;


%code stuff
DiffWeightColumn = 5;
