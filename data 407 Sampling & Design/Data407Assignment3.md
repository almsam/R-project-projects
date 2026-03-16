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

So: **Our ans is b or d** (as both seem identical at time of reading)

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

### 7. (3 marks) Smoking prevalence among female high school students

We have an **SRS of \(n=4\) schools** (PSUs) from a population of **\(N=29\) schools**.  
Within each selected school, a sample of female students was interviewed.

From the table:

- \( \sum M_i = 2550 \)
- \( \sum m_i = 100 \)
- \( \sum \hat{t}_i = 1099.5 \)
- \( \sum ( \hat{t}_i - M_i \hat{\bar{y}}_r )^2 = 17943 \)

## 1. Estimate of smoking proportion

The **ratio estimator for the population mean** is

\[
\hat{\bar{y}}_r = \frac{\sum \hat{t}_i}{\sum M_i}
\]

\[
\hat{\bar{y}}_r =
\frac{1099.5}{2550}
\approx 0.431
\]

Thus the **estimated smoking percentage** is **43.1%**

---

## 2. Variance of the ratio estimator

For one-stage cluster sampling with SRS of PSUs:

\(
\widehat{Var}(\hat{\bar{y}}_r) =
\frac{1}{\bar{M}_U^2}
\frac{1}{n}
\left(1-\frac{n}{N}\right)
\frac{\sum(\hat{t}_i-M_i\hat{\bar{y}}_r)^2}{n-1}
\)

where

\[
\bar{M}_U = \frac{\sum M_i}{n} = \frac{2550}{4} = 637.5
\]

Finite population correction:

\(
1-\frac{n}{N} =
1-\frac{4}{29} =
0.8621
\)

Find var t:

\(
\widehat{Var}(\hat{t}) =
\frac{1}{n}
\cdot
s^2_i
+\frac{1}{n*N}\sum_{}^{}M_i^2(1-m_i/M_i)(s_i^2/m_i)
\)

\(
\frac{1}{4}(1-\frac{4}{29})
\cdot 17943+\frac{614}{4*29}
\)

\(
\approx 3872.3
\)

Now compute:

\[
\widehat{Var}(\hat{\bar{y}}_r) =
\frac{var(\hat{t})}{{M}^2} = 
\frac{3872.3}{2550^2}
\]

\[
\widehat{Var}(\hat{\bar{y}}_r)
\approx 0.000595
\]

St err:

\[
SE(\hat{\bar{y}}_r) =
\sqrt{\widehat{Var}(\hat{\bar{y}}_r)} =
\sqrt{0.000595}
\approx 0.0244
\]

---

## 3. 95% Conf Int

Using the normal approximation:

\[
\hat{\bar{y}}_r \pm 1.96 \times SE
\]

Margin of error:

\[
1.96 \times 0.0244 \approx 0.047824 \approx 0.048
\]

Thus

\[
0.431 \pm 0.048
\]

**Our 95% CI for smoking proportion** \( (0.383,\;0.479) \)

---

### Final ans for 7

- **Estimated smoking percentage:** **43.1%**

- **95% CI: \(0.431 \pm 0.048\) , or \( (0.383,\;0.479) \)**

