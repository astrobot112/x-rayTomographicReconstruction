im = load('projections_okra.mat');
im_org = load('okra_2D.mat');
testIm = im_org.testIm;
figure(1); imshow(testIm);

N = im.dim(1);
angl = im.idx1;
p = size(im.proj,1); % p is No. of rays i.e., no. of rows in proj matrix

k1 = [1,3];
k = [34,35,36,37,38,39];
p1 = size(k,2); p2 = size(k1,2);
ssim_art = zeros(p2,1);
ssim_sirt = zeros(p1,1);
ssim_sart = zeros(p1,1);

[A,b1,x] = paralleltomo(N,'blank',angl,p);
b = im.proj(:);

fprintf(1,'Perform k1 iterations with Kaczmarz''s method.\n');
tic
options.lbound = 0;
Xart = kaczmarz(A,b,k1,[],options);
toc
for i = 1:p2
    x = Xart(:,i);
    im_art = reshape(x,N,N);
    if k1(i)==3
        figure(2); imshow(im_art);
    end
    ssim1 = ssim(im_art,testIm);
    ssim_art(i) = ssim1;
end
figure(3); plot(k1,ssim_art);

fprintf(1,'Perform k iterations with Landweber''s method.\n');
tic
options.lbound = 0;
Xland = landweber(A,b,k,[],options);
toc
for i = 1:p1
    x = Xland(:,i);
    im_sirt = reshape(x,N,N);
    if k(i)==38
        figure(4); imshow(im_sirt);
    end
    ssim1 = ssim(im_sirt,testIm);
    ssim_sirt(i) = ssim1;
end
figure(5); plot(k,ssim_sirt);

fprintf(1,'Perform k iterations with SART method.\n');
tic
options.lbound = 0;
Xsart = sart(A,b,k,[],options);
toc
for i = 1:p1
    x = Xsart(:,i);
    im_sart = reshape(x,N,N);
    if k(i)==39
        figure(6); imshow(im_sart);
    end
    ssim1 = ssim(im_sart,testIm);
    ssim_sart(i) = ssim1;
end
figure(7); plot(k,ssim_sart);