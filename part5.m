close all;
phi= inline('z^2+.36+.1i'); %Define the function with whatever point c you want.
zk=0; %initializing our initial point to be zero to see if |zk|>100 after 100 iterations
      for kount =1:101
          kount = kount+1;
          zk = phi(zk);    % This is the fixed point iteration.
          
      end;

if abs(zk)>100
    disp('Julia set is not connected.')  %the initial point zk=0 has diverged with mod>100
else disp('The Julia set is connected.')  %The intial point has stayed within the radius 100
end