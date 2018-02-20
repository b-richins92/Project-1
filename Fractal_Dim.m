M = eye(200);

maxDim = length(M);
newDim = 2^ceil(log2(maxDim));

rowP = newDim - size(M,1);
colP = newDim - size(M,2);
p=0;
M = padarray(M, [rowP, colP], 'post');
%M = (M ~= 1);

% above code pads the matrix to make it a power of 2 (i.e a matrix
% with dimensions 300x400 will be padded to 512x512.

count = 0;
maxIter = log2(length(M))-1;
i = 1;
j = 1;



for i = 1:(2^maxIter), for j = 1:(2^maxIter)
        for x, for y
                k = M() + M() + M() + M()


while i <= (2^(maxIter))
    j=i+1
    for i=i:j 
        k= M(i,i)+M(i,j)+M(j,i)+M(j,j);
        if (k~=0) && (k~=4)
            count = count+1;
        end
       i = i + 2;
       if i == (2^maxIter)
           j= j + 2*p;
           
           i=1+2*p;
       end
    end
end

count

D = -log(count)/log(2^maxIter)
        
        





    

    
