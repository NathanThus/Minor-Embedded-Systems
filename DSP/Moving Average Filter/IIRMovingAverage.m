function y2 = IIRMovingAverage(y2, var, buf)
for ind = 1:1:100
    if ind <= 10
        y2(1,ind) = var(1,ind);
    else
        for bufInd = ind-10:1:ind
        buf = buf + var(1,bufInd) * 0.1;
        end
    y2(1,ind) = buf;
    buf = 0;
    end
end
end