# newSpace2
```{r}
devtools::install_github("SatwikAch/SpaceX")
library(SpaceX)
devtools::install_github("ErinH1/newSpace2")
library(newSpace2)
# Application to SpaceX method
BC_fit <- SpaceX(BC_count,BC_loc[,1:2],BC_loc[,3],Post_process = FALSE)
BC_final <- newSpace2(BC_fit$Posterior_samples)
# Shared_network :: Shared co-expression matrix
# Cluster_network :: Cluster specific co-expression matrices
```
