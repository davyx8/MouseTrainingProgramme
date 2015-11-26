s = serial('COM1');
fopen(s);


 parfor i = 1:2
    if i == 2
    while(1)
    z=fscanf(s)
    end
    else

     while(1)
'ss'
     end
    end
 end