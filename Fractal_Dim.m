% compute Fractal Dimension using box-counting. code will work as follows:
%   1) spreads the image/adds to it so it becomes a power of 2. we are
%      working with fractals within the 1-2 dimension range. 
%   2) compute N(x), which corresponds to the number of boxes of size x 
%      that contain an object (pixel). the original box will be set to the
%      size of the image and we work 
%      down from there. If x is greater than 1, we divide by 2 and repeat
%      the process. 
%   3) compute log(N) x log(1/x) and fit to a least squares line. The
%      resulting slope represents the Fractal Dimension of our image.  

M = eye(200);

maxDim = length(M);
newDim = 2^ceil(log2(maxDim));

rowP = newDim - size(M,1);
colP = newDim - size(M,2);

M = padarray(M, [rowP, colP], 'post');

% above code pads the matrix to make it a power of 2 (i.e a matrix
% with dimensions 300x400 will be padded to 512x512.



count = zeros(1, ceil(log2(maxDim)));
res = zeros(1, ceil(log2(maxDim)));

bSize = size(M,1);
bpd = 1;
var = 0;

while bSize >=1
    bCount = 0;
    
    % i represents rows and j represents columns in the following code.
    
    for i = 1:bpd
        for j = 1:bpd
            minI = (i-1)*bSize + 1;
            maxI = i*bSize;
            minJ = (j-1)*bSize + 1;
            maxJ = j*bSize;
            
            for row = minI:maxI
                for col = minJ:maxJ
                    if M(row,col)
                        bCount = bCount + 1;
                        break;
                    end
                end
            end
        end
        
        var = var + 1;
        count(var) = bCount;
        res(var) = 1/bSize;
        
        bpd = bpd*2;
        bSize = bSize/2;
    end
    
    % fits data into a line and the FD should be the slope of the line. 
    D = polyfit(log(res),log(count),1);
    FD = D(1);
end

        
    
    
    
    