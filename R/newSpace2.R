newSpace2 <- function(fit_MSFA) {

#Set up input values
nrun <- dim(fit_MSFA$Phi)[3]
G <- dim(fit_MSFA$Phi)[1]
F <- dim(fit_MSFA$Phi)[2]
L <- length(dim(fit_MSFA$Phi))

dyn.load("bigtdsub.dll")

#Call the OpenMP program
SpaceProc <- .Fortran("bigtdsub",n=as.integer(G),
   m=as.integer(F),o=as.integer(nrun),
   x=as.single(fit_MSFA$Phi),
   z=as.single(unlist(fit_MSFA$Lambda)),
   b=as.single(rep(0,G*G)),s=as.single(rep(0,G*G*L)))

Sh1 <- matrix(SpaceProc$b,nrow=G,ncol=G)
Clus1 <- array(SpaceProc$s,c(G,G,L))

AA <- list(Posterior_samples=fit_MSFA,Shared_network=Sh1,Cluster_network=Clus1)

print(date())
  return(AA)
}
