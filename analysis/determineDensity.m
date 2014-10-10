massDiff
plasticMass

% Volume Determination
cylVolume = pi * (cylDiameter / 2)^2 * cylLength;

cylDiameterErr = sqrt(cylDiameterMeasurementErr^2 + ...
		      cylDiameterFabricationErr^2);

cylLengthErr = sqrt(cylLengthMeasurementErr^2 + ...
                    cylLengthFabricationErr^2);

printSI(cylDiameterErr, 2, -6, 'm', [HOMEDIR '/extracted/cylDiamErr.tex'  ]);
printSI(cylLengthErr,   2, -6, 'm', [HOMEDIR '/extracted/cylLengthErr.tex']);

%Thermal expansion of block
ThermVolumeErr = thermalExpansionError(cylVolume, plasticExpansionCoefficient, 4);
printSigNumber(ThermVolumeErr/cylVolume, [HOMEDIR '/extracted/ThermVolumetricExpansion.tex'], 1);

cylVolumeErr = sqrt(  (pi * cylLength * cylDiameter * cylDiameterErr)^2 + ...
		      (pi * (cylDiameter/2)^2 * cylLengthErr)^2 + ... 
			ThermVolumeErr^2 );

printSIErr( cylVolume, cylVolumeErr, 2, 0, 'm$^{3}$', [HOMEDIR '/extracted/cylVolume.tex']);

%%%% Uncertainties:
%Dissolved solids
%500 mg/L
dissolvedSolidsMass = 0.5e-3*0.1; %overestimate. 
printSI(dissolvedSolidsMass, 1, -3,'g', [HOMEDIR '/extracted/dissolvedSolidsMass.tex']);

%Calibration-mass buoyancy uncertainty
calBuoyShift = calMassVolume * airDensity / calibrationMass;
printSigNumber(calBuoyShift , [HOMEDIR '/extracted/calBuoyShift.tex'],1); 
plasticCalBuoyErr = meanPlastic * calBuoyShift;
printSI(plasticCalBuoyErr, 1, -3, 'g', [HOMEDIR '/extracted/plasticCalBuoyErr.tex']);

%Plastic buoyancy correction
plasticBuoyMass = cylVolume * airDensity;
printSI(plasticBuoyMass , 2, -3, 'g', [HOMEDIR '/extracted/plasticBuoyMass.tex']); 


%Water mass determination
meanPlasticErr = sqrt( stdPlastic^2 + plasticCalBuoyErr^2 + plasticBuoyMass^2 +...
			 autoZeroing^2 + scaleNonlinearity^2);
meanWetPlasticErr = sqrt(  stdWetPlastic^2 + autoZeroing^2 + scaleNonlinearity^2);

tareMass = meanWetPlastic - meanPlastic;
tareMassErr = sqrt( meanWetPlasticErr^2 + meanPlasticErr^2);

printSIErr(meanPlastic, meanPlasticErr, 2, 0, 'g', [HOMEDIR '/extracted/meanPlastic.tex']);


waterMass = meanWater - tareMass;

%Water calibration-mass buoyancy correction
waterCalBuoyErr = waterMass * calBuoyShift * sqrt(2); %2 from subtraction
printSI(waterCalBuoyErr, 1, -3, 'g', [HOMEDIR '/extracted/waterCalBuoyErr.tex']);

waterMassErr = sqrt(stdWater^2 + tareMassErr^2 + 2*( autoZeroing^2 + scaleNonlinearity^2) ...
			+ dissolvedSolidsMass^2 + waterCalBuoyErr^2 );

printSIErr(waterMass, waterMassErr, 2, 0, 'g', [HOMEDIR '/extracted/waterMass.tex']);


%Density determination
relativeDensity = meanPlastic/waterMass

waterDensity = waterMass/cylVolume

waterDensityErr = sqrt( ( waterMass/cylVolume^2 * cylVolumeErr )^2 + ...
			( waterMassErr/cylVolume) ^2 );

printSIErr( waterDensity, waterDensityErr, 2, 3, 'g/m$^{3}$', [HOMEDIR '/extracted/waterDensity.tex']);
