experimentalConstants

airDensity = 1; 
airDensityErr = 0.1;


%Buoyancy Shifts  (be careful with calibration mass shift sign)
calMassBuoyancy      = airDensity * calMassVolume;
plasticMassBuoyancy  = airDensity * cylVolume; 

calMassBuoyancyErr     = sqrt(
				(airDensity    * calMassVolumeErr)^2 +
				(airDensityErr * calMassVolume^2 ) );
plasticMassBuoyancyErr = sqrt(
				(airDensity    * cylVolumeErr)^2 +
				(airDensityErr * cylVolume^2 ) );
