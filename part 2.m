%When the points in the sequence fall outside of the sphere of radius 2, i.e.
%|z|>2, then the points diverge to infinity. Also if the initial point
%is changed say to (.75,.75) on the xy plane, after the first iteration 
%zk=1.0145 + 1.7872 therefore the modulus is greather than 2 which
%causes the zks to diverge. Subsequently the plot will be left blank as all
%the initial points will eventually diverge.
close all;
phi= inline('z^2+.36+.1i'); %Define the function with whatever point c you want.
fixpt1 = (5+sqrt(-11-10*1i))/10; %These are the fixed points.
fixpt2 = (5-sqrt(-11-10*1i))/10;

colormap([1 0 0; 1 1 1]); %Points numbered 1 (inside) will be colored red;
                           %Those numbered 2 (outside) will be white.
M = 2*ones(21,21);       %Initilize array of point colors to 2 (white).

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