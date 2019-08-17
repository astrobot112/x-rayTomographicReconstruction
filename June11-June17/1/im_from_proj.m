im = load('projections_okra.mat');
dimX = im.dim(1);
dimY = im.dim(2);
proj = im.proj;
angl = im.idx1;

p = size(proj,1); % p is No. of rays i.e., no. of rows in proj matrix
[A,bl,x] = paralleltomo(dimX,'blank',angl,p);
b = proj(:); N = dimX;

figure(1), clf
subplot(2,3,1)
imagesc(reshape(x,N,N)), colormap gray, axis image off
c = caxis;
title('Exact phantom')

% No. of iterations.
k = 50;

fprintf(1,'\n\n');
fprintf(1,'Perform k = %2.0f iterations with Landweber''s method.\n',k);

% Perform the landweber iterations.
Xland = landweber(A,b,k);

% Show the landweber solution.
subplot(2,3,2)
imagesc(reshape(Xland,N,N)), colormap gray, axis image off
caxis(c)
title('Landweber')

fprintf(1,'Perform k = %2.0f iterations with Cimmino''s method.\n',k);

% Perform the cimmino iterations.
Xcimp = cimmino(A,b,k);

% Show the cimmino solution.
subplot(2,3,3)
imagesc(reshape(Xcimp,N,N)), colormap gray, axis image off
caxis(c)
title('Cimmino')

fprintf(1,'Perform k = %2.0f iterations with the CAV method.\n',k);

% Perform the CAV iterations.
Xcav = cav(A,b,k);

% Show the CAV solution.
subplot(2,3,4)
imagesc(reshape(Xcav,N,N)), colormap gray, axis image off
caxis(c)
title('CAV')

fprintf(1,'Perform k = %2.0f iterations with the DROP method.\n',k);

% Perform the DROP iterations.
Xdrop = drop(A,b,k);

% Show the DROP solution.
subplot(2,3,5)
imagesc(reshape(Xdrop,N,N)), colormap gray, axis image off
caxis(c)
title('DROP')

fprintf(1,'Perform k = %2.0f iterations with the SART method.\n',k);

% Perform the SART iterations.
Xsart = sart(A,b,k);

% Show the SART solution.
subplot(2,3,6)
imagesc(reshape(Xsart,N,N)), colormap gray, axis image off
caxis(c)
title('SART')

%%---- ASTRA Toolbox ---%
%vol_geom = astra_create_vol_geom(N, N);
%proj_geom = astra_create_proj_geom('parallel', 1.0, 384, linspace2(0,pi,180));

% For CPU-based algorithms, a "projector" object specifies the projection
% model used. In this case, we use the "strip" model.
%proj_id = astra_create_projector('strip', proj_geom, vol_geom);

% We now re-create the sinogram data object as we would do when loading
% an external sinogram
%sinogram_id = astra_mex_data2d('create', '-sino', proj_geom, b);

% Create a data object for the reconstruction
%rec_id = astra_mex_data2d('create', '-vol', vol_geom);

% Set up the parameters for a reconstruction algorithm using the CPU
% The main difference with the configuration of a GPU algorithm is the
% extra ProjectorId setting.
%cfg = astra_struct('SIRT');
%cfg.ReconstructionDataId = rec_id;
%cfg.ProjectionDataId = sinogram_id;
%cfg.ProjectorId = proj_id;

% Available algorithms:
% ART, SART, SIRT, CGLS, FBP


% Create the algorithm object from the configuration structure
%alg_id = astra_mex_algorithm('create', cfg);

% Run 20 iterations of the algorithm
% This will have a runtime in the order of 10 seconds.
%astra_mex_algorithm('iterate', alg_id, 20);

% Get the result
%rec = astra_mex_data2d('get', rec_id);
%figure(3); imshow(rec, []);

% Clean up. 
%astra_mex_projector('delete', proj_id);
%astra_mex_algorithm('delete', alg_id);
%astra_mex_data2d('delete', rec_id);
%astra_mex_data2d('delete', sinogram_id);

%ssimval=ssim(rec,P);
%fprintf('The SSIM value is %0.4f.\n',ssimval);