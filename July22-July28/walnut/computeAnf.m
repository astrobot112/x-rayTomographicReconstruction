function [A,f] = computeAnf
N = 100;
angl = 0:180;
p = 145;
name = 'C:\Users\tanma\OneDrive\Documents\MATLAB\project\May7-May13\walnut.mat';
A1 = paralleltomo(N,'blank',angl,p);
A = A1;
im1 = load(name);
volume  = im1.V;
im2 = double(volume(:,:,105));
testIm = im2(1:100,1:100);
b = radon(testIm,angl);
b = b(:);
y1 = (-2)*transpose(b)*A1;
f = transpose(y1);
end