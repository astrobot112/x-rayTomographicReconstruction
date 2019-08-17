file = load('C:\Users\tanma\OneDrive\Documents\MATLAB\project\May7-May13\walnut.mat');
volume  = file.V;
P1 = double(volume(:,:,105));
P = P1(1:256,1:256);
figure(1); imshow(P, []);
R = radon(P,0:179);
figure(2); imshow(R, []);

In11 = iradon(R,0:179,'nearest','none');
In1 = In11(2:257,2:257);
figure(3); imshow(In1, []);
ssimval1=ssim(In1,P);
fprintf('The SSIM value of In1 is %0.4f.\n',ssimval1);

In21 = iradon(R,0:179,'nearest','Ram-Lak');
In2 = In21(2:257,2:257);
figure(4); imshow(In2, []);
ssimval2=ssim(In2,P);
fprintf('The SSIM value of In2 is %0.4f.\n',ssimval2);

In31 = iradon(R,0:179,'nearest','Shepp-Logan');
In3 = In31(2:257,2:257);
figure(5); imshow(In3, []);
ssimval3=ssim(In3,P);
fprintf('The SSIM value of In3 is %0.4f.\n',ssimval3);

In41 = iradon(R,0:179,'nearest','Cosine');
In4 = In41(2:257,2:257);
figure(6); imshow(In4, []);
ssimval4=ssim(In4,P);
fprintf('The SSIM value of In4 is %0.4f.\n',ssimval4);

In51 = iradon(R,0:179,'nearest','Hamming');
In5 = In51(2:257,2:257);
figure(7); imshow(In5, []);
ssimval5=ssim(In5,P);
fprintf('The SSIM value of In5 is %0.4f.\n',ssimval5);

In61 = iradon(R,0:179,'nearest','Hann');
In6 = In61(2:257,2:257);
figure(8); imshow(In6, []);
ssimval6=ssim(In6,P);
fprintf('The SSIM value of In6 is %0.4f.\n',ssimval6);
