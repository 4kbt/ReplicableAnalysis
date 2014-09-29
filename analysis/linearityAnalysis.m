d = load([HOMEDIR '/parsedData/screwLinearityTest.dat']);

p = polyfit(d(:,1), d(:,2), 1); 


fitVals =  polyval(p,d(:,1));
residuals = d(:,2) - fitVals;

linFit = [ d fitVals residuals ];

fitSlope = p(1);
fitOffset = p(2); 
