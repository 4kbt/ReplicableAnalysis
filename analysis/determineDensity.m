massDiff
plasticMass

tareMass = meanWetPlastic - meanPlastic;
tareMassErr = sqrt(stdWetPlastic^2+stdPlastic^2);

waterMass = meanWater - tareMass;
waterMassErr = sqrt(stdWater^2 + tareMassErr^2);

cylVolume = pi * (cylDiameter / 2)^2 * cylLength;

relativeDensity = meanPlastic/waterMass

waterDensity = waterMass/cylVolume

cylDiameterErr = sqrt(cylDiameterMeasurementErr^2 + ...
		      cylDiameterFabricationErr^2);

cylLengthErr = sqrt(cylLengthMeasurementErr^2 + ...
                    cylLengthFabricationErr^2);

cylVolumeErr = sqrt(  (pi * cylLength * cylDiameter * cylDiameterErr)^2 + ...
		      (pi * (cylDiameter/2)^2 * cylLengthErr)^2 );

printSIErr( cylVolume, cylVolumeErr, 2, 0, 'm$^{3}$', [HOMEDIR '/extracted/cylVolume.tex']);


waterDensityErr = sqrt( ( waterMass/cylVolume^2 * cylVolumeErr )^2 + ...
			( waterMassErr/cylVolume) ^2 );

printSIErr( waterDensity, waterDensityErr, 2, 3, 'g/m$^{3}$', [HOMEDIR '/extracted/waterDensity.tex']);
