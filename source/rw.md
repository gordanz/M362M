\<\<\<\<\<\<\< HEAD

=======

\def1{1}
\>\>\>\>\>\>\> 91a070cdbeffe01508c739729817437365c084e8

\<\<\<\<\<\<\< HEAD

\lhead{{Lecture 3:{Random Walks}}}
\chead{}
\rhead{\textbf{\thepage} of \textbf{\pageref{LastPage}}}
\rfoot{\textit{Last Updated:} \today}
\cfoot{}
  ------------- --------------------------------------
  Course:       Introduction to Stochastic Processes
  Term:         Spring 2019
  Instructor:   Gordan Žitković
  ------------- --------------------------------------

\vspace{5ex}
**Lecture 3**\
Random Walks

\bigskip
\setcounter{chapter}{3}
\thispagestyle{fancy}
\pagestyle{fancy}
=======

\lhead{{Lecture 3:{Random Walks}}}
\chead{}
\rhead{\textbf{\thepage} of \textbf{\pageref{LastPage}}}
\rfoot{\textit{Last Updated:} \today}
\cfoot{}
  ------------- --------------------------------------
  Course:       Introduction to Stochastic Processes
  Term:         Fall 2019
  Instructor:   Gordan Žitković
  ------------- --------------------------------------

\vspace{5ex}
**Lecture 3**\
Random Walks

\bigskip
\setcounter{chapter}{3}
\thispagestyle{fancy}
\pagestyle{fancy}
\>\>\>\>\>\>\> 91a070cdbeffe01508c739729817437365c084e8

Stochastic Processes
====================


Biased random walks
===================

If the steps of the random walk preferred one direction to the other,
the definition would need to be tweaked a little bit:

[\[def:biased-random-walk\]]{#def:biased-random-walk
label="def:biased-random-walk"} A stochastic process $\seqz{X}$ is said
to be a with parameter $p\in (0,1)$ if

1.  $X_0=0$,

2.  the random variables $\delta_1 = X_1-X_0$, $\delta_2 = X_2 - X_1$,
    ...are independent

3.  each $\delta_n$ is a , i.e., its distribution is given by
    $$\delta_n \sim \ndist{ -1 & 1}{ 1-p & p }$$

\<\<\<\<\<\<\< HEAD Could we reuse the sample space $\Omega$ to build a
biased random walk. Yes, we ======= Could we reuse the sample space
$\Omega$ to build a biased random walk? Yes, we \>\>\>\>\>\>\>
91a070cdbeffe01508c739729817437365c084e8 could, but we would need to
assign different probabilities to elementary outcomes. Indeed, if
$p=0.99$, the probability that all the increments $\delta$ take the
value $+1$ is larger than the probability that all steps take the value
$-1$. More generally, the sequence $\omega = (c_1,\dots, c_N)$
consisting of $n_1$ $1$s and $n_{-1}$ $-1$s should be assigned the
probability $p^{n_1} (1-p)^{n_{-1}}$. Only then will $\delta$s be
independent and distributed as $\ndist{ -1 & 1 }{ 1 - p & p}$, as
required.

We can still use this sample space to figure out distributions of
various random variables, but we cannot always simply "count and divide
by the size of $\Omega$" like we could when $p=\tot$. Sometimes it still
works, as the following example shows:

Let us try to compute the same probability as in Example
[\[exa:dist-Xn\]](#exa:dist-Xn){reference-type="ref"
reference="exa:dist-Xn"} above, namely $\PP[ X_n = k]$, but now in the
biased case.

\medskip
To simplify our lives, we can assume without loss of generality that
$n=N$, i.e., that nothing happens after $n$. We still need to identify
those $\omega = (c_1,\dots, c_T)$ for which $X_n(\omega)=k$, and it
turns out that the reasoning is the same as in the symmetric case. We
need exactly $n_1 = \tot
(n+k)$ of the $c$s to be equal to $1$ and exactly $n_{-1}=n-n_1$ of them
to be equal to $-1$. The lucky break is that each sequence with exactly
$n_1$ $1$s carries the same probability, namely $p^{n_1}(1-p)^{n_{-1}}$,
no matter where these $1$s are. In other words, it just happened that
all $\omega$ in the event $\set{X_n=k}$ have the same probability.
Therefore, the probability of $\set{X_n=k}$ is simply $p^{n_1}
(1-p)^{n-n_1}$ multiplied by the number of $\omega$s that constitute it.
We have already computed that in Example
[\[exa:dist-Xn\]](#exa:dist-Xn){reference-type="ref"
reference="exa:dist-Xn"} - the answer is $\binom{n}{n_1}$ - and, so
$$\PP[ X_n = k] = \begin{cases}
    \binom{n}{ (n+k)/2}\  p^{ (n+k)/2} (1-p)^{(n-k)/2}, &\text{ if $n+k$ is
    even,
    and}\\
    0, & \text{ otherwise.}
\end{cases}$$ As in the symmetric case, this also follows from the fact
that $\tot(X_n+n)$ is binomial, with parameters $n$ and $p$.

The Reflection Principle
========================

Counting trajectories in order to compute probabilities can be quite
powerful, as the following example shows. It also reveals a potential
weakness of the combinatorial approach: it works best when all $\omega$
are equally likely (i.e., when $p=\tot$ in the case of the random walk).

We start by asking a simple question; what is the typical record value
of the random walk, i.e., how far "up" does it typically get? Clearly,
the largest value it can attain is $T$ at time $T$, provided that all
coin tosses came up $+1$. This is, however, extremely unlikely - it
happens with probability $2^
{-T}$. On the other hand, this maximal value is at last $0$, since
$X_0=0$, already. A bit of thought reveals that any value between those
two extremes is possible, but it is not at all easy to compute their
probabilities.

More precisely, if $\{X_n\}$ is a simple random walk with time horizon
$T$. We define the $\seqz{M}$ by
$$M_n=\max(X_0,\dots, X_n),\ \efor 0 \leq n \leq T.$$ It turns out that
a nice counting trick - known as the - can help us compute the
distribution of $M_n$ for each $n$.

[\[pro:reflection\]]{#pro:reflection label="pro:reflection"} Let
$\{X_n\}_{0\leq n \leq T}$ be a simple symmetric random walk. For
$1 \leq n \leq T$, the support of the random variable
$M_n = \max(X_0,\dots, X_n)$ is $\{0,1,\dots, n\}$ and its probability
mass function is given by $$\label{equ:1D3A}
 \begin{split}
    \PP[M_n=k]&=\PP[X_n=k]+\PP[X_n=k+1] \\ &=
   \binom{n}{ \lfloor{\frac{n+k+1}{2}}\rfloor } 2^{-n},\  \efor
   k=\ft{0}{n},
 \end{split}$$ where $\lfloor x \rfloor$ denotes the largest integer
smaller than or equal to $x$.

As usual, we may assume without loss of generality that $n=T$ since the
values of $\delta_{n+1}, \dots, \delta_T$ do not affect $M_n$ at all.

We start by picking a level $l\in\set{0,1,\dots, n}$ and first compute
the probability $\PP[M_n\geq l]$. The symmetry assumption ensures that
all trajectories are equally likely, so we can do this by counting the
number of trajectories whose maximal level reached is at least $l$, and
then multiply by $2^{-n}$.

What makes the computation of $\PP[M_n \geq l]$ a bit easier than that
of $\PP[ M_n = l]$ is the following equivalence

$M_n\geq l$ if and only if $X_k=l$ for some $k$.

In words, the set of trajectories whose maximum is at least $l$ is
exactly the same as the set of trajectories that hit the level $l$ at
some time. Let us denote the set of $\omega$ with this property by
$A_l$, so that $\PP[ M_n \geq l] = \PP[A_l]$.

We can further split $A_l$ into three disjoint events $A_l^{>}$, $A_l^
{=}$ and $A_l^{<}$, depending on whether $X_n<l$, $X_n=l$ and $X_n>l$.
The idea behind the reflection principle is that $A_l^{>}$ and $A_l^
{<}$ have exactly the same number of elements. To see that that is,
indeed, true, we is take an $\omega\in A_l^{>}$ and denote by
$F(\omega)$ the *first time* the corresponding trajectory visits the
level $l$. After that, we flip the portion the trajectory between
$F(\omega)+1$ and $n$ around the level $l$. In terms of $\omega$, this
amounts to flipping the signs of its last $n-F(\omega)+1$ entries (see
Figure [\[fig:reflect\]](#fig:reflect){reference-type="ref"
reference="fig:reflect"} below). It is easy to see that this establishes
a bijection between the sets $A_l^{>}$ and $A_l^{<}$, making these two
sets equal in size.

\refstepcounter{picnumber}
![image](reflect.pdf)\

[\[fig:reflect.pdf\]]{#fig:reflect.pdf label="fig:reflect.pdf"}

\medskip
The punchline is that the trajectories in $A_l^{>}$ as well as in
$A_l^{=}$ are easy to count. For them, the requirement that the level
$l$ is hit at a certain point is redundant; if you are at or above $l$
at the very end, you must have hit $l$ at a certain point (if nothing
else, at time $n$). Therefore, $A_l^{>}$ is simply the family of those
$\omega$ whose final positions are somewhere strictly above $l$, and,
therefore, $$\begin{aligned}
     \PP[A_l^{>}] &= \PP[ X_n=l+1 \text{ or } X_n = l+2 \text{ or \dots or }
     X_n=n] = \sum_{k=l+1}^n \PP[X_n = k],\end{aligned}$$ and,
therefore, by the reflection principle, $$\begin{aligned}
    \PP[ A_l^{<}] = \PP[A_l^{>}] = \sum_{k=l+1}^n \PP[X_n=k].\end{aligned}$$
We still need to account for $A_l^{=}$, i.e., for the trajectories that
end up exactly at the level $l$. Just like above, $$\begin{aligned}
     \PP[ A_l^{=}] = \PP[X_n=l].\end{aligned}$$ Putting all of this
together, we get $$\begin{aligned}
    \PP[ A_l ] = \PP[ X_n=l] + 2 \sum_{k=l+1}^n \PP[X_n=k],\end{aligned}$$
so that $$\begin{aligned}
    \PP[ M_n = l ] &= \PP[ M_n \geq l] - \PP[ M_n \geq l+1] = \PP
    [A_l] - \PP
    [A_{l+1}]\\ & = \PP[X_n=l] + \PP[X_n=l+1]. \qedhere
    \end{aligned}$$

To show the versatility of the reflection principle, let us use it to
solve a classical problem in combinatorics.

[\[exa:ballot\]]{#exa:ballot label="exa:ballot"} Suppose that two
candidates, Daisy and Oscar, are running for office, and $T \in\N$
voters cast their ballots. Votes are counted the old-fashioned way,
namely by the same official, one by one, until all $T$ of them have been
processed. After each ballot is opened, the official records the number
of votes each candidate has received so far. At the end, the official
announces that Daisy has won by a margin of $k>0$ votes, i.e., that
Daisy got $(T+k)/2$ votes and Oscar the remaining $(T-k)/2$ votes. What
is the probability that at no time during the counting has Oscar been in
the lead?

\bigskip
We assume that the order in which the official counts the votes is
completely independent of the actual votes, and that each voter chooses
Daisy with probability $p\in (0,1)$ and Oscar with probability $q=1-p$.
For $0 \leq n \leq T$, let $X_n$ be the number of votes received by
Daisy *minus* the number of votes received by Oscar in the first $n$
ballots. When the $n+1$-st vote is counted, $X_n$ either increases by
$1$ (if the vote was for Daisy), or decreases by 1 otherwise. The votes
are independent of each other and $X_0=0$, so $X_n$, $0\leq n \leq T$ is
a simple random walk with the time horizon $T$. The probability of an
up-step is $p\in (0,1)$, so this random walk is not necessarily
symmetric. The ballot problem can now be restated as follows:

*For a simple random walk $\set{X_n}_{0\leq n \leq T}$, what is the
probability that $X_n\geq 0$ for all $n\in\set{\ft{0}{T}}$, given that
$X_T=k$?*

The first step towards understanding the solution is the realization
that the exact value of $p$ does not matter. Indeed, we are interested
in the conditional probability $\PP[ F|G]=\PP[F\cap G]/\PP[G]$, where
$F$ denotes the set of $\omega$ whose corresponding trajectories always
stay non-negative, while the trajectories corresponding to $\omega\in G$
reach $k$ at time $n$. Each $\omega \in G$ consists of exactly $(T+k)/2$
up-steps ($1$s) and $(T-k)/2$ down steps ($-1$s), so its probability
weight is equal to $p^{ (T+k)/2} q^{(T-k)/2}$. Therefore, with $\# A$
denoting the number of elements in the set $A$, we get $$\begin{aligned}
 \PP[ F|G]=\frac{\PP[F\cap G]}{\PP[G]}=\frac{\# (F\cap G) \ p^{
    (T+k)/2} q^{(T-k)/2}}{ \# G \ p^{ (T+k)/2}
  q^{(T-k)/2}}=\frac{\#(F\cap G)}{\# G}.\end{aligned}$$ This is quite
amazing in and of itself. This conditional probability does not depend
on $p$ at all!

\medskip
Since we already know how to count the number of elements in $G$ (there
are $\binom{T}{(T+k)/2}$), "all" that remains to be done is to count the
number of elements in $G\cap F$. The elements in $G \cap F$ form a
portion of all the elements in $G$ whose trajectories don't hit the
level $l=-1$; this way, $\#(G\cap F)=\#G-\#H$, where $H$ is the set of
all paths which finish at $k$, but cross (or, at least, touch) the level
$l=-1$ in the process. Can we use the reflection principle to find
$\# H$? Yes, we can. In fact, you can convince yourself that the
reflection of any trajectory corresponding to $\omega \in H$ around the
level $l=-1$ after its last hitting time of that level produces a
trajectory that starts at $0$ and ends at $-k-2$, and vice versa. The
number of paths from $0$ to $-k-2$ is easy to count - it is equal to
$\binom{T}{(T+k)/2+1}$. Putting everything together, we get
$$\PP[ F|G]=\frac{\binom{T}{n_1}-\binom{T}{n_1+1}}
{\binom{T}{n_1}}=\frac{k+1}{n_1+1},\text{ where }n_1=\frac{T+k}{2}.$$
The last equality follows from the definition of binomial coefficients
$\binom{T}{i}=\frac{T!}{i!(T-i)!}$.

The Ballot problem has a long history (going back to at least 1887) and
has spurred a lot of research in combinatorics and probability. In fact,
people still write research papers on some of its generalizations. When
posed outside the context of probability, it is often phrased as "*in
how many ways can the counting be performed ...*" (the difference being
only in the normalizing factor $\binom{T}{n_1}$ appearing in Example
[\[exa:ballot\]](#exa:ballot){reference-type="ref"
reference="exa:ballot"} above). A special case $k=0$ seems to be even
more popular - the number of $2n$-step paths from $0$ to $0$ never going
below zero is called the and equals to $$\label{equ:Catalan}
 \begin{split}
   C_n=\frac{1}{n+1} \binom{2n}{n}.
 \end{split}$$

\bigskip
Here is another nice consequence of the reflection principle, i.e., its
application to the running maximum. Our formula for the distribution of
the maximum of the random walk on $\set{0,\dots, T}$ can be used to
answer the following question:

*What is the probability that the random walk will reach the level $l$
in $T$ steps (or fewer)?*

Indeed, $\seq{X}$ will reach $l$ during the first $T$ steps if and only
if $M_T\geq l$. Therefore the answer to the above question is
$\PP[ M_T \geq l] = \PP[X_T\geq l] + \PP[ X_T \geq l+1]$. A special case
is the following:

*What is the probability that $X$ will stay at or below $0$ throughout
the interval $\set{0,\dots, T}$?*

Clearly, $\seq{X}$ will stay non-positive if it never hits the level
$1$. The probability of that is $\PP[M_T = 0] = \PP[X_T=0]+\PP[X_T=1]$.
What happens to this expression as $T$ get larger and larger. In other
words, if I give my walk enough time, can I guarantee that it will reach
the level $1$? Let us compute. For simplicity, let us consider only even
time horizons $T=2N$, so that $\PP[M_T=0] = \PP[X_{2N}=0]$. Using the
formula for the distribution of $X_{2N}$, we get $$\begin{aligned}
     \PP[ X_{2N}=0] = \binom{2N}{N} 2^{-2N},
 \end{aligned}$$ so our problem reduces to the investigation of the
behavior of $\binom{2N}{N} 2^{-2N}$, as $N$ gets larger and larger,
i.e., $$\begin{aligned}
 \label{equ:Sti}
    \lim_{N\to\infty} \binom{2N}{N} 2^{-2N}.
 \end{aligned}$$ To evaluate this limit, we need to know about the
precise asymptotics of $N!$, as $N\to\infty$:

We have $$\begin{aligned}
N! \sim \sqrt{2 \pi N} \left( \tf{N}{e} \right)^N,\end{aligned}$$ where
$A_N \sim B_N$ means $\lim_{N\to\infty} \tf{A_N}{B_N}=1$.

Let us use Stirling's formula in
[\[equ:Sti\]](#equ:Sti){reference-type="eqref" reference="equ:Sti"}:
$$\begin{aligned}
 \binom{2N}{N} 2^{-2N} & = 
 \frac{ (2N)!}{N! N!} 2^{-2N} \sim 
 \frac{
     \sqrt{2\pi 2N} (2N/e)^{2N}
 }{
 \sqrt{2\pi N} (N/e)^{N} \sqrt{2\pi N} (N/e)^{N}
 } 2^{-2N} \\
 &= \oo{\sqrt{\pi N}}
 \end{aligned}$$ Therefore, $$\begin{aligned}
    \lim_{N\to\infty} \binom{2N}{N} 2^{-2N}  = 0,
 \end{aligned}$$ and it follows that the answer to our question is
positive:

*Yes, the simple symmetric random walk will reach the level $1$, with
certainty, given enough time.*

By symmetry, the level $1$ can be replaced by $-1$. Also, once we hit
$1$, the random walk "renews itself" (this property is called the Strong
Markov Property and we will talk about it later), so it will eventually
hit the level $2$, as well. Continuing the same way, we get the
following remarkable result

The symple symmetric random walk will visit any point in
$\Z = \set{ \dots, -2, -1, 0, 1, 2, \dots}$, eventually.
