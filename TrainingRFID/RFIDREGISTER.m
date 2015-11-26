closeserials
s = serial('COM1');
set(s, 'Timeout',2);
fopen(s)
fscanf(s)
