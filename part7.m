                          %|ABSTRACT|%
%    In this code we examine functions of the form z^n-1 on the complex
%    plane. We pick initial points from the inside of a 2x2 rectangle about
% the origin and use newtons method to eventually map these points to within
% a small radius about a root of the equation. We determine which root the 
%initial point converges to, and how long it takes and color code
%accordingly. Works for any value n.
close all
delta=.01;   %error tolerance for convergence to root
colormap(jet); %color settings for matrix M
n=4;   %input n for z^n-1
            
                     %|IMPORTANT|%
      % C is the coefficient array of the function z^n-1. When changing n, in order for the function
      %to calculate the roots, you must change the coefficient array
      %to 1 on the first entry -1 on the last and (n-1) 0's in the middle.
            
c=[1 0 0 0 -1];
root=roots(c);          %Matlabs built in root finding function. (We still use Newtons method this just helps with run time.).
maxit=40;               %Maximum amount of iterations desired for each initial point.           
M= 64*ones(401,401);    %initializing our matrix of ones whose values will change to correspond to colors
for h=1:401,               %initial values with imaginary parts between 
  y = -1 + (h-1)*.005;     % -1 and 1
  for j=1:401,            
      breakk=0;   %used to break two for loops at once
      x= -1 + (j-1)*.005; % and with real parts between -1 and 1
      
      zk= x + 1i*y;         % sending x and y to the imaginary plane.                    
      
      for k=1:maxit        %for at most 40 iterations
          zk1=zk-(zk^n-1)/(n*zk^(n-1));     %Newtons algorithm
          zk=zk1;
         for p=1:n  %for each root p...
          if abs(zk-root(p)) < delta  %check to see if zk is with delta of the root.
                  M(h,j)=60*(p-1)/n + k*((60/n)/maxit);
                  % We use color values 1-60. We partition the basins of 
                  %attraction into n subsets, each with color values 60/n in length. Depending on the
                  %root p and the speed of convergence represented by k, we
                  %obtain color values for the matrix M.
                                                    
                  breakk=1;       %We use a flag to break not the last for loop, but the one before that one.
                  break;
          end
         end
          if breakk==1
              break;
          end
          
      end
  end
end
         
image([-1 1],[-1 1],M), %This plots the results.
colorbar                %shows color code on side of image
pbaspect ([1 1 1]);      %sets the ratio of x axis to y axis equal to 1
axis xy %Otherwise the vertical axis is inverted.

                          %|Conclusion|% 
%One can see that for any value n, there are n "main" basins of
%attraction that surround the origin. One can see that the colors in these
%basins converge to the roots of the equation as well. For more details see
%part7graphanalysis.jpg