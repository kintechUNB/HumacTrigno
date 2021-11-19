%% This function sends a trigger command to Dev4 AO0 and AO1

function trigger(d, state)

% inputs:   d - the daq object
%           state - start or stop command
%                 state=1 (trigger Start), state=0 (trigger Stop)
% conditions: (1)  NI Daq name is Dev4, 
%             (2) delsys is set for rising edge 
%             (3)  Start is connected to AO0, Stop to AO1 between Delsys
%                       and USB DAQ board
%              (4) acquisition rate for device is 100Hz

if state==1
    triggerSignal = zeros(100,2);
    triggerSignal(10:20,1) = 5;
else
    triggerSignal = zeros(100,2);
    triggerSignal(50:70, 2) = 5;
end

addoutput(d, "Dev4",  0:1, "Voltage")
write(d, triggerSignal)
removechannel(d, 1:2)