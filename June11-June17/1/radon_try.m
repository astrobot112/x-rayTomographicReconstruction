file = load('C:\Users\tanma\OneDrive\Documents\MATLAB\project\May7-May13\walnut.mat');
volume  = file.V;
P1 = phantom(338);
P = P1(1:50,1:50);
R = radon(P,0:2:178);
R1= R;
R1 = R1(:);
figure(1); imshow(R);