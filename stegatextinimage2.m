image = imread('secret.bmp');
image_size = size(image);
image_height = image_size(1);
image_width = image_size(2);

% remember we hid the message size in the last blue pixel
message_size = image(image_height,image_width,3);

message = zeros([1,message_size]);

h = 1; w = 1; message_letter = 1;
while message_letter <= message_size
    
    red = image(h,w,1);
    green = image(h,w,2);
    blue = image(h,w,3);
    
    letter = decrypt(red,blue,green);
    
    message(message_letter) = letter;
    
      if( w < image_width )
         w = w+1;
     else
         w = 1;
         h = h+1;
      end
      message_letter = message_letter + 1;
    
    
end
%opening a file to store the message 
file = fopen('hidden.txt','w');

%writing in the file and converting the message into char to be stored as
%letters and not numbers
fwrite(file,char(message),'char');
%closing the file stream
fclose(file);

%show message that the message is retrieved 
helpdlg('data Retrived succesfully in hidden.txt');



