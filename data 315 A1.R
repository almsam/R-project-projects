# Q3
mean(LakeHuron)
# [1] 579.0041
sd(LakeHuron)
# [1] 1.318299

# Q8
# library(DAAG)
# library(Kendall)

winnings <- DAAG::vlt$prize
plot(winnings)
# see plot

t <- MannKendall(winnings)
t
# tau = 0.0367, 2-sided pvalue = 0.3973
# fail to reject the null hypothesis because 0.3973 << 1.96 (alpha = 0.05)
