function y1 = FIRMovingAverage(y1, var, buf)
for ind = 1:1:100
    if ind <= 10
        y1(1,ind) = var(1,ind);
    else
        for bufInd = ind-10:1:ind
        buf = buf + var(1,bufInd);
        end
    buf = buf / 10;
    y1(1,ind) = buf;
    end
end
end