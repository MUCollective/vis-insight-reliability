# Data table

`final-study-cleaned.csv` contains anonymized participant responses from the main study. The CSV contains the following columns:

- `prolific_pid`: unique, anonymized id
 - `session_id`: unique study session id
 - `completed_date_time`: completed date and time
 - `id`: database id number, not used
 - `tp`: number of true positives
 - `tn`: number of true negatives
 - `fp`: number of false positives
 - `fn`: number of false negatives
 - `condition`: type of uncertainty visualization, with levels:  ci,        dotplot,        halfeye, hops_bootstrap,      hops_mean, and      raw_data 
 - `trial`: unique trial number, to be matched with the `true_effects.csv` to determine the participant is correct
 - `nregions`: number of regions in a trial, 8 or 12
 - `trial_id`: trial id, in increasing order as participants see them. Usually 1 ~ 70
 - `ntrials`: same as `nregions`
 - `alpha`: 0.05, the false discovery rate control target
 - `block_id`: the trial id within a block;  usually 1 ~ 35
 - `block`: the block number in the order the participant sees them, usually 1 ~ 2
 - `adj_trial_id`: the 1 ~ 70 trial id mapped onto [-1, 1] for modeling
