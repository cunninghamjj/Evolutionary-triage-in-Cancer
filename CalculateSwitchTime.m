
function [switchESSTime] = calculateSwitchTime(ESS, maxSimTime)

if strcmp(ESS, '1') == 1
    switchESSTime = maxSimTime;

elseif strcmp(ESS, '2') == 1
    switchESSTime = 0;

elseif strcmp(ESS, 'Switch') == 1
    switchESSTime = maxSimTime/2;

end