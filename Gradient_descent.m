function a = Gradient_descent(T,x,y)
% calculate the optimal 'a' via iterative gradient descent
[r,d] = size(T);
a = ones(d,1);
t = 0; % iteration times
while true
    b = a;  % The value of 'a' is stored at Workspace, so b = a means b equals a of the last iteration
    a = a - 0.0005*T'*(T*a + x - y);    % 0.0005 is the scalar step size controlling the rate of convergence
    t = t+1;
    if norm(b - a)<0.001 || t > 1000
        break;
    end
end

