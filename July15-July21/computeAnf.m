function [A,f] = computeAnf
N = 100;
angl = 1:6.5:180;
p = 145;
A1 = paralleltomo(N,'blank',angl,p);
A = A1;
im = phantom(100);
b = radon(im,angl);
b = b(:);
y1 = (-2)*transpose(b)*A1;
f = transpose(y1);
end