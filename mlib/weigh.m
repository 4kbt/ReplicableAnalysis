% a simple but robust weighing system, compares calibration and target data to the most recent calibration measurement. Not perfect, but functional. 
% This method will fail badly if the calibration mass and the mass to be weighed
% are within calTol of one another.

function weighings = weigh(data, calMass, calTol)

%simple sanity check
if (columns(data) ~= 1)
	error('weighing data misshapen');
end

%Crude error-flagging
lastZero = -1e90;
lastCal = -1e90;

weighings = [];

	for i = 1:rows(data);
	
		w = data(i);
	
		if( abs( w ) < calTol) 
			lastZero = data(i);
		else
		if( abs( w - calMass ) < calTol )
			lastCal  = w ; 
		else
			weighings = [ weighings; 
			     lastZero lastCal w (lastCal-lastZero) (w - lastZero)];	
		end
	end
end

%!test
% d = [0; 10 ; 0; 20; 0];
% w = weigh(d, 10, 0.1);
% expected = [ 0 -1e90  0 -1e90  0 ;
%              0    10 20    10 20];
% assert(w == expected)
