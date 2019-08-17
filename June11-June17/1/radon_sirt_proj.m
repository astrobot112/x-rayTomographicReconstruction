file = load('C:\Users\tanma\OneDrive\Documents\MATLAB\project\May7-May13\walnut.mat');
volume  = file.V;
P1 = double(volume(:,:,105));
P = P1(1:50,1:50);
R = radon(P,0:2:178);
Rmin = min(R(:));
Rmax = max(R(:));
% Set the parameters for the test problem.
N = 50;           % The discretization points.
theta = 0:2:178;  % No. of used angles.
p = 75;           % No. of parallel rays.
name = 'C:\Users\tanma\OneDrive\Documents\MATLAB\project\May7-May13\walnut.mat';
fprintf(1,'Creating a parallel-beam tomography test problem\n');
fprintf(1,'with N = %2.0f, theta = %1.0f:%1.0f:%3.0f, and p = %2.0f.\n',...
    [N,theta(1),theta(2)-theta(1),theta(end),p]);

% Create the test problem.
[A,b,x] = paralleltomo(N,name,theta,p);
b1 = reshape(b,[75,90]);
bmin = min(b);
bmax = max(b);
Rb = R-b1;
figure(1); imshow(Rb);
Rb1 = Rb-min(Rb(:));
Rb1 = Rb1 ./ max(Rb1(:));
imwrite(Rb1, 'C:\Users\tanma\OneDrive\Documents\MATLAB\project\June11-June17\sirt_radon.png');