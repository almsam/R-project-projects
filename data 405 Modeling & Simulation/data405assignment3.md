
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

##### Lets compute the following:
\[
f_X(x)=\int_{0}^{\infty} f(x,y),dy=\int_{0}^{\infty} x e^{-x(1+y)},dy.
\]

First lets factor (x e^{-x}):
\[
f_X(x)=x e^{-x}\int_0^\infty e^{-x y},dy
= x e^{-x}\cdot\frac{1}{x}
= e^{-x},\qquad x\ge0.
\]

so our answer should end up as:
\[ \boxed
{f_X(x)=e^{-x},; x\ge0,} \]
which is an \[(\mathrm{Exp}(1)) \] density function


Thusly, the marginal density of X is:

\[
f_X(x)=\int_{0}^{\infty} x e^{-x(1+y)},dy.
\]

---

## Q3:

By definition,
\[
f_{Y\mid X}(y\mid x)=\frac{f(x,y)}{f_X(x)}
=\frac{x e^{-x(1+y)}}{e^{-x}}
= x e^{-x y},\qquad y\ge0.
\]

So
\[\boxed
{f_{Y\mid X}(y\mid x)=x e^{-x y},; y\ge0.}
\]

Now we compute the conditional expectation:

\[
\mathbb{E}[Y\mid X=x]=\int_0^\infty y , x e^{-x y},dy
= x\int_0^\infty y e^{-x y},dy.
\]

Use the known integral \[(\displaystyle\int_0^\infty y e^{-a y},dy=\frac{1}{a^2})\] for (a>0). Here (a=x), so

\[
\mathbb{E}[Y\mid X=x]=x\cdot\frac{1}{x^2}=\frac{1}{x}
\]

Thus
\[ \boxed
{\mathbb{E}[Y\mid X=x]=\dfrac{1}{x}.}
\]

---

## Q4:


##### Lets compute the following:


\[f_Y(y)=\int_{0}^{\infty} x e^{-x(1+y)},dx.\]

If (a=1+y>0) -- -- our integral becomes

\[\int_0^\infty x e^{-a x},dx.\]

A standard integral (or integrate by parts) gives

\[\int_0^\infty x e^{-a x},dx = \frac{1}{a^2}.\]

Thus with (a=1+y),

\[f_Y(y)=\frac{1}{(1+y)^2},\qquad y\ge0.\]

So the correct marginal df is
\[\boxed
{f_Y(y)=\dfrac{1}{(1+y)^2},; y\ge0.}
\]


