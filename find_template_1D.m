% Find template 1D
% NOTE: Function definition must be the very first piece of code here!
function [maxValue index] = find_template_1D( t, s)
% TODO: Locate template t in signal s and return index
% NOTE: Turn off all output from inside the function before submitting!
    c = normxcorr2(t, s);
    % size(c,2) % 16
    % disp([1:size(c,2);c]);
    [maxValue rawIndex] = max(c);
    index = rawIndex - size(t,2) + 1;
end
