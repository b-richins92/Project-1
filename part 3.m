close all;
c = .36 + .1*1i;   %Put in your value of c
zlist=[];          %Creating an array which will contain all of the points we wish to plot
           
for j=1:201,       %Each j is the y component of an initial point
  y = -1 + (j-1)*.01;     %initial y coordinate plus spacing between each y value
  for h=1:201,             %Each h is the x component of an intial point, paired with corresponding y.
      x= -1 + (h-1)*.01;   %initial x coordinate plus spacing between each x value
      kount = 0;          
                
      while  kount < 101 % Running the iteration for 100 times should be sufficient for zks to converge to boundary
          kount = kount+1;      
          w=zk-c;           %Note in the hw prompt, zk=sqrt(w-c). Here w takes on a different meaning for ease of coding.
          x=real(w);        %Extracting x component 
          y=imag(w);        %Extracting imaginary components of w to turn them into real to calculate r and theta.
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