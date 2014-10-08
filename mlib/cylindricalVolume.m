function [V Ve] = cylindricalVolume( d, de, l, le)

	%Volume
	V = pi * (d/2)^2 * l; 

	Ve = sqrt( 
		(pi * (d / 2)^2 * le) ^2  +
		(pi * d * de * l )^2
		);

end

%!test
%! [v e] = cylindricalVolume( 1, 0 , 1, 0 );
%! assert(v == ( pi / 4) )
%! assert(e == 0)

%!test
%! [v,e] = cylindricalVolume( 1, 0.1, 1, 0.1);
%! assert(v == ( pi / 4) )
%! assert(e = sqrt( (pi/4*0.1)^2 + (pi*.1)^2) )  
