%Hands back the uncertainty on V given an expansion coefficient and a single-sided temperature uncertainty
function Ve = thermalExpansionError(V, expansionCoeff, tempRange)
	l = V^(-1/3);
	LP = l * (1 + expansionCoeff * tempRange ) ;
	LM = l * (1 - expansionCoeff * tempRange ) ;
	VP = LP^3;
	VM = LM^3;

	%Simple uncertainty estimate
	Ve = mean( abs([(VP - V)  (VM - V) ] ) );
	
end

%!test
%! assert(thermalExpansionError(1, 0, 100) == 0);


%!test
%! a = 0.0000001;
%! ve = thermalExpansionError(1, a, 1);
%! assert( abs(ve / a - 3 ) < 1e-4)
