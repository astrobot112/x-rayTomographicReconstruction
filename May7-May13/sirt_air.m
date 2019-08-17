%DEMO_SIRT  Demonstrates the use of, and results from, SIRT methods
%
% This script illustrates the use of the SIRT methods landweber,
% cimmino, cav, drop, and sart.
%
% The script creates a parallel-beam CT test problem and solves it with the
% SIRT methods. The exact solution and the results from the methods are shown.
%
% See also: demo_art, demo_constraints, demo_custom_all, demo_matrixfree,
% demo_relaxpar, demo_stoprules, demo_training.

% Code written by: Per Christian Hansen, Jakob Sauer Jorgensen, and 
% Maria Saxild-Hansen, 2010-2017.

% This file is part of the AIR Tools II package and is distributed under
% the 3-Clause BSD License. A separate license file should be provided as
% part of the package. 
% 
% Copyright 2017 Per Christian Hansen, Technical University of Denmark and
% Jakob Sauer Jorgensen, University of Manchester.

clear, clc
fprintf(1,'Starting demo_sirt:\n\n');

% Set the parameters for the test problem.
N = 50;           % The discretization points.
theta = 0:5:179;  % No. of used angles.
p = 75;           % No. of parallel rays.
x0=zeros(N*N,1);
k = 500;

% Create the test problem.
[A,b,x] = paralleltomo(N,theta,p);
% Show the exact solution
figure(1),
imshow(reshape(x,N,N));

Xsirt = sirt('sart',A,b,k,x0);

% Show the landweber solution.
figure(2),
imshow(reshape(Xsirt,N,N));

