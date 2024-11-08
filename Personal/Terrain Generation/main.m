[X,Y] = meshgrid(-100:1:100);
Z = rand(length(Y),length(Y));
Z = movmean(Z,20);
% Z = smoothdata(Z,"sgolay");
mesh(X,Y,Z);