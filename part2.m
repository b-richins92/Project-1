                             %|ABSTRACT|%
%   In this code we utilize a function of the form z^2+c.
%We start at an initial point, plug that value into the function,
%retrieve the output, plug the output back into the function and repeat
%this process 100 times. If the values converge to within a small radius of 10^-6 around a 
%fixed point of the equation and stays in there for five iterations we plot the initial point.
%If the initial point stays within |z|<2 after 100 iterations we assume the intial point is 
%converging to a fixed point and plot the initial point. If during iterating, one of the outputs has modulus
%greater than 2 then we assume the initial point will diverge to infinity
%and not plot our initial point. We obtain our initial points from the
%inside of a 2x2 square about the origin.
  
                           %|Answers to Prompt|%
% When the points in the sequence fall outside of the sphere of radius 2, i.e.
%|z|>2, then the points diverge to infinity. Also if the initial point
%is changed say to (.75,.75) on the xy plane, after the first iteration 
%zk=1.0145 + 1.7872i therefore the modulus is greater than 2 which
%causes the zks to diverge. The initial values only get larger in modulus from
% there and subsequently the plot will be left blank as all
%the initial points will eventually diverge. Therefore a strategic initial
%point to start the function is necessary.
close all;
phi= inline('z^2-.123-.745i'); %Define a function of the form z^2+c
%This is one of the values of c suggested. To use the other value of c plug
%the function z^2-.123-.745i into the inline function and use fixed points
%fixpt1 = (1+sqrt(1.492+2.980i))/2; fixpt2 = (1-sqrt(1.492+2.980i))/2;

fixpt1 = (5+sqrt(-11-10*1i))/10; %These are the fixed points.
fixpt2 = (5-sqrt(-11-10*1i))/10;

colormap([1 0 0; 1 1 1]); %Points numbered 1 (inside) will be colored red;
                           %Those numbered 2 (outside) will be white.
M = 2*ones(201,201);       %Initilize array of point colors to 2 (white).

for j=1:201,               %initial values with imaginary parts between 
  y = -1 + (j-1)*.01;     % -1 and 1
  for i=1:201,             %and with real parts between
      x= -1 + (i-1)*.01; % -1 and 1
      zk= x + 1i*y;         % 1i is the Matlab symbol for sqrt(-1).
     
      iflag1 = 0;          %iflag1 and iflag2 count the number of iterations
      iflag2 = 0;          % when a root is within 1.e-6 of a fixed point;
      kount = 0;           % kount i < 5 && iflag2 < 5
          
      while kount < 100 && abs(zk) < 2 && iflag1 < 5 && iflag2 < 5
          kount = kount+1;
          zk = phi(zk);    % This is the fixed point iteration.
          
          err1 = abs(zk-fixpt1); %Test for convergence to fixpt1.
          if err1 < 1.e-6, iflag1 = iflag1 +1; else, iflag1 = 0; end;
          
          err2 = abs(zk-fixpt2); %Test for convergence to fixpt2.
          if err2 < 1.e-6, iflag2 =iflag2+1; else, iflag2 = 0; end;
          
      end;
      if iflag1 >= 5 || iflag2 >= 5 || kount >= 100, %If orbit is bounded,
          M(j,i) = 1;                              % point color to 1 (red)
      end;
  end;
end;


image([-1 1],[-1 1],M), %This plots the results.
pbaspect ([1 1 1]);
axis xy %Otherwise the vertical axis is inverted.