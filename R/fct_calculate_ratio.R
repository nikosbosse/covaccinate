
ve_gain <- function(ve1, ve2) {
  return (ve2 - ve1)
}

gain_ratio <- function(ve1, ve2) {
  ratio <- ve1 / (ve2 - ve1)
  return(round(ratio, 2))
}

mortality_reduction <- function(ar, ifr, ve) {
  return(ar * ifr * ve)
}

