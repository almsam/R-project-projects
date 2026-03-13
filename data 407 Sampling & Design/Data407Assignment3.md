# Data 407 - Assignment 3:

### Samira Almuallim, 62197256, Data 407 2025WT2

---


### 1. (2 marks) Which are key reasons to use cluster sampling?

**Answers: a & b**

- **a. Accessibility** - clusters group nearby units together, making them easier to reach in field surveys.
- **b. Cost-effectiveness** - reduces travel and logistical costs compared to sampling units spread across the population.
- **c. High-precision** - **incorrect** -- cluster sampling usually **increases variance** because units within clusters tend to be similar.
- **d. High-accuracy** - **incorrect** -- cluster sampling is mainly used for **practicality and cost**, not improved statistical accuracy.

Thus: the answers are **A and B**

**Answers: a & b**

---


### 2. (2 marks) Which of the following is correct regarding two-stage cluster sampling?

**Answer: a**

In **two-stage cluster sampling**:

- First stage: select **primary sampling units (PSUs)** using SRS.
- Second stage: within each selected PSU, select **secondary sampling units (SSUs)** using another SRS.

Option **b** is incorrect because the second stage must sample **SSUs within PSUs**, not another sample of PSUs.

Thus: we select an SRS of n PSUs and then select an SRS of SSUs from each selected PSU

**Answer: A**

---

### 3. (2 marks) In one-stage cluster sampling from the same number of SSUs, is \( \hat{\bar{y}}_r \) an unbiased estimate of \( \bar{y}_U \)?

**Answer: Yes**

When clusters contain the **same number of secondary sampling units**, selecting clusters by SRS and observing **all units within each cluster** produces an estimator that is unbiased for the population mean.

Thus: **Ans: a - Yes**

---

### 4. (2 marks) In two-stage cluster sampling of different numbers of SSUs, is \( \hat{\bar{y}}_r \) an unbiased estimate of \( \bar{y}_U \)?

**Answer: No**

If clusters contain **different numbers of SSUs**, the simple average of sampled cluster means \( \hat{\bar{y}}_r \) does **not correctly weight clusters by their sizes**.

This introduces bias because clusters with fewer SSUs receive the same weight as larger clusters.

Thus: **Ans: b. No**

---

### 5. (2 marks) Regarding two-stage cluster sampling, what is the approximate variance of \( \hat{\bar{y}}_r \)?

**Answer: B**

\[
\frac{1}{\bar{M}_U^2}
\frac{1}{n}\left(1-\frac{n}{N}\right)
\sum_{i=1}^{N}
\frac{(M_i\bar{y}_{iU}-\bar{y}_U M_i)^2}{N-1}
+
\frac{1}{\bar{M}_U^2}
\frac{1}{n}
\sum_{i=1}^{N}
\frac{M_i^2 V(\bar{y}_i|S)}{N}
\]

**Explanation:**

The approximate var for the ratio estimator in **two-stage cluster sampling** contains **2 components**:

1. **Between-cluster variance** (variation among PSU totals), which includes the **finite population correction** \(1-\frac{n}{N}\).
2. **Within-cluster sampling variance**, reflecting the variability from sampling SSUs inside selected PSUs.

Thus the correct expression is **option B**.

So: **Our ans is b**

---

### 6. (2 marks) Which are major issues for designing a cluster sample?

**Answers: a, b, c, & d**

- **a. What overall precision is needed?** – determines the required sample size.
- **b. What size should the PSUs be?** – cluster size affects variance and cost.
- **c. How many SSUs should be sampled in each selected PSU?** – determines the second-stage sampling design.
- **d. How many PSUs should be sampled?** – determines the first-stage sampling design.

All of these are **key design decisions** in cluster sampling.

Thus: the answers are **A, B, C, n D**

**Answers: a, b, c, & d**

 - See lec 7 notes p 10 for why its \({n_h-1}\) and not \({n_h}\)

---

### 7. (3 marks) Stratified sample of NYC food stores (Hayes, 2000)

Given strata information:

| Stratum | Income level | \(N_h\) | \(n_h\) | \(\bar{y}_h\) | \(s_h^2\) |
|-------|-------------|---------|---------|---------------|-----------|
| 1 | Low income | 190 | 21 | 3.925 | 0.037^2 |
| 2 | Middle income | 407 | 14 | 3.938 | 0.052^2 |
| 3 | Upper income | 811 | 22 | 3.942 | 0.070^2 |

Total population size = \( N = 190 + 407 + 811 = 1408 \)

## a. (1.5 marks) 95% CI for the population total \( t \)

The stratified estimator of the population total is \( \hat{t}_{\text{str}} = \sum_{h=1}^3 N_h \bar{y}_h \)

Compute each contribution:
\[
\begin{aligned}
190(3.925) &= 745.75 \\
407(3.938) &= 1602.77 \\
811(3.942) &= 3196.96
\end{aligned}
\]

thus: \( \hat{t}_{\text{str}} = 745.75 + 1602.77 + 3196.96 = 5545.48 \)

### Variance of \( \hat{t}_{\text{str}} \)

For stratified sampling,
\[
Var(\hat{t}_{\text{str}})
= \sum_{h=1}^3 N_h^2 \left(1 - \frac{n_h}{N_h}\right)\frac{s_h^2}{n_h}
\]

Now lets compute each stratum’s variance term:

- **Stratum 1:** \( 190^2 \left(1 - \frac{21}{190}\right)\frac{0.037^2}{21} \approx 2.093 \)

- **Stratum 2:** \( 407^2 \left(1 - \frac{14}{407}\right)\frac{0.052^2}{14} \approx 30.893 \)

- **Stratum 3:** \( 811^2 \left(1 - \frac{22}{811}\right)\frac{0.070^2}{22} \approx 142.519 \)

Total variance: \( Var(\hat{t}_{\text{str}}) \approx sum of stratum 1:3 \approx 175.505 \)

Standard error:
\(
SE(\hat{t}_{\text{str}}) = \sqrt{175.505} \approx 13.25
\)

Using the normal approximation (\(z_{0.975} = 1.96\)):

\(
\text{ME} = 1.96 \times 13.25 \approx 25.97
\)

### **95% CI for \( t \):**
\(
5545.48 \pm 25.97 = (5519.51,\; 5571.45)
\)

---

## b. (1.5 marks) 95% CI for the population mean \( \bar{y}_U \)

The stratified mean estimator is \(
\bar{y}_{\text{str}} = \frac{\hat{t}_{\text{str}}}{N}
= \frac{5545.48}{1408} \approx 3.939
\)

### Var of \( \bar{y}_{\text{str}} \)

\(
Var(\bar{y}_{\text{str}})
= \frac{1}{N^2}\operatorname{Var}(\hat{t}_{\text{str}})
= \frac{175.505}{1408^2}
\approx 0.0000885
\)

St error: \( SE(\bar{y}_{\text{str}}) \approx \sqrt{0.0000885} \approx 0.0094 \)

Margin of error: \( 1.96 \times 0.0094 \approx 0.0184 \)

### **95% CI for \( \bar{y}_U \):**
\( 3.939 \pm 0.0184 = (3.9206,\; 3.9574) \)

---

## Final Answers Summary

- **(a)** 95% CI for \( t \):  
\( (5519.51,\; 5571.45) \)

- **(b)** 95% CI for \( \bar{y}_U \):  
\( (3.9206,\; 3.9574) \)

