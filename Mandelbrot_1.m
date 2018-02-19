% The below code generates the mandelbrot set with accuracy/precision
% depending on the iterations, grid size, and limits for x and y that are
% inputed. For example, the commented out limits below correspond to an
% image much more distint on the border than the one in place at the
% moment. satisfactory iteration counts for that one will be 500. 

maxIterations = 750;
gridSize = 1500;
xlim = [-1.5, .5];
ylim = [ -1,  1];

%xlim = [-0.748766713922161, -0.748766707771757];
%ylim = [ 0.123640844894862,  0.123640851045266];

x = linspace(xlim(1), xlim(2), gridSize);
y = linspace(ylim(1), ylim(2), gridSize);
[xGrid,yGrid] = meshgrid(x, y);             % initialize grid
z0 = xGrid + 1i*yGrid;
count = ones(length(z0));                   % create array to store data on divergence

z = z0;
for n = 0:maxIterations
    z = z.*z + z0;
    a = abs(z)<=2;
    count = count + a;
end
count = log(count);                       % changing to log is not strictly necessary, changes coloring

imagesc(x,y,count);
colormap( [jet();flipud( jet() );0 0 0] );  % jet as the colormap is more distinct than regular. 
axis off
