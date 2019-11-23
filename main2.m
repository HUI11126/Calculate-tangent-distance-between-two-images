clc;clear;

images = loadMNISTImages('train-images.idx3-ubyte');
LA = loadMNISTLabels('train-labels.idx1-ubyte');   %LA(1)=5 

% We will implement two transformations, rotation and horizontally shift on the original image 
% and calculate the corresponding Euclidean distance and tangent distance

I = images(:,16); %original image  LA(16)=7  LA(20)=9
re_I = reshape(I,28,28);
figure;subplot(2,2,1);imshow(255*re_I);title('handwritten - seven');

ro_I = imrotate(reshape(I,28,28),25,'bilinear','crop');   %rotate the original image
subplot(2,2,2);imshow(255*ro_I);title('rotated 25 degrees');
E1 = reshape(ro_I,28*28,1);

G = zeros(28,28);
for i=1:28
    for j=1:23
        %G(i,j+5) = re_I(i,j);   % shift 5 pixels horizontally
        G(i,j+5) = ro_I(i,j);   % shift the rotated image
    end
end
subplot(2,2,3);imshow(255*G);title('shift 5 pixels horizontally');
G1 = reshape(G,28*28,1);

T1 = E1-I;  % tangent vector 
T2 = G1-I;  % tangent vector 
T = [T1,T2];

t_d = norm(I+T*Gradient_descent(T,I,G1)-G1);    % Tangent Distance
e_d = norm(I-G1);   % Euclidean Distance
e_d1 = norm(images(:,20)-I);  % Euclidean Distance between two original handwritten images - seven and nine

subplot(2,2,4);imshow(255*reshape(images(:,20),28,28));title('handwritten - nine');
