% create phantom
tic
%V_exact = phantom(256);
file = load('C:\Users\tanma\OneDrive\Documents\MATLAB\project\May7-May13\walnut.mat');
volume  = file.V;
V_exact = double(volume(:,:,105));
figure(1); imshow(V_exact, []);

% create geometries and projector
proj_geom = astra_create_proj_geom('parallel', 1.0, 256, linspace2(0,pi,180));
vol_geom = astra_create_vol_geom(400,296);
proj_id = astra_create_projector('linear', proj_geom, vol_geom);

% create forward projection
[sinogram_id, sinogram] = astra_create_sino(V_exact, proj_id);
figure(2); imshow(sinogram, []);

% reconstruct
recon_id = astra_mex_data2d('create', '-vol', vol_geom, 0);
cfg = astra_struct('SART');
cfg.ProjectorId = proj_id;
cfg.ProjectionDataId = sinogram_id;
cfg.ReconstructionDataId = recon_id;
sart_id = astra_mex_algorithm('create', cfg);
astra_mex_algorithm('iterate', sart_id, 5000);
V = astra_mex_data2d('get', recon_id);
figure(3); imshow(V, []);

% garbage disposal
astra_mex_data2d('delete', sinogram_id, recon_id);
astra_mex_projector('delete', proj_id);
astra_mex_algorithm('delete', sart_id);
toc
ssimval=ssim(V,V_exact);
fprintf('The SSIM value is %0.4f.\n',ssimval);
%imwrite(V,'sart.png');