im = load('projections_okra.mat');
im_org = load('okra_2D.mat');
testIm = im_org.testIm;
figure(1); imshow(testIm);
N = im.dim(1);
angl = im.idx1;
k = 10000; k1 = 3;
p = size(im.proj,1); % p is No. of rays i.e., no. of rows in proj matrix
[A,b1,x] = paralleltomo(N,'blank',angl,p);
b = im.proj(:);
x0 = zeros(N*N,1);
fprintf(1,'Perform k = %2.0f iterations with Kaczmarz''s method.\n',k1);
tic
Xart = kaczmarz(A,b,k1,x0,'NCP');
toc
im_art = reshape(Xart,N,N); 
figure(2); imshow(im_art);
ssimval=ssim(im_art,testIm);
fprintf('SSIM ART %0.4f.\n',ssimval);

fprintf(1,'Perform k = %2.0f iterations with Landweber''s method.\n',k);
tic
Xland = landweber(A,b,k,x0,'NCP');
toc
im_sirt = reshape(Xland,N,N); 
figure(3); imshow(im_sirt);
ssimval=ssim(im_sirt,testIm);
fprintf('SSIM SIRT %0.4f.\n',ssimval);

fprintf(1,'Perform k = %2.0f iterations with SART method.\n',k);
tic
Xsart = sart(A,b,k,x0,'NCP');
toc
im_sart = reshape(Xsart,N,N); 
figure(4); imshow(im_sart);
ssimval=ssim(im_sart,testIm);
fprintf('SSIM SART %0.4f.\n',ssimval);