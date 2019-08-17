file = load('C:\Users\tanma\OneDrive\Documents\MATLAB\project\May7-May13\walnut.mat');
volume  = file.V;
P = double(volume(:,:,105));
figure(1); imshow(P, []);
R = radon(P,0:179);
figure(2); imshow(R, []);

Il11 = iradon(R,0:179,'linear','none');
Il1 = imresize(Il11,[400,296]);
figure(3); imshow(Il1, []);
ssimval1=ssim(Il1,P);
fprintf('The SSIM value of Il1 is %0.4f.\n',ssimval1);

Il21 = iradon(R,0:179,'linear','Ram-Lak');
Il2= imresize(Il21,[400,296]);
figure(4); imshow(Il2, []);
ssimval2=ssim(Il2,P);
fprintf('The SSIM value of Il2 is %0.4f.\n',ssimval2);

Il31 = iradon(R,0:179,'linear','Shepp-Logan');
Il3=imresize(Il31,[400,296]);
figure(5); imshow(Il3, []);
ssimval3=ssim(Il3,P);
fprintf('The SSIM value of Il3 is %0.4f.\n',ssimval3);

Il41 = iradon(R,0:179,'linear','Cosine');
Il4=imresize(Il41,[400,296]);
figure(6); imshow(Il4, []);
ssimval4=ssim(Il4,P);
fprintf('The SSIM value of Il4 is %0.4f.\n',ssimval4);

Il51 = iradon(R,0:179,'linear','Hamming');
Il5=imresize(Il51,[400,296]);
figure(7); imshow(Il5, []);
ssimval5=ssim(Il5,P);
fprintf('The SSIM value of Il5 is %0.4f.\n',ssimval5);

Il61 = iradon(R,0:179,'linear','Hann');
Il6=imresize(Il61,[400,296]);
figure(8); imshow(Il6, []);
ssimval6=ssim(Il6,P);
fprintf('The SSIM value of Il6 is %0.4f.\n',ssimval6);
