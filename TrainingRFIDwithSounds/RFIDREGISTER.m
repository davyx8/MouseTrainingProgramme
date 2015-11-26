
closeserials
s = serial('COM1');
set(s, 'Timeout',10);
fopen(s)
fscanf(s)
