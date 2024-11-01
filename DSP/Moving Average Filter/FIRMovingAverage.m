function y1 = FIRMovingAverage(y1, arr)
    for ind = 1:1:100
        if (ind == 1)
            y1 = arr;
        else
        y1(1,ind) = 0.5 * arr(1,ind) + 0.5 * arr(1,ind-1);
        end
    end
end