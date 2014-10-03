function [m s ms] = bootstrapMean(data, n)

	ms = [];

	for ctr = 1:n
		ms = [ms; mean(bootstrapData(data))];
	end

	m = mean(ms);
	s = std(ms); 
end

%!test
%! o = ones(100,1);
%! n = 100;
%! [m s] = bootstrapMean(o, n);
%! assert(size(m) == [1 1]);
%! assert(m == 1);
%! assert(s == 0);

%!test
%! r = randn(100,1);
%! n = 100;
%! [m s] = bootstrapMean(r , n )
%! assert(abs(m) < 0.5); %these are super conservative!
%! assert(s < 0.5); % these are super conservative!
