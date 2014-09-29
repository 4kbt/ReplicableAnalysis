%This would be an octaverc file somewhere, if not for various path handling bugs
%Debian's octave packaging arrives as a system-wide octaverc file, which 
%pre-empts any octave -p calls at the command line.

HOMEDIR

setenv("HOMEDIR", HOMEDIR);

tpath = [HOMEDIR '/mlib/'];
addpath(genpath(tpath));
