                          %|ABSTRACT|%
%   In this code we test whether or not a Julia set is connected. We plug
%   in the origin as our initial value and test whether or not it diverges
%   after 100 iterations. If |zk|>100, we assume orb(0) is divergent and
%   conclude that the Julia Set is not connected. If |zk|<100 after 100
%   iterations, we assume orb(0) is converging and conclude the Julia Set
%   is connected. We then plot orb(0) in a 2x2 square about the
%   origin.
close all;
phi= inline('z^2+.36+.1i'); %Define a function of the form z^2+c.
zk=0; %initializing our initial point to be zero to see if |zk|>100 after 100 iterations
zlist=[]; % Initializing our array to contain the orbit of zk from the first 100 iterations.
      for kount =1:101
          kount = kount+1;
          zk = phi(zk);    % This is the fixed point iteration.
          
          zlist=[zlist,zk];
      end;

if abs(zk)>100
    disp('Julia set is not connected.')  %the initial point zk=0 has diverged with mod>100
else disp('The Julia set is connected.')  %The intial point has stayed within the radius 100
end
pbaspect ([1 1 1]);    
plot(zlist,'.')
 