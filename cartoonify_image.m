%ELC 2023 (Sem 3): Cartoonify an Image using Computer Vision in MATLAB
% By: Gurjot Singh(102203582),Deevanshi(102203612),Aarushi Bajaj(102203820),Sarabjeet Singh(102203770)
clc;
clear all;

filename = 'aeroplane.jpeg';

% Prompt question: form of input
answer = questdlg('Do I fetch the image from local folder or webcam?', ...
    'Question', ...
	'Local image', 'Webcam', 'Local image');
% Handle response
switch answer
    case 'Local image'
        % Load images from local folder
        img = imread(filename);
    case 'Webcam'        
        % Get snapshot from webcam
        clear camera;
        cam = webcam();
        preview(cam)
        img = snapshot(cam);
        imshow(img);
        title('Input Image');
end

img = double(img);
a = 24;  % Quantization Factor
img_smooth = img;

%% Apply Median Filter to remove Salt and Pepper noise
img_smooth(:,:,1) = medfilt2(img(:,:,1),[7,7]);
img_smooth(:,:,2) = medfilt2(img(:,:,2),[7,7]);
img_smooth(:,:,3) = medfilt2(img(:,:,3),[7,7]);

%%
for i=1:3
    img_smooth = myBilateralFiltering(img_smooth,10,20,3);
end
filtered = img_smooth;

edges = edgedetector(img);
edges = edges/max(edges(:));
cartoon_img = filtered;

%%
for i = 1:3
    % Quantize the Values
    t = a*floor(filtered(:,:,i)./a);
    t(edges>0.18) = 0;
    cartoon_img(:,:,i) = t;
end

figure
subplot(1,3,3)
imshow(mat2gray(cartoon_img));
title('Cartoon')
subplot(1,3,1)
imshow(mat2gray(img));
title('Original')
subplot(1,3,2)
imshow(edges);
title('Edges')
clear cam;

function [filteredImage ]= myBilateralFiltering(corruptedImage,sd_sp,sd_int,windowSize)
[x,y] = meshgrid(-windowSize:windowSize,-windowSize:windowSize);
spaceGaussian = exp(-(x.^2+y.^2)/(2*(sd_sp^2)));
[ m, n,d ] = size(corruptedImage);

for i = 1:m
    for j = 1:n
        leftb = max(i-windowSize,1);
        rightb = min(i+windowSize,m);
        topb = max(j-windowSize,1);
        botb = min(j+windowSize,n);
        
        for k = 1:d      
            submatrix = corruptedImage(leftb:rightb,topb:botb,k);
            intensityGaussian = exp(-(corruptedImage(i,j,k)-submatrix).^2/(2*sd_int^2));
            weightMatrix = intensityGaussian.*spaceGaussian((leftb:rightb)-i+windowSize+1,(topb:botb)-j+windowSize+1);
            filteredImage(i,j,k) = sum(sum(weightMatrix.*submatrix))/sum(sum(weightMatrix));
        end
    end
end
end

function [edge] = edgedetector(input_img)
img = double(input_img);

R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
[Rx,Ry] = gradient(R);
[Gx,Gy] = gradient(G);
[Bx,By] = gradient(B);

% Sx = sqrt(Rx.^2+Gx.^2+Bx.^2);
% Sy = sqrt( Ry.^2+Gy.^2+By.^2);
% Sxy = sqrt(Rx.*Ry+Gx.*Gy+Bx.*By);
Sx = Rx.^2+Gx.^2+Bx.^2;
Sy = Ry.^2+Gy.^2+By.^2;
Sxy = Rx.*Ry+Gx.*Gy+Bx.*By;

D = sqrt(abs((Sx+Sy).^2-4*(1)*(Sx.*Sy-Sxy.^2))); % Discriminant of the Characteristic Equation of Image structure matrix
eigVal1 = sqrt((Sx+Sy+D)/2);  % Solutions of Characteristic Equation are the Eigen Values
% eigVal2 = (Sx+Sy-D)/2;  
edge  = eigVal1;
end