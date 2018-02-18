                           %|ABSTRACT|%
%In this code we input our favorite real or imaginary number with modulus<2 into
%the variable c. Instead of the function z=z^2+c that we used in parts 1 and 2, we solve for the z's on the RHS 
%of the equation which gives us two roots +-sqrt(z-c). When we run our sequence of zk's we start at an initial 
%point, plug that into a randomly chosen positive or negative root, retrieve that value, plug it again into a 
%randomly assigned root and repeat this process for 100 iterations.
      %With this form of the equation for z, instead of "repelling"
%initial points z0 towards infinity or towards a fixed point, we instead
%"attract" initial points which converge to some point on the boundary of
%the Filled Julia Set. We then plot the set of all these points that lie on
%the boundary, which have been calculated from initial points inside a 2x2
%rectangle about the origin.
close all;
c = .9 + .9*1i;    %Put in your value of c
zlist=[];          %Creating an array which will contain all of the points we wish to plot
           
for j=1:201,       %Each j is the y component of an initial point
  y = -1 + (j-1)*.01;     %initial y coordinate plus spacing between each y value
  for h=1:201,             %Each h is the x component of an intial point, paired with corresponding y.
      x= -1 + (h-1)*.01;   %initial x coordinate plus spacing between each x value
      kount = 0;          
      zk=x + 1i*y;      
      while  kount < 101 % Running the iteration 100 times should be sufficient for zks to converge to boundary
          kount = kount+1;      
          w=zk-c;           %Note in the hw prompt, zk=sqrt(w-c). Here w takes on a different meaning for ease of coding.
          x=real(w);        %Extracting real component of w and mapping to x
          y=imag(w);        %Extracting imaginary component of w and mapping to y. We then use real numbers x and y to
                            %calculate r and theta.
          r= sqrt(x^2+y^2); %Calculating r based off of coordinates in real plane.
          theta = atan2(y,x); %Calculating theta using atan2 function puts theta in between -pi and pi
          zk=sqrt(r)*[cos(theta/2)+1i*sin(theta/2)]; %sqrt of zk-c in polar terms
          a=randi(100,1,1);   %randomly assigning positive or negative roots.
           if mod(a,2)==1;
           zk= -zk;
           else zk=zk;
           end
      end
       zlist=[zlist,zk];      %After every z0 has iterated 100 times we put every zk into an array zlist 
   end;
end;
plot (zlist,'.')                %plotting all of our final zks.
pbaspect ([1 1 1]);             %sets the ratio between x and y axis to 1
axis xy 