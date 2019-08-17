file = load('C:\Users\tanma\OneDrive\Documents\MATLAB\project\May7-May13\walnut.mat');
volume  = file.V;
P = double(volume(:,:,105));
figure(1); imshow(P, []);
R = radon(P,0:179);
figure(2); imshow(R, []);

Is11 = iradon(R,0:179,'spline','none');
Is1 = imresize(Is11,[400,296]);
figure(3); imshow(Is1, []);
ssimval1=ssim(Is1,P);
fprintf('The SSIM value of Is1 is %0.4f.\n',ssimval1);

Is21 = iradon(R,0:179,'spline','Ram-Lak');
Is2 = imresize(Is21,[400,296]);
figure(4); imshow(Is2, []);
ssimval2=ssim(Is2,P);
fprintf('The SSIM value of Is2 is %0.4f.\n',ssimval2);

Is31 = iradon(R,0:179,'spline','Shepp-Logan');
Is3 = imresize(Is31,[400,296]);
figure(5); imshow(Is3, []);
ssimval3=ssim(Is3,P);
fprintf('The SSIM value of Is3 is %0.4f.\n',ssimval3);

Is41 = iradon(R,0:179,'spline','Cosine');
Is4 = imresize(Is41,[400,296]);
figure(6); imshow(Is4, []);
ssimval4=ssim(Is4,P);
fprintf('The SSIM value of Is4 is %0.4f.\n',ssimval4);

Is51 = iradon(R,0:179,'spline','Hamming');
Is5 = imresize(Is51,[400,296]);
figure(7); imshow(Is5, []);
ssimval5=ssim(Is5,P);
fprintf('The SSIM value of Is5 is %0.4f.\n',ssimval5);

Is61 = iradon(R,0:179,'spline','Hann');
Is6 = imresize(Is61,[400,296]);
figure(8); imshow(Is6, []);
ssimval6=ssim(Is6,P);
fprintf('The SSIM value of Is6 is %0.4f.\n',ssimval6);
