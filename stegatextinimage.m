% read image & message

%this is the image
%imread is a built in fucntion that reads images
image = imread('cup.jpg');

%this is the message
%fopen is built in func that open files specially txt files
file = fopen('message.txt','r');

%reading the message (that we want to hide)
message = fread(file);

%closing the file stream (note: for each fopen you use ,you need to close it) 
fclose(file);

% get image size & height & width
%size is a built in fucntion return  one based array of 1D or 2D objects 
%first position in the array is the height of the image
%second position is the width
% third position is the number of dimensions the object has

image_size = size(image);
image_height = image_size(1);
image_width = image_size(2);
image_size = image_height * image_width;

% get message size
message_size = size(message);
message_size = message_size(1) ;

%check if size of message is larger than image size
%in this case the user needs to change the image with a bigger one
if(message_size >= image_size)
    
     fprintf('\nImage File Size  %d\n',image_size);
     fprintf('Text  File Size  %d\n',message_size);
     disp('Text File is too Large to fit in the image');
else
 
    %hiding the data
    %c is the variable to traverse the message characters
    %w is for traversing the width of the image
    %h id for traversing the height of the image
    
    
    %in each iteration of this loop, it takes one letter and one pixel
    %hides the letter in the pixel
    c =1; w = 1; h = 1;
for c = 1:message_size
    %get a letter form the message
    txt = message(c);
    
    %get the values of the 3 colours in each pixel
    %those 3 colours represents one pixel 
    red = image(h,w,1);
    green = image(h,w,2);
    blue = image(h,w,3);
    
    %hiding the letter in the pixel
    %check the comments in the encrypt fucntion
    [red,blue,green] = encrypt(red,blue,green,txt);
    
    %adjust in the original image to get a new one
    image(h,w,1) = red;
     image(h,w,2) = green;
     image(h,w,3) = blue;
     
     
     %handling edges
%if the width counter haven't reached the end of the image width keep inceremening
%else go to the next row of pixels      
     if( w < image_width )
         w = w+1;
     else
         w = 1;
         h = h+1;
     end
    
    
end 

% store the message size in the last pixel's blue layer 
image(image_height,image_width,3) = message_size;

%write the image in an image called secret.bmp(you can change the format of the image)
imwrite(image,'secret.bmp','bmp');

%show the stego image 
imshow(image);
end

    
     


