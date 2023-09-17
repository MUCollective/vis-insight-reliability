# Study materials for Odds and Insights: Decision Quality in Visual Analytics Under Uncertainty

Anonymized OSF link: https://osf.io/xtsfz/?view_only=22b9e22501eb42c2ab1afea459973861


## Overview of the repository

- `data`: 
    - `final`: contains (anonymised) participant responses the main study (both qualitative and quantitative), and the solutions as CSV files
    - `simulations`: contains the RDS files which holds the simulation results. While we share the code to run the simulations, we also provided the data we generated in our simulations
    - `model`: contains model fit objects (`final-fits-minimal.rds`) and model draws. While these are not essential for executing the scripts provided, they can save considerable amount computational resources. However, as these files are quite large, we only share them on OSF (not on Github)
- `R`:  all analysis scripts, including compiled, reader-friendly html
  - `01-experiment-design.html`: contains information regarding the experiment design and simulations in HTML
  - `04-modeling_and_analysis.html`: contains information regarding the analysis in HTML in the `Qualitative Responses` directory
- `qualitative-analysis`: contains an MS excel file with the following sheets (also exported as HTML)
  - `codebook`: contains the codebook used for the qualitative analysis 
  - `summary`: summary of the frequency of each type of code identified
  - `responses`: codes as identified by both coders (together) and separately
  - `inter-rater reliability`: calculations of cohen's kappa between the two coder's responses
- `figures`: figures for experiment interface and the paper
- `plots`: the stimuli/plots participants saw in the experiments
- `survey.pdf` and `survey.qsf` The Qualtrics survey. Note that we experienced some difficulty in exporting the qualtrics survey to PDF, and so we are sharing a random participant's response. However, this did not preserve the layout we used for showing the plots. Post-review we would be happy to share the qsf file, but currently we cannot as it would break CHI's anonymity policy.