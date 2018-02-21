function boxCountMethod(M)

% The code below runs the box counting method, an iterative procedure to 
% determine the fractal dimension of a 1D, 2D, or 3D array. The method
% is an itterative procedure in that we iterate through different box sizes
% in order to determine a more accurate fit for the slope of the
% corresponding least squares line which will correspond to the fractal
% dimension of the image we are concerned with. 

% note that we can also import and analyze an image using the following 
%process. 
% image = imread('imageName');
% image(image);
% axis image;
% im = im(1:800,201:1000,3);
% M = (image < 200);

maxDim = length(M);
newDim = 2^ceil(log2(maxDim));

rowP = newDim - size(M,1);
colP = newDim - size(M,2);

M = padarray(M, [rowP, colP], 'post');

% pads the above array to make it an nXn matrix of 
% a power of two.

[A, ~] = size(M);

p = round(log(A)/log(2));   % number of iterations in our box counting procedure
N = zeros(1, p + 1);        % where we will store the values for each iteration
                            % of our boxcounting method. 
N(p+1) = sum(sum(M));       % last iteration contains entire array

for k = (p - 1):-1:0
    var1 = 2^(p - k);
    var2 = round((var1)/2);
    for i = 1:var1:(A - var1 + 1)
        for j = 1:var1:(A - var1 + 1)
            M(i,j) = (M(i,j) || M(i + var2, j) || M(i, j + size2) || M(i + size2, j + size2));
        end
    end
    N(k + 1) = sum(sum(M(1:var1:(A - var1 + 1), 1:var1:(A - var1 + 1))));
end

R = 2.^(0:p);                           % box size as a vector. power of 2. 
D = mean(diff(log(N))./diff(log(R)));   % average slope between parameters gives us our FD
fprintf('Fractal Dimension using BC Method is %d.\n',D);
end;

