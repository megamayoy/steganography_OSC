function letter = decrypt(red,blue,green)

%this function takes the 3 layers of a pixel and retrieve the letter hidden
%inside


%num2str converts a number to string
%1-we take the first 3 bits in the blue layer and the first 3 bits in the
%green layer and the first 2 bits in the red layer

%2- we concatenate all of the layers in one variable to get the letter
%you notice that we converted each bit to a string using num2str fucntion

%we did that because bin2dec function that converts binary to decimal takes
%only a string input.


blue_total = [num2str(bitget(blue,3)) num2str(bitget(blue,2)) num2str(bitget(blue,1))];
green_total = [num2str(bitget(green,3)) num2str(bitget(green,2)) num2str(bitget(green,1))];
red_total = [num2str(bitget(red,2))  num2str(bitget(red,1))];

letter = [red_total green_total blue_total];

%bin2dec converts binary to decimal but takes the binary number input as a string

letter = bin2dec(letter);
return;
