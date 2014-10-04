% Functions taken from Selected Procedures for Volumetric Calibrations (2013) by Georgia L. Harris
% www.nist.gov/pml/wmd/labmetrology/upload/NISTIR-7383-2013-04-24.pdf

function [p e] = temperatureDensity(T)

	a1 = -3.983035;
	a2 = 301.797;
	a3 = 522528.9;
	a4 = 69.34881;
	a5 = 999.974950;

	p = a5*( 1-
		 ( (T+a1).^2 .* ( T + a2) ) ./
		 ( a3 * (T + a4) )
		);

%air-saturation, valid between 0 and 40 C
	ds = 1e-3*(-4.612) + 1e-3*0.106*T;

	p = p + ds;


%uncertainty
	e = (0.8394 - 0.00128*T + 0.000110* T.^2 - 0.00000609 * T.^3 + ...
		0.000000116 * T.^4 ) * 1e-3;
	
end

%!test
%! format long 
%! [p e] = temperatureDensity( 10 );
%! assert( abs(p - 0.99969915 * 1e3) < e)
%! assert( abs(e - 0.00000083 * 1e3 ) < ( 0.00000001 * 1e3) )
%! [p e] = temperatureDensity( 25 );
%! assert( abs(p - 0.99704506 * 1e3) < e)
%! assert( abs(e - 0.00000083 * 1e3 ) < ( 0.00000001 * 1e3) )
