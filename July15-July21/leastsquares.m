[fval,exitflag,output,x,Y2] = runqpbox4;
im = reshape(x,100,100);
figure(1); imshow(im);
im1=phantom(100);
val = ssim(im,im1);