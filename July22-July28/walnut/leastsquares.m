[fval,exitflag,output,x,Y2] = runqpbox4;
im = reshape(x,100,100);
figure(1); imagesc(im), colormap gray, axis image off;
name = 'C:\Users\tanma\OneDrive\Documents\MATLAB\project\May7-May13\walnut.mat';
im1 = load(name);
volume  = im1.V;
im2 = double(volume(:,:,105));
testIm = im2(1:100,1:100);
val = ssim(im,testIm);