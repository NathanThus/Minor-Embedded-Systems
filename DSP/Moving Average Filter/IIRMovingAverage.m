function y2 = IIRMovingAverage(y2, arr)
    for ind = 1:1:100
        if(ind == 1)
            y2(1,ind) = arr(ind);
        else
            y2(1,ind) = arr(ind) + 0.1 * y2(ind - 1);
        end
    end
end