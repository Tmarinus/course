function rawMatrixOut  = equalizeSizeGpu( prData )
%equalizeSize converts all the elements of prData into a new prtools
%datafile with every imaged having equal amount of pixels. A black border
%is added to images smaller than the largest image.
    prwaitbar off;
    [m k c] = getsize(prData);

    maxY = 0;
    maxX = 0;
    for i = 1:c
        for j = 1:m/c
            matrix = gpuArray(getMatrix(prData,i,j));
            % x is columns, y is rows
            [y, x] = size(matrix);
            if y > maxY
                maxY = y;
            end
            if x > maxX
                maxX = x;
            end
        end
    end
    'end of first part'
    if mod(maxY,2) == 1
        maxY = maxY+3;
    else
        maxY = maxY+2;
    end
    if mod(maxX,2) == 1
        maxX = maxX+3;
    else
        maxX = maxX+2;
    end
    
    rawMatrixOut = zeros(c,m/c, maxY,maxX,'gpuArray');
    for i = 1:c
        for j = 1:m/c
            matrix = gpuArray(getMatrix(prData,i,j));
            [y, x] = size(matrix);
            yPos = ceil((maxY-y)/2);
            xPos = ceil((maxX-x)/2);
            rawMatrixOut(i,j,yPos:yPos+y-1,xPos:xPos+x-1) = matrix;
        end
    end
    
end

