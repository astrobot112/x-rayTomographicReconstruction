im = load('projections_okra.mat');
im_org = load('okra_2D.mat');
testIm = im_org.testIm;
figure(1); imshow(testIm);

N = im.dim(1);
angl = im.idx1;
p = size(im.proj,1); % p is No. of rays i.e., no. of rows in proj matrix

k = [10,50,90,130,150,190];
p1 = size(k,2);
ssim_art = zeros(p1,1);
ssim_sirt = zeros(p1,1);
ssim_sart = zeros(p1,1);

[A,b1,x] = paralleltomo(N,'blank',angl,p);
b = im.proj(:);

fprintf(1,'Perform k iterations with Kaczmarz''s method.\n');
tic
Xart = kaczmarz(A,b,k);
toc
for i = 1:p1
    x = Xart(:,i);
    im_art = reshape(x,N,N);
    ssim1 = ssim(im_art,testIm);
    ssim_art(i) = ssim1;
end
figure(2); plot(k,ssim_art);

fprintf(1,'Perform k iterations with Landweber''s method.\n');
tic
Xland = landweber(A,b,k);
toc
for i = 1:p1
    x = Xland(:,i);
    im_sirt = reshape(x,N,N);
    ssim1 = ssim(im_sirt,testIm);
    ssim_sirt(i) = ssim1;
end
figure(3); plot(k,ssim_sirt);

fprintf(1,'Perform k iterations with SART method.\n');
tic
Xsart = sart(A,b,k);
toc
for i = 1:p1
    x = Xsart(:,i);
    im_sart = reshape(x,N,N);
    ssim1 = ssim(im_sart,testIm);
    ssim_sart(i) = ssim1;
end
figure(4); plot(k,ssim_sart);