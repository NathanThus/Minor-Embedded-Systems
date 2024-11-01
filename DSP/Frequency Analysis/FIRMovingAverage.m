function MA = FIRMovingAverage(MA, arr, length)
    for ind = 1:1:length
        if (ind == 1)
            MA = arr;
        else
        MA(ind,1) = 0.5 * arr(ind,1) + 0.5 * arr(ind-1,1);
        end
    end
end