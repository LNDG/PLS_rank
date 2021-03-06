function stacked_rank_datamat = fk_rankvalues(stacked_datamat, num_groups, num_cond, num_subj_lst)

% Usage: [stacked_rank_datamat, stacked_rank_behavdata] = rri_get_rankvalues(stacked_datamat, stacked_behavdata, num_groups, num_cond, num_subj_lst)
% Converts data matrix into its columnwise rank values.
% Tied ranks are averaged.

stacked_rank_datamat = [];

for g = 1:num_groups
    start = sum(num_subj_lst(1:g-1))*num_cond;                              % Specify where slice of stacked matrix starts
    
    % Convert datamat to rank values
    datamat = stacked_datamat(1+start : start+num_subj_lst(g)*num_cond, :); 
    ranked_datamat = tiedrank(datamat);
    stacked_rank_datamat = [stacked_rank_datamat; ranked_datamat];          % Stack rank values
    
end