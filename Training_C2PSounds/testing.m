
s = daq.createSession('ni');
 [q,Fs]=wavread('C:\Documents and Settings\Administrator\Desktop\Training_C2PSounds\wavFiles\wcclean.wav');
s.IsContinuous=true
%s.addAnalogInputChannel('Dev2','ai0','Voltage');
s.addAnalogOutputChannel('Dev2','ao0','Voltage');
addTriggerConnection(s,'external','Dev2/PFI1','StartTrigger')

s.Rate=Fs;
queueOutputData(s,q)
startBackground(s)
s
'yup'

