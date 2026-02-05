# Data 407 - Assignment 2:

### Samira Almuallim, 62197256, Data 407 2025WT2

---

### 1. (2 marks) Which are true about the reasons for stratified sampling?

**Answers: a, b, c, & d**



- **a. Enhance representation** - ensures key subgroups are properly represented.
- **b. Reduce sampling bias** - especially when strata differ systematically.
- **c. Improve precision** - variance is reduced when strata are internally homogeneous.
- **d. Identify patterns and trends** - allows separate analysis within strata.
- **e. Make research easier and cheaper** - stratification **adds** cost and complexity.

Thus: the answers are all except E

**Answers: a, b, c, & d**

---

### 2. (2 marks) Which of the following is correct regarding the sampling of an SRS from each stratum?

**Answer: a. We independently take an SRS from each stratum.**

In stratified sampling - each stratum is sampled **independently** using SRS. Dependence would violate the design pre assumptions

---

### 3. (2 marks) Why would anyone ever take an SRS that is not stratified?

**Answers: a, b, c, & d**

- **a.** Stratification adds complexity and may not justify the gain in precision - **correct**
- **b.** We need auxiliary information to form strata - **correct**
- **c.** We must know which population members belong to each stratum - **correct**
- **d.** We must know both the size and membership of each stratum - **correct**
- **e.** SRS would produce better estimates - **IN-correct** stratification never worsens precision if done right

Thus: the answers are all except E

**Answers: a, b, c, & d**

---

### 4. (2 marks) Regarding stratified sampling, what is the variance of  \( \bar{y}_{\text{str}} = \sum_{h=1}^H \frac{N_h}{N}\,\bar{y}_h ? \)

**Answer: d** \( \sum_{h=1}^H \left(1 - \frac{n_h}{N_h}\right)\frac{N_h^2}{N^2}\frac{S_h^2}{n_h} \)

**Explanation:**  
- Each stratum is sampled by SRS without replacement
- The var of the stratified mean is = the **weighted sum of within-stratum variances**, each with a finite population correction:

\[
{Var}(\bar{y}_{\text{str}})
= \sum_{h=1}^H \left(\frac{N_h}{N}\right)^2
\left(1 - \frac{n_h}{N_h}\right)\frac{S_h^2}{n_h}.
\]

---

### 5. (2 marks) In stratified sampling, is \(\bar{y}_{\text{str}}\) an unbiased estimate of \( \bar{y}_U \)?


**Answer: Yes**

Each stratum sample mean \( \bar{y}_h \) is an unbiased estimator of the stratum mean, and the stratified mean is a weighted average of these unbiased estimators: \(E(\bar{y}_{\text{str}}) = \bar{y}_U.\)

Thus: **Ans: a. Yes**

---

### 6. (2 marks) Regarding stratified sampling, what is the variance of   \( \hat{p}_{\text{str}} = \sum_{h=1}^H \frac{N_h}{N}\,\hat{p}_h ? \)

**Answer: D** \(
\sum_{h=1}^H \left(1 - \frac{n_h}{N_h}\right)\frac{N_h^2}{N^2}
\frac{\hat{p}_h(1 - \hat{p}_h)}{n_h}
\)

Within each stratum, the variance of \( \hat{p}_h \) under SRS without replacement is \(
\left(1 - \frac{n_h}{N_h}\right)\frac{\hat{p}_h(1-\hat{p}_h)}{n_h}. \)
Weighting by \( (N_h/N)^2 \) and summing across strata gives the result.


Thus: **Ans: d.** \(
\sum_{h=1}^H \left(1 - \frac{n_h}{N_h}\right)\frac{N_h^2}{N^2}
\frac{\hat{p}_h(1 - \hat{p}_h)}{n_h}
\)


