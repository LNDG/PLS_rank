function lvlvcorr = fk_getlvlvcorr(usc, vsc, cormode)
% Correlates the latent variables columnwise
% Input: left and right latent variables

if size(usc) ~= size(vsc)
    error('Latent Variables must have the same size');
end

if cormode == 8
    usc = tiedrank(usc);
    vsc = tiedrank(vsc);
end


[n_rows, n_cols] = size(usc);
usc_avg = mean(usc);
usc_std = std(usc);

vsc_avg = mean(vsc);
vsc_std = std(vsc);

%Centralize
for row=1:n_rows
    usc(row,:) = (usc(row,:)-usc_avg)./usc_std;
    vsc(row,:) = (vsc(row,:)-vsc_avg)./vsc_std;
end 

%Correlation as xproduct
xprod = usc'*vsc;
corrmat = xprod./(n_rows-1);
lvlvcorr = diag(corrmat);
