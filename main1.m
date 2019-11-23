clc;clear;

images = loadMNISTImages('train-images.idx3-ubyte');
LA = loadMNISTLabels('train-labels.idx1-ubyte');   %LA(1)=5 

% We will use a for-loop to show that the tangent distance does not change when rotating some degrees,
% while the Euclidean distance changes significantly.

I = images(:,1); %original image  LA(16)=7  LA(20)=9    LA(3)=4  LA(1)=5
re_I = reshape(I,28,28);
figure;subplot(2,4,1);imshow(255*re_I);title('original-seven');

t_d = [100,100,100,100,100,100];    % Initialize the tangent distance
e_d = [100,100,100,100,100,100];    % Initialize the Euclidean distance
for i=0:5
    ro_I = imrotate(reshape(I,28,28),5*i,'bilinear','crop');   %rotate the original image
    subplot(2,4,i+2);imshow(255*ro_I);title('rotated more 5°');
    E1 = reshape(ro_I,28*28,1);
    T = E1-I;  % tangent vector 

    t_d(i+1) = norm(I+T*Gradient_descent(T,I,E1)-E1);    % Tangent Distance
    e_d(i+1) = norm(I-E1);   % Euclidean Distance
end

t=0:5:25;
figure;
plot(t, e_d,'--ro');hold on;
plot(t, t_d+0.2,'-g*');   % Because the tangent distances are too close to 0, 
                          % we add 0.2 to each of the tangent distance to show them clearly
xlabel('rotation degree');
ylabel('distance');
legend('Euclidean distance', 'Tangent distance');