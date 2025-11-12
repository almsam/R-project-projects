
# Data 405 Assignment 3


Recall the joint pdf:
\[
f(x,y)=
\begin{cases}
x e^{-x(1+y)}, & x\ge0,\ y\ge0,[4pt]
0,&\text{otherwise.}
\end{cases}
\]

---

## Q1:
(P(X>1,,Y>1))

The probability that 1 component survives more then 1 unit of time is given by the integral of the density from 1 to infinity, thus:

\[
P(X>1,Y>1)=\int_{x=1}^{\infty}\int_{y=1}^{\infty} x e^{-x(1+y)},dy,dx.
\]

##### Time to solve it:

Step 1: inner integral (over (y)):
\[
\int_{y=1}^{\infty} e^{-x(1+y)},dy
= e^{-x}\int_{1}^{\infty} e^{-x y},dy
= e^{-x}\left[\frac{e^{-xy}}{-x}\right]_{y=1}^{y=\infty}
= e^{-x}\cdot\frac{e^{-x}}{x}
= \frac{e^{-2x}}{x}.
\]

multiply by the factor (x) from the integrand:
\[ x\cdot \frac{e^{-2x}}{x}= e^{-2x}. \]

Now we integrate x from 1 to (inf) -- thats our outer integral:
\[
P(X>1,Y>1)=\int_{1}^{\infty} e^{-2x},dx
= \left[-\tfrac{1}{2}e^{-2x}\right]_{1}^{\infty}
= \frac{1}{2}e^{-2}.
\]

So the probability that both components last at least 1 unit of time is

\[ \boxed
{P(X>1,Y>1)=\dfrac{e^{-2}}{2}.}
\]

---

## Q2:
