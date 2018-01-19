function [ yIndex xIndex] = Untitled(template, img)
    % TODO: Find template in img and return [y x] location
    % NOTE: Turn off all output from inside the function before submitting!
    
    c = normxcorr2(template, img);
    [yRaw xRaw] = find(c == max(c(:)));
    yIndex = yRaw - size(template, 1) + 1;
    xIndex = xRaw - size(template, 2) + 1;
end