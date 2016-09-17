function [red,blue,green] = encrypt(red,blue,green,data)

%the data variable is the letter and each letter consists of 8 bits 
%the hiding process goes like that
% 1- take the first 3 bits in the letter and hide them in the fisrt 3 bits in the blue layer 
% 2- take the second 3 bits in the letter and hide them in the first 3 bits in the green layer 
% 3- take the last 2 bits the letter and hide then in the first 2 bits in red layer


%encrypting the blue bits
 %hiding letters bits from 1 to 3
  for i = 1 : 3  
      databit_holder = bitget(data,i);
       blue = bitset(blue,i,databit_holder);   
  end

%encrypting the green bits
%hiding letter bits from 4 to 6
i = 1;
t=4;
while( i <=3 && t <= 6)
    databit_holder = bitget(data,t);
       green = bitset(green,i,databit_holder);
  i = i+1;
  t = t+1;
end

%encrypting the red bits
%hiding letter bits from 7 to 8
i = 1;
t=7;
while( i <=2 && t <= 8)
    databit_holder = bitget(data,t);
   red = bitset(red,i,databit_holder);
 i = i+1;
 t = t+1;
end
return; 

