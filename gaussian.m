I = imread('einstein.jpg');
figure('Name','Original','NumberTitle','off'),imshow(I);
fSize = 7; % filter size -> 3 5 7
padding = (fSize-1)/2; %padding size
filterCell = cell (7,1); % 7 to 1 cell for usability issues
filterCell{3,1} = [1 2 1; 2 4 2; 1 2 1];
filterCell{5,1} = [1 1 2 1 1;1 2 4 2 1;2 4 8 4 2;1 2 4 2 1;1 1 2 1 1];
filterCell{7,1} = [1 1 2 2 2 1 1;1 2 2 4 2 2 1;2 2 4 8 4 2 2;2 4 8 16 8 4 2;2 2 4 8 4 2 2;1 2 2 4 2 2 1;1 1 2 2 2 1 1];
coefSum = sum(sum(filterCell{fSize,1})); % normalization factor = sum of coefficients

iPad = zeros(size(I) + padding*2); % image with padding

%copying original image to the new image with padding

for x=1:size(I,1)
    for y=1:size(I,2)
        iPad(x+padding,y+padding) = I(x,y);
    end
end

%applying filter to the image
newI = zeros(size(I));

for k=1:size(I,1)
    for l=1:size(I,2)
        sum=0;
        for x=1:fSize
            for y=1:fSize                
                sum = sum + iPad(k+x-1,l+y-1)*filterCell{fSize,1}(x,y);
            end
        end        
        newI(k,l) = sum/coefSum;
    end
end

newI = uint8(newI);
figure('Name','Blurred Image','NumberTitle','off'),imshow(newI);
clear
