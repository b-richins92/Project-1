                            %|ABSTRACT|%
%    In this code we color code the orbits of initial points. If an initial
%point converges, or if it diverges within a certain amount of iterations
%we color that point accordingly.
close all;
phi= inline('z^2+.36+.1i'); %Define a function of the form z^2 +c
fixpt1 = (5+sqrt(-11-10*1i))/10; %These are the fixed points.
fixpt2 = (5-sqrt(-11-10*1i))/10;
colormap([1 0 0;   %row 1=red
          1 .5 0;  %row 2=orange
          1 1 0;   %row 3=yellow
          0 1 0;   %row 4=green
          0 0 1;   %row 5=blue
          .5 0 1;  %row 6=indigo
          1 0 1;   %row 7=violet
          0 0 0]); %row 8=black
    
M = ones(101,101);       %Initilize array of point colors to one (red).

for j=1:101,               %initial values with imaginary parts between 
  y = -1 + (j-1)*.02;     % -1 and 1
  for i=1:101,             %and with real parts between
      x= -1 + (i-1)*.02; % -1 and 1
      zk= x + 1i*y;         % 1i is the Matlab symbol for sqrt(-1).
     
      iflag1 = 0;          %iflag1 and iflag2 count the number of iterations
      iflag2 = 0;          % when a root is within 1.e-6 of a fixed point;
      kount = 0;           % kount i < 5 && iflag2 < 5
     %In the while loop below, We test for convergence or divergence to a fixed point using |z|<2. Note: the prompt used |z|>100 as a test for 
     %divergence, however it is sufficient to say the zks will diverge if |z|>2     
      while kount < 100 && abs(zk) < 2 && iflag1 < 5 && iflag2 < 5 
          kount = kount+1;
          zk = phi(zk);    % This is the fixed point iteration.
          
          err1 = abs(zk-fixpt1); %Test for convergence to fixpt1.
          if err1 < 1.e-6, iflag1 = iflag1 +1; else, iflag1 = 0; end;
          
          err2 = abs(zk-fixpt2); %Test for convergence to fixpt2.
          if err2 < 1.e-6, iflag2 =iflag2+1; else, iflag2 = 0; end;
          
      end;
      if iflag1 >= 5 || iflag2 >= 5 || kount >= 100,
          M(j,i) = 5; %if zk converges to a fixed point we color it blue
      elseif kount<20
          M(j,i) = 7;      %if it diverges in less than 20 iterations we color it violet
      elseif kount>=20 && kount<30 
              M(j,i)=1;            %if it diverges in between 20 and 30 iterations we color it red.
      elseif kount>=30 && kount<40 
              M(j,i)=2;            %if it diverges in between 30 and 40 iterations we color it orange
      elseif kount>=40 && kount<60 
              M(j,i)=3;            %if it diverges in between 40 and 60 iterations we color it yellow
      elseif kount>=60 && kount<80
              M(j,i)=4;            %if it diverges in between 60 and 80 iterations we color it green
      elseif kount>=80 && kount<100
              M(j,i)=6;            %if it diverges in between 80 and 100 iterations we color it indigo
      elseif kount>=100
              M(j,i)=8;            %if it diverges in over 100 iterations we color it black
      end;
  end;
end;


image([-1 1],[-1 1],M), %This plots the results.
pbaspect ([1 1 1]);      %sets the ratio of x axis to y axis equal to 1
axis xy %Otherwise the vertical axis is inverted.