name = 'C:\Users\tanma\OneDrive\Documents\MATLAB\project\May7-May13\walnut.mat';
im1 = load(name);
volume  = im1.V;
P = double(volume(:,:,105));
R = radon(P,0:2:178);
R1= R;
R1 = R1(:);
R2 = phantom(100);
figure(1); imshow(P);