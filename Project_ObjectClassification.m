function BW = Project4_07(I)
%PROJECT4_07 - Blakley Parker

    %Create disk filter with radius of 3 to smooth image
    H = fspecial('disk',3);
    filtered = imfilter(I,H,'replicate'); 

    %Otsu's method to determine appropriate threshold for each reference image
    T = graythresh(filtered);
    BW1 = imbinarize(filtered, T);

    %Disk shapped structuring element with a radius of 1
    se = strel('disk', 1);

    %dilate the image twice with the same stucturing element to receive a
    %cleaner image with less black circles denoting the Nuclei
    BW2 = imdilate(BW1,se);

    BW3 = imdilate(BW2,se);

    %Fill in some of the remaining holes with pixel connectivity of 4
    BW = imfill(BW3,4,'holes');


end

