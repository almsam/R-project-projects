# Data 407 - Assignment 3:

### Samira Almuallim, 62197256, Data 407 2025WT2

---

### 1. (2 marks) Given a population \(Y_1, \dots, Y_N\), what is the variance of \( \hat{F}_n(t) \)?

**Answer: d**

\[
\left(1 - \frac{n}{N}\right)\frac{1}{n}\frac{N}{N-1} F_N(t)\big[1 - F_N(t)\big]
\]

Under SRS without replacement:
\[ Var(\bar{y}) = \left(1 - \frac{n}{N}\right)\frac{S^2}{n} \]
For a Bernoulli variable:
\[ S^2 = \frac{N}{N-1}F_N(t)\big[1 - F_N(t)\big] \]

Thus: **Ans: d**

---

### 2. (2 marks) Is the histogram an estimate of density?

**Answer: a. Yes**

---

### 3. (2 marks) Which of the following statements are true about the Jackknife?

**Answers: a, b, & d**

- **a. Bias reduction** – Jackknife can reduce bias in estimators
- **b. Variance estimation** – commonly used to estimate standard errors
- **c. Cross-validation** – incorrect - this is a different technique
- **d. Resampling** – Jackknife systematically leaves out observations

Thus: **Answers: a, b, & d**

---

### 4. (2 marks) In Bootstrapping, is resampling done with replacement?

**Answer: a. Yes**

Bootstrapping samples **w/ replacement** from the observed data to approximate the distribution

Thus: **Ans: a**

---

### 5. (2 marks) Mean of bootstrap sample mean

**Answer: b**

Each \( X_i^* \) is drawn from the empirical distribution, so:
\[
E(X_i^*) = \bar{x}
\]

Thus the mean remains unchanged.

Thus: **Ans: b**

\[
\frac{1}{n}\sum_{i=1}^n \left(x_i \right)
\]

---

### 6. (2 marks) Variance of bootstrap sample mean

**Answer: d**

\[
\frac{1}{n^2}\sum_{i=1}^n \left(x_i - \frac{1}{n}\sum_{j=1}^n x_j\right)^2
\]


- Each bootstrap draw has
\[
Var(X_i^*) = \frac{1}{n}\sum_{i=1}^n (x_i - \bar{x})^2
\]
- Averaging \( n \) i i d draws gives us
\[
Var(\bar{X}^*) = \frac{1}{n} Var(X_i^*)
= \frac{1}{n^2}\sum_{i=1}^n (x_i - \bar{x})^2
\]

Thus: **Our ans is: d**

\[\frac{1}{n^2}\sum_{i=1}^n \left(x_i - \frac{1}{n}\sum_{j=1}^n x_j\right)^2 \]

---

### 7. Jackknife derivation
---

### 7. Jackknife derivation

Let
\[
S = \sum_{i=1}^n (x_i - \bar{x})^2, \quad
t_n = \frac{S}{n-1}.
\]

The leave-one-out estimator is
\[
t_{(i)} =
\frac{1}{n-2}
\left(
S - \frac{n}{n-1}(x_i - \bar{x})^2
\right).
\]

The jackknife estimator is
\[
t'_n = n t_n - (n-1)\bar{t}_{(\cdot)}, \quad
\bar{t}_{(\cdot)} = \frac{1}{n}\sum_{i=1}^n t_{(i)}.
\]

so:

\[
t'_n =
n \frac{n-1}{s} -
(n-1)\frac{1}{n}
\sum_{i=1}^n
\frac{n-2}{S - \frac{n}{n-1}(x_i - \bar{x})^2}.
\]

so the jackknife estimator must be:

\[
n \frac{n-1}{S} -
\frac{(n-1)(n-2)}{n}
\sum_{i=1}^n
\frac{1}{S - \frac{n}{n-1}(x_i - \bar{x})^2}.
\]
