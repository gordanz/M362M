--- 
title: Lecture notes for \"Introduction to Stochastic Processes\"
author: "Gordan Zitkovic"
date: "last updated -  2020-10-30"
documentclass: book
github-repo: gordanz/M362M
description: "A set of lecture notes for *M362M: Introduction to Stochastic Processes*"
site: bookdown::bookdown_site
output: 
  bookdown::gitbook
---



# Preface {-}
<img src="pics/title.png" width = 400 style="position:absolute;top:0px;left:50%;" />


This is an always-evolving set of lecture notes for **Introduction to Stochastic Processes (M362M)**. It should start with me explaining what stochastic processes are. Instead, here is a list of several questions you will be able to give answers to when you complete this course. 


**Question 1** In a simplistic model, the price of a  share of a stock goes either up or down by $\$1$ each day, with probability $1/2$. You own a single share whose value today is $\$100$, so that its tomorrow's price will be $\$101$ or $\$99$ with probability $1/2$, etc. Your strategy is to hold onto your share until one of the following two things happen: you go bankrupt (the stock price hits $0$), or you make a $\$50$ dollar profit (the stock price hits $\$150$.) 

1. How likely is it that you will make a profit before you go bankrupt?
2. How long will it take? 
3. Is it possible that it takes forever, i.e., that the stock price hovers between $\$1$ and $\$149$ forever? 

**Question 2.** A person carrying a certain disease infects a random number of people in a week, and then stops being infectious. Each of the infected people transmits the disease in the same way, etc. Suppose that the number of people each (infectious) individual infects is either $0$, $1$ or $2$ or $3$, each with probability $1/4$  and that different infectious individuals may infect different number of people and behave independently of each other.

1. What is the probability that the disease will ever be eradicated?
2. What is the probability that every single individual in the  population of $328,000,000$ will eventually be infected?

**Question 3.** In a game of tennis, Player $1$ wins against Player $2$ in each rally (the smallest chunk of the match that leads to point, i.e., to a score change from $15-30$ to $30-30$, for example) with probability $p$. 
What is the probability that Player $1$ wins 

1. a game (the chunk of the match that leads to a score change such as $5-3$ to $6-3$ within a set)?
2. a set? the entire match?
4. Is the game of tennis set up in such a way that is *amplifies* or *reduces* the difference in skill between players?

<img src="pics/knight1.png" width="35%" style="float:right; padding:10px" style="display: block; margin: auto;" />

**Question 4.** 
A knight starts in the lower left corner of the chess board and starts moving ``randomly''. That means that from any position, it chooses one of the possible (legal) moves and takes it, with all legal moves having the same probability. It keeps doing the same thing until it comes back to the square it started from. 

1. What is the expected number of moves the knight will make before it returns to "square one"?
2. How about the same problem, but using a different chess piece? Which one do you think will come back is the smallest (expected) number of steps?
3. (\*) How about the same problem, but until *all* squares have been visited at least once?

**Question 5.** How does Google search work?

<!--chapter:end:index.Rmd-->


# An intro to R and RStudio {#intro}

## Setting up an R environment on your computer

### Installing R

Learning basic R is an important part of this course, and the first order of business is to download and install an R distribution on your personal computer. We will be using RStudio as an IDE (integrated development environment). Like R itself, it is free and readily available for all major platforms. To download R to your computer, go to
[https://cloud.r-project.org](https://cloud.r-project.org) and 
download the version of R for your operating system (Windows, Mac or Linux). If you are on a Mac, you want the "Latest release" which, at the time of writing, is 4.0.2. On Windows, follow the link "install R for the first time".  We are not going to do any cutting edge stuff in this class, so an older release should be fine, too, if you happen to have it already installed on your system. Once you download the installation file (.pkg on a Mac or .exe on Windows), run it and follow instructions. If you are running Linux, you don't need me to tell you what to do. Once it is successfully installed, **don't run the installed app**. We will use RStudio for that.

### Installing RStudio

To install RStudio, go to [https://rstudio.com/products/rstudio/download/](https://rstudio.com/products/rstudio/download/). There are several versions to choose from - the one you are looking for is "RStudio desktop - Free". After you download and install it, you are ready to run it. When it opens, you will see something like this

<img src="pics/RStudio_IDE.png" width="100%" style="padding:10px" style="display: block; margin: auto;" />

The part on the left is called the *console* and that is (one of the places) where you enter commands. Before you do, it is important to adjust a few settings. Open the options window by navigating to to Tools->Global Options. In there, uncheck "Restore .RData into workspace on startup" and set "Save workspace to .RData on exit" to "Never", as shown below:
<img src="pics/Restore_RData.png" width="75%" style="margin-left: 12.5%;margin-right:12.5%; padding:10px" style="display: block; margin: auto;" />

This way, R will not pollute your environment with values you defined two weeks ago and completely forgot about. These settings are really an atavism and serve no purpose (for users like us) other than to introduce hard-to-track bugs. 

There are many other settings you can play with in RStudio, but the two I mentioned above are the only ones that I really recommend setting as soon as you install it. 


### Installing basic packages

Finally, we need to install several R packages we will be using (mostly implicitly) during the class. First, run the following command in your console
```markdown
install.packages( "tidyverse")
```
This will install a number of useful packages and should only take about a minute or two. The next part is a bit longer, and can take up to 15 minutes if you have a slow computer/internet connection.
You only have to do it once, though. Skip both steps involving `tinytex` below if you have LaTeX already installed on your system^[it may interfere with your existing installation].  Start with 
```markdown
install.packages("tinytex")
```
followed by 

```markdown
tinytex::install_tinytex()
```
Note that if you go to the top right corner of each of the code blocks (gray boxes) containing instructions above, an icon will appear. If you click on it, it will copy the content of the box into your clipboard, and you can simply paste it into RStudio. You can do that with any code block in these notes.

## Learning the  basics of R

Once R and RStudio are on your computer, it is time to get acquainted with the basics of R. This class is not about the finer points of R itself, and I will try to make your R experience as smooth as possible. After all, R is a tool that will help us explore and understand stochastic processes. Having said  that, it is important to realize that R is a powerful programming language specifically created for statistical and probabilistic applications. Some knowledge of R is a valuable skill to have in today's job market, and you should take this opportunity to learn it. The best way, of course, is by using it, but before you start, you need to know the very basics. Don't worry, R is very user friendly and easy to get started in. In addition, it has been around for a long time (its predecessor S appeared in 1976) and is extremely well documented -  google *introduction to R* or a similar phrase, and you will get lots of useful hits. 

My plan is to give you a bare minimum in the next few paragraphs, and then to explain additional R concepts as we need them. This way, you will not be overwhelmed right from the start, and you will get a bit of a mathematical context as you learn more. Conversely, learning R commands will help with the math, too.

### The console, Scripts and R Notebooks

There at least  three different ways of inputting commands into R - through console, scripts and R-notebooks.  

**The console**, as I already mentioned, is a window in RStudio where you can enter your R commands one by one. As a command is entered (and enter pressed) R will run it and display the result below. A typical console session looks like this
<img src="pics/console_session.png" width="100%" style="padding:10px" style="display: block; margin: auto;" />
If you define a variable in a command, it will be available in all the subsequent commands. This way of interacting with R is perfect for quick-and-dirty computations and, what is somewhat euphemistically called "prototyping". In other words, this way you are using R as a calculator. There is another reason why you might be using the console. It is perfect for package installation and for help-related commands. If you type `help('log')`, the output will appear in the `Help` pane on the right. You can also see all the  available variables in the `Environment` pane on the (top) right. 

As your needs increase, you will need more complex (and longer) code to meet them. This is where **scripts** come in. They are text files (but have the extension `.R`) that hold R code. Scripts can run as a whole, and be saved for later. To create a new script, go to File->New File->R Script. That will split your RStudio window in two:
<img src="pics/script_console.png" width="100%" style="padding:10px" style="display: block; margin: auto;" />
The top part will become a script editor, and your console will shrink to occupy the bottom part. You can write you code in there, edit and update it, and then run the whole script by clicking on Source, or pressing the associated shortcut key. 

Inspired by Python Jupyter notebooks, **R notebooks** are a creature somewhere between scripts and the console, but also have some features of their own. 
An R notebook is nothing other than a specially formatted text file which contains *chunks* of R code mixed with regular text. You can think of these chunks as mini scripts. What differentiates them from scripts is that chunks can be executed (evaluated) and the output becomes a part of the notebook:
<img src="pics/notebooks.png" width="100%" style="padding:10px" style="display: block; margin: auto;" />
R notebooks are R's implementation of  *literate programming*. The idea is that documentation should be written at the same time as the program itself. As far as this course if concerned, R notebooks are just the right medium for homework and exam submission. You can run code and provide the interpretation of its output in a single document. See [here](other/Homework-instructions.html) for more information.

Each chapter in these lecture notes is an R notebook!

### Asking for help
The most important thing about **learning R** (and many other things, for that matter) is knowing whom (and how) to ask for help. Luckily, R is a well established language, and you can get a lot of information by simply googling your problem. For example, if you google `logarithm in R` the top hit (at the time of writing) gives a nice overview and some examples. 

Another way to get information about a command or a concept in R is to use the command `help`. For example, if you input `help("log")` or `?log` in your console, the right hand of your screen will display information on the function `log` and some of its cousins. Almost every help entry has examples at the bottom, and that is where I always go first. 

### Vectors {#vectors}

Objects we will be manipulating in this class are almost exclusively vectors and matrices. The simplest vectors are those that have a single component, in other words, numbers. In R, you can assign a number to a variable using two different notations. Both

```r
a <- 1
```
and

```r
a = 1
```
will assign the value $1$ to the variable `a`. If you want to create a longer vector, you can use the **concatenation operator** `c` as follows:

```r
x = c(1, 2, 3, 4)
```
Once you evaluate the above in your console, the value of `x` is stored and you can access it by using the command `print`

```r
print(x)
## [1] 1 2 3 4
```

or simply evaluating `x` itself:

```r
x
## [1] 1 2 3 4
```
Unlike all code blocks above them, the last two contain both input and output. It is standard not to mark the output by any symbol (like the usual `>`), and to mark the output by `##` which otherwise marks comments. This way, you can copy any code block from these notes and paste it into the console (or your script) without having to modify it in any way. Try it!

We built the vector `x` above by concatenating four numbers (vectors of length 1). You can concatenate  vectors of different sizes, too:

```r
a = c(1, 2, 3)
b = c(4, 5, 6)
(x = c(a, b, 7))
## [1] 1 2 3 4 5 6 7
```
You may be wondering why I put `x = c(a,b,7)` in parentheses. Without them, `x` would still become (1,2,3,4,5,6,7), but its value would not be printed out. A statement in parentheses is not only evaluated, but its result is also printed out. This way, `(x = 2+3)` is equivalent to `x = 2+3` followed by `x` or `print(x)`. 


Vectors can contain things other than numbers. Strings, for example:

```r
(x = c("Picard", "Data", "Geordi"))
## [1] "Picard" "Data"   "Geordi"
```
If you need a vector consisting of consecutive numbers, use the colon `:` notation:

```r
1:10
##  [1]  1  2  3  4  5  6  7  8  9 10
```
For sequences of equally spaced numbers, use the command `seq` (check its help for details)

```r
seq(from = 5, to = 20, by = 3)
## [1]  5  8 11 14 17 20
```
An important feature or R is that many of its functions are **vectorized**. That means that if you give such a function a  vector as an argument, the returned value will be a vector of results of that operation performed element by element. For example 

```r
x = c(10, 20, 30)
y = c(2, 4, 5)
x + y
## [1] 12 24 35
x * y
## [1]  20  80 150
x^2
## [1] 100 400 900
cos(x)
## [1] -0.8390715  0.4080821  0.1542514
```
The vectors do not need to be of the same size. R uses the **recycling rule** -
it recycles the values of the shorter one, starting from the beginning, until
its size matches the longer one:

```r
x = c(10, 20, 30, 40, 50, 60)
y = c(1, 3)
x + y
## [1] 11 23 31 43 51 63
```
The case where the shorter vector is of length 1 is particularly useful:

```r
x = c(10, 20, 30, 40)
x + 1
## [1] 11 21 31 41
x * (-2)
## [1] -20 -40 -60 -80
```
Extracting parts of the vector is accomplished by using the **indexing** operator `[]`. Here are some examples (what do negative numbers do?)

```r
x = c(10, 20, 30, 40, 50)
x[1]
## [1] 10
x[c(1, 2)]
## [1] 10 20
x[-1]
## [1] 20 30 40 50
x[-c(3, 4)]
## [1] 10 20 50
x[1:4]
## [1] 10 20 30 40
x[c(1, 1, 2, 2, 5, 4)]
## [1] 10 10 20 20 50 40
```
People familiar with Python should be aware of the following two differences: 1. indexing starts at 1 and not 0, and 2. negative indexing removes components; it does not start counting from the end!

It is important to note that the thing you put inside `[]` needs to be a vector itself. The above examples all dealt with numerical indices, but you can use logical indices, too. A variable is said to be **logical** or **Boolean** if it can take only one of the two values `TRUE` or `FALSE`. A vector whose components are all logical, are called, of course, logical vectors. You can think of logical indexing as the operation where you go through your original vector, and choose which components you want to keep (`TRUE`) and which you want the throw away (`FALSE`). For example

```r
x = c(10, 20, 30, 40, 50)
y = c(TRUE, FALSE, FALSE, TRUE, TRUE)
x[y]
## [1] 10 40 50
```
This is especially useful when used together with the **comparison operators**. The expressions like `x < y` or `x == y` are  operators^[be careful, though.  The expression `x = y` is not the same as `x == y`. It does not return a logical value - it assigns the value of `y` to `x`] in R, just like `x + y` or `x / y`. The difference is that `<` and `==` return logical values. For example

```r
1 == 2
## [1] FALSE
3 > 4
## [1] FALSE
3 >= 2
## [1] TRUE
```
These operators are vectorized, so you can do things like this

```r
x = c(1, 2, 3, 4, 5)
y = c(1, 3, 3, 2, 5)
x == y
## [1]  TRUE FALSE  TRUE FALSE  TRUE
```
or, using recycling,

```r
x = c(1, 2, 3, 4, 5)
x > 3
## [1] FALSE FALSE FALSE  TRUE  TRUE
```
Let's combine that with indexing. Suppose that we want to keep only the values greater than 4 in the vector `x`. The vector `y = ( x > 4 )` is going to be of the same length as `x` and contain logical values.
When we index `x` using it, only the values of `x` on positions where `x > 4` will survive, and these are exactly the values we needed:

```r
x = c(3, 2, 5, 3, 1, 5, 6, 4)
y = (x > 4)
x[y]
## [1] 5 5 6
```
or, simply,

```r
x[x > 4]
## [1] 5 5 6
```
Indexing can be used to set the values of a vector just as easily

```r
x = c(10, 20, 30, 40, 50)
x[2:4] = c(0, 1, 2)
x
## [1] 10  0  1  2 50
```
Recycling rules apply in the same way as above

```r
x = c(10, 20, 30, 40, 50)
x[c(1, 2, 5)] = 7
x
## [1]  7  7 30 40  7
```

### Matrices

A matrix in R can be created using the command `matrix`. The unusual part is that the input is a vector and R populates the components of the matrix by filling it in column by column or row by row. As always, an example will make this clear

```r
x = c(1, 2, 3, 4, 5, 6)
(A = matrix(x, nrow = 2, ncol = 3, byrow = TRUE))
##      [,1] [,2] [,3]
## [1,]    1    2    3
## [2,]    4    5    6
```

The first argument of the function `matrix` is the vector which contains all the values. If you want a matrix with m rows and n columns, this vector should be of size $m n$. The arguments `ncol` and `nrow` are self-explanatory, and `byrow` is a logical argument which signals whether to fill by columns or by rows. Here is what happens when we set `byrow = FALSE`

```r
x = c(1, 2, 3, 4, 5, 6)
(A = matrix(x, nrow = 2, ncol = 3, byrow = FALSE))
##      [,1] [,2] [,3]
## [1,]    1    3    5
## [2,]    2    4    6
```
Accessing components of a matrix is as intuitive as it gets

```r
(A = matrix(c(1, -1, 7, 2), nrow = 2, ncol = 2))
##      [,1] [,2]
## [1,]    1    7
## [2,]   -1    2

A[1, 2]
## [1] 7
```
Note that I did not use the argument `byrow` at all. In such cases, R always uses the default value (documented in the function's help). For `matrix` the default value of `byrow` is `FALSE`, i.e., it fills the matrix column by column. This is not what we usually want because we tend to think of matrices as composed of rows. Moral: do not forget `byrow = TRUE` if that is what you, indeed, want. 

Usual matrix operations can be performed in R in the obvious way

```r
(A = matrix(c(1, -1, 7, 2), nrow = 2, ncol = 2))
##      [,1] [,2]
## [1,]    1    7
## [2,]   -1    2
(B = matrix(c(2, 2, -3, -4), nrow = 2, ncol = 2))
##      [,1] [,2]
## [1,]    2   -3
## [2,]    2   -4
A + B
##      [,1] [,2]
## [1,]    3    4
## [2,]    1   -2
```
You should be careful with matrix multiplication. The naive operator `*` yields a matrix, but probably not the one you want (what does `*` do?)

```r
(A = matrix(c(1, 2, 0, 1), nrow = 2, ncol = 2))
##      [,1] [,2]
## [1,]    1    0
## [2,]    2    1
(B = matrix(c(3, 5, 1, 0), nrow = 2, ncol = 2))
##      [,1] [,2]
## [1,]    3    1
## [2,]    5    0
A * B
##      [,1] [,2]
## [1,]    3    0
## [2,]   10    0
```
If you want the matrix product, you have to use `%*%`

```r
A %*% B
##      [,1] [,2]
## [1,]    3    1
## [2,]   11    2
```

### Functions

The following syntax is used to define functions in R:

```r
my_function = function(x, y, z) {
    return(x + y + z)
}
```
The function `my_function` returns the sum of its arguments. Having defined it, as above, we can use it like this

```r
my_function(1, 3, 9)
## [1] 13
```
Neither the output nor the arguments of a function in R are restricted to numbers. Our next example function, named `winners`, takes two vectors as arguments and returns a  vector. Its components are those components of the first input vector (`x`) that are larger than the corresponding components of the second input vector (`y`)

```r
winners = function(x, y) {
    z = x > y
    return(x[z])
}
winners(c(1, 4, 5, 6, 2), c(2, 3, 3, 9, 2))
## [1] 4 5
```
Note how we used several things we learned above in this function. First, we defined the logical vector which indicates where `x` is larger than `y`. Then, we used logical indexing to return only certain components of `x`. 

### If-else statements

Our final element of R is its `if-else` statement. The syntax of the `if` statement is

```r
if (condition) {
    statement
}
```
where `condition` is anything that has a logical value, and statement is any R statement. First R evaluates `condition`. If it is true, it runs `statement`. If it is false, nothing happens. If you want something to happen if (and only if) your condition is false, you need an `if-else` statement:

```r
if (condition) {
    statement1
} else {
    statement2
}
```
This way, `statement1` is evaluated when `condition` is true and `statement1` when it is false. Since conditions inside the `if` statement return logical values, we can combine them using *ands*, *ors* or *nots*. The R notation for these operations is &, | and !  respectively, and to remind you what they do, here is a simple table

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> x </th>
   <th style="text-align:left;"> y </th>
   <th style="text-align:left;"> x &amp; y (and) </th>
   <th style="text-align:left;"> x | y (or) </th>
   <th style="text-align:left;"> !x (not) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> FALSE </td>
   <td style="text-align:left;"> FALSE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FALSE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> FALSE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FALSE </td>
   <td style="text-align:left;"> FALSE </td>
   <td style="text-align:left;"> FALSE </td>
   <td style="text-align:left;"> FALSE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
</tbody>
</table>


Let's put what we learned about functions and if-else statements together to write a function `distance_or_zero` whose arguments are coordinates `x` and `y` of a point in the plane, and whose output is  the distance from the point (x,y) to the origin if this distance happens to be between 1 and 2, and  and 0 otherwise. We will use similar functions later when we discuss Monte Carlo methods:

```r
distance_or_zero = function(x, y) {
    distance = sqrt(x^2 + y^2)
    if (distance <= 2 & distance >= 1) {
        return(distance)
    } else {
        return(0)
    }
}
distance_or_zero(1.2, 1.6)
## [1] 2
distance_or_zero(2, 3)
## [1] 0
```


## Problems

Here are several simple problems. Their goal is to give you an idea of exactly how much R is required to get started in this course. 

<div class="problem">

Compute the following (your answer should be a decimal number):
  
  a) $1/238746238746$ 
  b) $2^{45}$
  c) $3^{28}$ 
  d) $\sqrt{15}$
  e) $\cos(\pi/8)$w
  f) $e^2$
  g) $\log(2)$ (the base is $e$)
  h) $\log_{10}(2)$ (the base is $10$)
  i) $\sqrt[3]{ \frac{1342.16-2.18}{(3 \pi +4.12)^2}}$
  
Note: some of the answers will look like this `3.14e+13`. If you do not know what that means, google *E notation*.
</div>
<div class="solution">

Remember, parentheses around the whole expression tell R to print out the result


```r
(1/238746238746)
## [1] 0.000000000004188548
(2^(45))  # this is the same as 2**45
## [1] 35184372088832
(3^(28))
## [1] 22876792454961
(sqrt(15))
## [1] 3.872983
(cos(pi/8))
## [1] 0.9238795
(exp(2))
## [1] 7.389056
(log(2))
## [1] 0.6931472
(log10(2))
## [1] 0.30103
(((1342.16 - 2.18)/(3 * pi + 4.12)^2)^(1/3))
## [1] 1.940222
```
</div>

<div class="problem">

1. Define two variables $a$ and $b$ with values $3$ and $4$ and "put" their product into a variable called $c$. Output the value of $c$.

2. Define two vectors $x$ and $y$ of length $3$, such that the components of $x$ are $1,2,3$ and the components of $y$ are $8,9,0$. Ouput their (componentwise) sum.

3. Define a $2\times 2$ matrix $A=\begin{pmatrix} 1 & 2 \\ -1 & 3 \end{pmatrix}$.

4. Compute the matrix square $A^2$. 
</div>
<div class="solution">


```r
a = 3
b = 4
(c = a * b)
## [1] 12

x = c(1, 2, 3)
y = c(8, 9, 0)
(x + y)
## [1]  9 11  3

(A = matrix(c(1, 2, -1, 3), byrow = TRUE, nrow = 2))
##      [,1] [,2]
## [1,]    1    2
## [2,]   -1    3

(A %*% A)
##      [,1] [,2]
## [1,]   -1    8
## [2,]   -4    7
```

</div>

<div class="problem">

1. Construct a vector $x$ which contains all numbers from $1$ to $100$.

2. Construct a vector $y$ which contains *squares* of all numbers between $20$ and $2000$.

3. Construct a vector $z$ which contains only those components of $y$ whose values are between $400,000$ and $500,000$.

4. Compute the average (arithmetic mean) of all the components of $z$. There is an R function that does that for you - find it!
</div>
<div class="solution">

<part> 1. </part>


```r
x = 1:100
```

<part> 2. </part>


```r
y = (20:2000)^2
```


<part> 3. </part>


```r
(z = y[y > 400000 & y < 500000])
##  [1] 400689 401956 403225 404496 405769 407044 408321 409600 410881 412164
## [11] 413449 414736 416025 417316 418609 419904 421201 422500 423801 425104
## [21] 426409 427716 429025 430336 431649 432964 434281 435600 436921 438244
## [31] 439569 440896 442225 443556 444889 446224 447561 448900 450241 451584
## [41] 452929 454276 455625 456976 458329 459684 461041 462400 463761 465124
## [51] 466489 467856 469225 470596 471969 473344 474721 476100 477481 478864
## [61] 480249 481636 483025 484416 485809 487204 488601 490000 491401 492804
## [71] 494209 495616 497025 498436 499849
```

<part> 4. </part>


```r
(mean(z))
## [1] 449368.7
```

</div>

<div class="problem">

1. Write a function that takes a numerical argument $x$ and returns $5$ if $x\geq 5$ and $x$ itself otherwise.

2. Write a function that returns `TRUE` (a logical value) if its argument is between $2$ and $3$ and `FALSE` otherwise. 

3. (Extra credit) Write a function that takes two equal-sized vectors as arguments and returns the angle between them in degrees. For definiteness, the angle between two vectors is defined to be $0$ when either one of them is $(0,0,\dots,0)$. 
</div>
<div class="solution">

<part> 1. </part>


```r
f = function(x) {
    if (x > 5) {
        return(5)
    } else {
        return(x)
    }
}
```



This could be made much shorter using the function `ifelse`:

```r
f = function(x) ifelse(x > 5, 5, x)
```


<part> 2. </part>


```r
g <- function(x) {
    if (x > 2 & x < 3) {
        return(TRUE)
    } else {
        return(FALSE)
    }
}

# more R-ic (what's 'Pythonic', but for R?)
g <- function(x) x > 2 & x < 3
```

<part> 3. </part>


```r
angle <- function(x, y) {
    length_x = sqrt(sum(x^2))
    length_y = sqrt(sum(y^2))
    if (length_y == 0 | length_x == 0) {
        return(0)
    } else {
        inn_prod = sum(x * y)
        cos_alpha = inn_prod/(length_x * length_y)
        return(acos(cos_alpha)/pi * 180)
    }
}

# some testing

# should be 0
(angle(c(1, 1), c(1, 1)))
## [1] 0.000001207418

# should be 0
(angle(c(0, 0), c(1, 2)))
## [1] 0

# should be 45
(angle(c(0, 1), c(1, 1)))
## [1] 45

# should be 90
(angle(c(1, 0), c(0, 1)))
## [1] 90
```

</div>


⬇︎ In case you were wondering, the text below belongs to footnotes from somewhere high above.⬇︎

<!--chapter:end:01-R.Rmd-->



\usepackage{mydefs_long}
\newcommand{\PP}{{\mathbb{P}}}
\newcommand{\N}{{\mathbb{N}}}
\newcommand{\bZ}{{\mathbb{Z}}}
\newcommand{\R}{{\mathbb{R}}}

\newcommand{\sS}{{\mathcal{S}}}
\newcommand{\EE}{{\mathbb{E}}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}
\newcommand{\corr}{\operatorname{corr}}
\newcommand{\Id}{\operatorname{Id}}

\newcommand{\ld}{\lambda}
\newcommand{\eand}{\text{ and }}
\newcommand{\efor}{\text{ for }}
\newcommand{\eforall}{\text{ forall }}

\newcommand{\tot}{\tfrac{1}{2}}
\newcommand{\seqz}[1]{\{#1_n\}_{n\in \N_0}}
\newcommand{\abs}[1]{|#1|}
\newcommand{\set}[1]{\{#1\}}
\newcommand{\tf}[2]{\frac{#1}{#2}}
\newcommand{\ot}{\frac{1}{2}}
\newcommand{\oo}[1]{\frac{1}{#1}}
\newcommand{\eps}{\varepsilon}
\newcommand{\inds}[1]{\mathbf{1}_{\{#1\}}}
\newcommand{\sets}[2]{ \{ #1\, : \, #2\}}
\newcommand{\ft}[2]{#1,\dots, #2}
\newcommand{\seq}[1]{\{#1_n\}_{n\in\N}}
\newcommand{\ewhere}{\text{ where }}

\renewcommand{\Pr}{{\mathbf P}}
\newcommand{\upn}[2]{#1^{(#2)}}
\newcommand{\Prup}[1]{\upn{\Pr}{#1}}
\newcommand{\Prz}{\Prup{0}}
\newcommand{\Pro}{\Prup{1}}
\newcommand{\Prn}{\Prup{n}}
\newcommand{\aaa}[1]{{a}^{(#1)}}
\renewcommand{\aa}[1]{{a}^{(#1)}}
\newcommand{\aaz}{\aaa{0}}
\newcommand{\az}{\aa{0}}
\renewcommand{\SS}{\sS}
\newcommand{\pnp}[1]{p^{(#1)}}
\newcommand{\pn}{\pnp{n}}
\newcommand{\tpnp}[1]{\tilde{p}^{(#1)}}
\newcommand{\tpn}{\tpnp{n}}
\newcommand{\fnf}[1]{f^{(#1)}}
\newcommand{\fn}{\fnf{n}}
\newcommand{\tofro}{\leftrightarrow}
\newcommand{\Vn}{V^{(n)}}

\newcommand{\mat}[1]{\begin{bmatrix}#1\end{bmatrix}}
          

# Simulation of Random Variables and Monte Carlo
<div style="counter-reset: thechapter 2;"> </div>


In the spirit of "learn by doing", these lecture notes contain many "Problems".
The green ones come with solutions and usually introduce new concepts and feature a *Comments* section right after the solution. These comments are subdivided into *R* and
*Math* comments focusing on the computational or conceptual features,
respectively. Note that you are not expected to be able to do the green
problems before reading their solutions and comments, so don't worry if you
cannot. It is a good practice to try, though. Problems in the Additional Problems section,  which are left unsolved,
however, do not require any new ideas and are there to help you practice the
skills presented before.

## Simulation of some common probability distributions

... where we also review some probability along the way.

<div class="example">
''Draw'' 50 simulations from the geometric distribution with parameter $p=0.4$.
</div>

<p class="solution">

```r
rgeom(50, prob = 0.4)
##  [1] 1 0 3 4 1 2 0 0 2 2 0 1 5 0 1 0 2 1 1 0 2 2 2 1 0 0 1 3 2 2 1 1 1 3 5 0 1 1
## [39] 0 0 0 1 2 0 1 1 1 0 1 0
```
</p>

<div class="comments">

*R:* R makes it very easy to simulate draws from a large class of *named
distributions*^[There are infinitely many ways random variables can be
distributed. Indeed, in the discrete ${\mathbb N}$-valued case only, any
sequence of nonnegative numbers $(p_n)_n$ such that $\sum_n p_n=1$ defines
*a* probability distribution. It turns out, however, that a small-ish number of
distributions appear in nature much more often then the rest. These
distributions, like the normal, uniform, exponential, binomial, etc. turn out to
be so important that they each get a name (hence *named distributions*). ],
such as geometric, binomial, uniform, normal, etc. For a list of all available
distributions, run `help("distributions")` Each available distribution has an *R
name*; the uniform is `unif` the normal is `norm` and the binomial is `binom`,
etc. If you want to simulate $n$ draws (aka a *sample* of size $n$) from a
distribution, you form a full command by appending the letter `r` to its R name
and use $n$ as an argument. That is how we arrived to `rgeom(50)` in the
solution above. The additional arguments of the function `rgeom` have to do with
the parameters of that distribution. Which parameters go with which
distributions, and how to input them as arguments to `rgeom` or `rnorm` is best
looked up in R's extensive documentation. Try `help("rnorm")`, for example. 

*Math:* 
You could spend your whole life trying to understand what it really means to
"simulate" or "generate" a random number. The numbers you obtain from so-called
*random number generators* (RNG) are never random. In fact, they are completely
deterministically generated. Still, sequences of numbers obtained from (good)
random number generators share so many properties with sequences of mythical
*truly* random numbers, that we can use them as if they were truly random. For
the purposes of this class, you can assume that the numbers R gives you as
*random* are random enough. Random number generation is a fascinating topic at
the intersection of number theory, probability, statistics, computer science and
even philosophy, but we do not have the time to cover any of it in this class.
If you want to read a story about a particularly bad random number generator, go
[here](https://en.wikipedia.org/wiki/RANDU).



You might have encountered a geometric distribution before. A random variable with that
distribution can take any positive integer value or $0$, i.e., its support is 
${\mathbb N}_0=\{0,1,2,3,\dots\}$. 
As you can see from the output above, the value $0$ appears more often than the value $3$,
and the value $23$ does not appear at all in this particular simulation run. The 
probability of seeing the value $k\in \{0,1,2,3,\dots\}$ as a result of a single 
draw is given by $(1-p)^k p$, where $p$ is called the *parameter* of the distribution. 

That corresponds to the following interpretation of the geometric distribution:
keep tossing a biased coin (with probability p of obtaining H) until you see the first H; the  number Ts before that is that value your geometric random variable^[Some books will define the geometric random variables as the number of *tosses* (and not Ts) before the first H is obtained. In that case, the final H is included into the count. Clearly, this definition and the one we have given differ by $1$, and this is really not a big deal, but you have to be careful about what is meant when a geometric random variable is mentioned.]
If we put these probabilities in a single table (and choose $p=0.4$, for example) it is 
going to look like this:
<table>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> 0 </th>
   <th style="text-align:right;"> 1 </th>
   <th style="text-align:right;"> 2 </th>
   <th style="text-align:right;"> 3 </th>
   <th style="text-align:right;"> 4 </th>
   <th style="text-align:right;"> 5 </th>
   <th style="text-align:right;"> 6 </th>
   <th style="text-align:right;"> 7 </th>
   <th style="text-align:left;"> ... </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Prob. </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 0.24 </td>
   <td style="text-align:right;"> 0.144 </td>
   <td style="text-align:right;"> 0.086 </td>
   <td style="text-align:right;"> 0.052 </td>
   <td style="text-align:right;"> 0.031 </td>
   <td style="text-align:right;"> 0.019 </td>
   <td style="text-align:right;"> 0.011 </td>
   <td style="text-align:left;"> ... </td>
  </tr>
</tbody>
</table>

Of course, the possible values our random variable can take do not stop at $7$.
In fact, there are infinitely many possible values, but we do not have infinite
space. Note that even though the value $23$ does not appear in the output of the
command `rgeom` above, it probably would if we simulated many more than $50$
values. Let's try it with $500$ draws - the table below counts how many $0s$,
$1s$, $2s$, etc. we got:

<table>
 <thead>
  <tr>
   <th style="text-align:right;"> 0 </th>
   <th style="text-align:right;"> 1 </th>
   <th style="text-align:right;"> 2 </th>
   <th style="text-align:right;"> 3 </th>
   <th style="text-align:right;"> 4 </th>
   <th style="text-align:right;"> 5 </th>
   <th style="text-align:right;"> 6 </th>
   <th style="text-align:right;"> 7 </th>
   <th style="text-align:right;"> 8 </th>
   <th style="text-align:right;"> 9 </th>
   <th style="text-align:right;"> 10 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 208 </td>
   <td style="text-align:right;"> 132 </td>
   <td style="text-align:right;"> 62 </td>
   <td style="text-align:right;"> 43 </td>
   <td style="text-align:right;"> 23 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
</tbody>
</table>

Still no luck, but we do observe values above 5 more often. By trial and error,
we arrive at about $1,000,000$ as the required number of simulations:

<table>
 <thead>
  <tr>
   <th style="text-align:right;"> 0 </th>
   <th style="text-align:right;"> 1 </th>
   <th style="text-align:right;"> 2 </th>
   <th style="text-align:right;"> 3 </th>
   <th style="text-align:left;"> ... </th>
   <th style="text-align:right;"> 23 </th>
   <th style="text-align:right;"> 24 </th>
   <th style="text-align:right;"> 25 </th>
   <th style="text-align:right;"> 26 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 400616 </td>
   <td style="text-align:right;"> 238946 </td>
   <td style="text-align:right;"> 144274 </td>
   <td style="text-align:right;"> 86489 </td>
   <td style="text-align:left;"> ... </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
</tbody>
</table>
</div>

<div class="example">
Compute the probability that among $1,000,000$ draws of a geometric random
variable with parameter $p=0.4$, we never see a number greater than $22$.
</div>

<p class="solution">
First, we compute the probability that the value seen in a *single* draw does not exceed $22$:

```r
pgeom(22, prob = 0.4)
## [1] 0.9999921
```
Different draws are *independent* of each other, so we need to raise this to the power $1,000,000$. 

```r
(pgeom(22, prob = 0.4))^(1e+06)
## [1] 0.0003717335
```
</p>

<div class="comments">
*R.* The command we used here is `pgeom` which is a cousin of `rgeom`. In
general, R commands that involve named probability distributions consist of two
parts. The prefix, i.e., the initial letter (`p` in this case) stands for the
operation you want to perform, and the rest is the R name of the distribution.
There are 4 prefixes, and the commands they produce are

| Prefix   | Description                                    |
|:----------|:------------------------------------------------|
| `r` | Simulate **r**andom draws from the distribution.  |
| `p` | Compute the cumulative **p**robability distribution function (cdf) (**NOT pdf**)|
| `d` | Compute the probability **d**ensity (pdf) or the probability mass function (pmf) 
| `q` | Compute the **q**uantile function |

(see the Math section below for the reminder of what these things are). In this
problem, we are dealing with a geometric random variable $X$, which has a
discrete distribution with support $0,1,2,3,\dots$. Therefore, the R name is
`geom`. We are interested in the probability $\PP[ X\leq 22]$, which
corresponds to the cdf of $X$ at $x=22$, so we use the 
the prefix `p`. Finally, we used the named parameter `p` and gave it the value `p = 0.4`, because the geometric distribution has a single parameter $p$.

This problem also gives us a chance to discuss precision. As you can see, the
probability of a single draw not exceeding $22$ is very close to $1$. In fact,
it is equal to it to 5 decimal places. By default, R displays 7 significant
digits of a number. That is enough for most applications (and barely enough for
this one), but sometimes we need more. For example, let's try to compute the
probability of seeing no T (tails) in 10 tosses of a biased coin, where the
probability of H (heads) is 0.9.

```r
1 - 0.1^10
## [1] 1
```
While very close to it, this probability is clearly not equal to $1$, as suggested by the output above. 
The culprit is the default precision. We can increase the precision (up to $22$ digits) using the  `options` command

```r
options(digits = 17)
1 - 0.1^10
## [1] 0.99999999989999999
```
Precision issues like this one should not appear in this course, but they will
out there "in the wild", so it might be a good idea to be aware of them.

*Math.* If you forgot all about pdfs, cdfs and such things here is a little reminder:

|   |   |
|---|--------------------|
| cdf | $F(x) = \PP[X\leq x]$|
| pdf | $f(x)$ such that $\PP[X \in [a,b]] = \int_a^b f(x) \, dx$ for all $a<b$ |
| pmf | $p(x)$ such that $\PP[X=a_n] = p(a_n)$ for some sequence $a_n$ |
| qf | $q(p)$ is a number such that $\PP[ X \leq q(p)] = p$


Those random variables that admit a pdf are called **continuous**. The prime
examples are the normal, or the exponential distribution. The ones where a pmf
exists are called **discrete**. The sequence $a_n$ covers all values that such
a, discrete, random variable can take. Most often, $a_n$ either covers the set
of all natural numbers $0,1,2,\dots$ or a finite subset such as $1,2,3,4,5,6$. 

Coming back to our original problem, we note that the probability we obtained is
quite small. Since $1/0.000372$ is about $2690$, we would have to run about
$2690$ rounds of $1,000,000$ simulations before the largest number falls below
$23$.
</div>


<div class="example"> 
Compute the $0.05$, $0.1$, $0.4$, $0.6$ and $0.95$ quantiles of the normal 
distribution with mean $1$ and standard deviation $2$.
</div>

<p class="solution">

```r
qnorm(c(0.05, 0.1, 0.4, 0.6, 0.95), mean = 1, sd = 2)
## [1] -2.2897073 -1.5631031  0.4933058  1.5066942  4.2897073
```
</p>

<div class="comments">
*R.* The function we used is `qnorm`, with the prefix `q` which computes the
quantile function and the R name `norm` because we are looking for the quantiles
of the normal distribution. The additional (named) parameters are where the
parameters of the distribution come in (the mean and the standard variation) in
this case. Note how we plugged in the entire vector
`c(0.05, 0.1, 0.4, 0.6, 0.98)` instead of a single value into `qnorm`. You can
do that because this function is **vectorized**. That means that if you give it
a vector as an argument, it will "apply itself" to each component of the vector
separately, and return the vector of results. Many (but not all) functions in R
are vectorized^[The function `sum` adds up all the components of the vector.
You would not want such a function to be vectorized. If it were, it would return
exactly the same vector it got as input.].

As a sanity check, let's apply `pnrom` (which computes the cdf of the normal) to these quantile values:

```r
p = qnorm(c(0.05, 0.1, 0.4, 0.6, 0.95), mean = 1, sd = 2)
pnorm(p, mean = 1, sd = 2)
## [1] 0.05 0.10 0.40 0.60 0.95
```
As expected, we got the original values back - the normal quantile function and its cdf are inverses of each other. 

*Math.* Computing the cdf of a standard normal is the same thing reading a
*normal table*. Computing a quantile is the opposite; you go into the middle of
the table and find your value, and then figure out which "Z" would give you that
value. 
</div>


<div class="example">
Simulate $60$ throws of a fair $10$-sided die. 
</div>

<p class="solution">

```r
sample(1:10, 60, replace = TRUE)
##  [1]  2  8  9  8  4  7  7  7  2  3  3 10  6  1  9  7  4  7  6  2  2  3 10  1  9
## [26]  7  3  2  8  4  1  2  8  1  4  9  1  9 10 10  6  1  8  6  1 10  5  1  6  9
## [51]  8  3  8  9  4  6  1  6  7  8
```
</p>

<div class="comments">
*Math.* Let $X$ denote the outcome of a single throw of a fair $10$-sided die.
The distribution of $X$ is discrete (it can only take the values
$1,2,\dots, 10$) but it is not one of the more famous named distributions. I
guess you could call it a *discrete uniform on ${1,2,\dots, 10}$*, but a better
way to describe such distribution is by a **distribution table**, which is
really just a list of possible values a random variable can take, together with
their, respective, probabilities. In this case, 

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> 1 </th>
   <th style="text-align:left;"> 2 </th>
   <th style="text-align:left;"> 3 </th>
   <th style="text-align:left;"> 4 </th>
   <th style="text-align:left;"> 5 </th>
   <th style="text-align:left;"> 6 </th>
   <th style="text-align:left;"> 7 </th>
   <th style="text-align:left;"> 8 </th>
   <th style="text-align:left;"> 9 </th>
   <th style="text-align:left;"> 10 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 0.1 </td>
   <td style="text-align:left;"> 0.1 </td>
   <td style="text-align:left;"> 0.1 </td>
   <td style="text-align:left;"> 0.1 </td>
   <td style="text-align:left;"> 0.1 </td>
   <td style="text-align:left;"> 0.1 </td>
   <td style="text-align:left;"> 0.1 </td>
   <td style="text-align:left;"> 0.1 </td>
   <td style="text-align:left;"> 0.1 </td>
   <td style="text-align:left;"> 0.1 </td>
  </tr>
</tbody>
</table>
*R.* The command used to draw a sample from a (finite) collection is, of, course
`sample`. The first argument is a vector, and it plays the role of the "bag"
from which you are drawing. If we are interested in repeated, random samples, we
also need to specify `replace = FALSE` otherwise, you could draw any single
number at most once:

```r
sample(1:10, 8, replace = FALSE)
## [1]  1  5  6  7  8 10  3  4
```
 With more than 10 draws, we would run out of numbers to draw:

```r
sample(1:10, 12, replace = FALSE)
## Error in sample.int(length(x), size, replace, prob): cannot take a sample larger than the population when 'replace = FALSE'
```
The bag you draw from can contain objects other than numbers:

```r
sample(c("Picard", "Data", "Geordi"), 9, replace = TRUE)
## [1] "Picard" "Data"   "Geordi" "Geordi" "Data"   "Data"   "Picard" "Data"  
## [9] "Geordi"
```
So far, each object in the bag had the same probability of being drawn. You can
use the `sample` command to produce a *weighted* sample, too. For example, if we
wanted to simulate $10$ draws from the following distribution
<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> 1 </th>
   <th style="text-align:right;"> 2 </th>
   <th style="text-align:right;"> 3 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 0.2 </td>
   <td style="text-align:right;"> 0.7 </td>
   <td style="text-align:right;"> 0.1 </td>
  </tr>
</tbody>
</table>
we would use the additional argument `prob`:

```r
sample(c(1, 2, 3), 10, replace = TRUE, prob = c(0.2, 0.7, 0.1))
##  [1] 1 2 2 1 1 2 2 3 2 2
```
Note how it is mostly $2$s, as expected.
</div>

<div class="example">
Draw a sample of size $n=10$ from $N(1,2)$, i.e., from the normal distribution
with parameters $\mu=1$, $\sigma = 2$. Plot a histogram of the obtained
values. Repeat for $n=100$ and $n=100000$. 
</div>


<p class="solution">


```r
x = rnorm(10, mean = 1, sd = 2)
hist(x)
```

<img src="_main_files/figure-html/unnamed-chunk-69-1.png" width="672" style="display: block; margin: auto;" />

```r
x = rnorm(100, mean = 1, sd = 2)
hist(x)
```

<img src="_main_files/figure-html/unnamed-chunk-70-1.png" width="672" style="display: block; margin: auto;" />

```r
x = rnorm(100000, mean = 1, sd = 2)
hist(x)
```

<img src="_main_files/figure-html/unnamed-chunk-71-1.png" width="672" style="display: block; margin: auto;" />
</p>

<div class="comments">

*R.* It cannot be simpler! You use the command `hist`, feed it a vector of
values, and it produces a histogram. It will even label the axes for you. If you
want to learn how to tweak various features of your histogram, type `?hist`.

<!-- Esthetically, the built-in histograms leave something to be desired. We can do better, using the package `ggplot2`. You don't have to use it in this class, but if you want to, you install it first by running `install.packages("ggplot2")` (you have to do this only once). Then, every time you want to use it, you run `library(ggplot2)` to notify R that you are about to use a function from that package. It would take a whole semester to learn everything there is to know about `ggplot2`; I will only show what a histogram looks like in it: -->
<!-- ```{r} -->
<!-- library(ggplot2) -->
<!-- x = rnorm(100000, mean = 1, sd = 2) -->
<!-- qplot(x, bins=40) -->
<!-- ``` -->
*Math*. Mathematically, histogram can be produced for any (finite) sequence of
numbers: we divide the range into several bins, count how many of the points in
the sequence falls into each bin, and then draw a bar above that bin whose
height is equal (or proportional to) that count. The picture tells use about how
the sequence we started from is "distributed". The order of the points does not
matter - you would get exactly the same picture if you sorted the points first.
If the sequence of points you draw the histogram of comes from, say, normal
distribution, the histogram will resemble the shape of the pdf of a normal
distribution. I say resemble, because its shape is ultimately random. If the
number of points is small (like in the second part of this problem) the
histogram may look nothing like the normal pdf. However, when the number of
points gets larger and larger, the shape of the histogram gets closer and closer
to the underlying pdf (if it exists). I keep writing "shape" because the three
histograms above have very different scales on the $y$ axis. That is because we
used counts to set the vertical sizes of bins.
A more natural choice is to use the proportions, i.e. relative frequencies (i.e.
counts divided by the total number of points) for bar heights. More precisely, the bar height $h$ over the bin $[a,b]$ is chosen so that the area of the bar, i.e., $(b-a)\times h$ equals to the proportion of all points that fall inside $[a,b]$. This way, the total area under the histogram is always $1$. To draw such a **density histogram** in R we would
need to add the additional option `freq = FALSE` to `hist`:

```r
x = rnorm(100000, mean = 1, sd = 2)
hist(x, freq = FALSE)
```

<img src="_main_files/figure-html/unnamed-chunk-72-1.png" width="672" style="display: block; margin: auto;" />

Note how the $y$-axes label changed from "Frequency" to "Density". 
With such a normalization, the histogram of $x$ can be directly compared to the
probability density of a normal distribution. Here is a histogram of $100,000$
simulations from our normal distribution with its density function (pdf)
superimposed; I am leaving the code in case you are interested:


```r
sims = rnorm(10000, mean = 1, sd = 2)
x = seq(-6, 8, by = 0.02)
y = dnorm(x, mean = 1, sd = 2)
hist(sims, freq = FALSE, main = "")
points(x, y, type = "l", lwd = 3, col = "red")
```

<img src="_main_files/figure-html/unnamed-chunk-73-1.png" width="672" style="display: block; margin: auto;" />
</div>

## Multivariate Distributions

<div class="example">
Let `x` contain $2,000$ draws from $N(0,1)$, `z` another $2,000$ draws from $N(0,1)$ and let `y=x^2+z`. 

1. Draw a scatterplot of `x` and `y` to visualize the joint distribution of `x` and `y`

2. Plot two histograms, one of `x` and one of `y`. Do they tell the whole story about the joint distribution of `x` and `y`?
   
3. Are `x` and `y` correlated? Do `x` and `y` in your plot "look independent"?  Use the permutation test to check of independence between `x` and `y`. 
</div>

<p class="solution">

<part> 1. </part>


```r
x = rnorm(2000)
z = rnorm(2000)
y = x^2 + z
plot(x, y)
```

<img src="_main_files/figure-html/unnamed-chunk-74-1.png" width="672" style="display: block; margin: auto;" />

<part> 2. </part>


```r
hist(x)
hist(y)
```

<img src="_main_files/figure-html/unnamed-chunk-75-1.png" width="672" style="display: block; margin: auto;" />

No, the two histograms would not be enough to describe the joint distribution.
There are many ways in which two random variables $X$ and $Y$ can be jointly
distributed, but whose separate (marginal) distributions match the histograms
above. To give a very simple example, let $X$ and $Y$ be discrete random
variables, each of which can only take values $0$ or $1$. Consider the following
two possible *joint* distribution tables for the random pair $(X,Y)$:


<table class="kable_wrapper">
<tbody>
  <tr>
   <td> 

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;text-align: center;">   </th>
   <th style="text-align:right;text-align: center;"> 0 </th>
   <th style="text-align:right;text-align: center;"> 1 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;"> 0 </td>
   <td style="text-align:right;"> 0.25 </td>
   <td style="text-align:right;"> 0.25 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> 1 </td>
   <td style="text-align:right;"> 0.25 </td>
   <td style="text-align:right;"> 0.25 </td>
  </tr>
</tbody>
</table>

 </td>
   <td> 

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;text-align: center;">   </th>
   <th style="text-align:right;text-align: center;"> 0 </th>
   <th style="text-align:right;text-align: center;"> 1 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;"> 0 </td>
   <td style="text-align:right;"> 0.5 </td>
   <td style="text-align:right;"> 0.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> 1 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0.5 </td>
  </tr>
</tbody>
</table>

 </td>
  </tr>
</tbody>
</table>

In both cases, the marginals are the same, i.e., both $X$ and $Y$ are equally
likely to take the value $0$ or $1$, i.e., they both have the Bernoulli
distribution with parameter $p=1/2$. That would correspond to the separate
histograms to be the same. On the other hand, their joint distributions (aka
dependence structures) are completely different. In the first (left) case, $X$
and $Y$ are independent, but in the second they are completely dependent.

<part> 3. </part>

They are probably not correlated since the sample correlation between `x`
and `y` is close to $0$:

```r
(cor(x, y))
## [1] -0.02880239
```
but they do not look independent.


To apply the permutation test, we first plot the scatterplot of `x` vs. `y` as
above. Then, we replace `y` by a vector with the same components, but randomly
permute their positions, and then plot a scatterplot again. We repeat this three
times:

```r
y_perm_1 = sample(y)
y_perm_2 = sample(y)
y_perm_3 = sample(y)
plot(x, y)
plot(x, y_perm_1)
plot(x, y_perm_2)
plot(x, y_perm_3)
```

<img src="_main_files/figure-html/unnamed-chunk-78-1.png" width="672" style="display: block; margin: auto;" />

The conclusion is clear, the first (upper-left) plot is very different than the
other three. Therefore, `x` and `y` are probably not independent.
</p>

<div class="comments">
*Math.* The point of this problem is to review the notion of the **joint
distribution** between two random variables. The most important point here is
that there is more to the joint distribution of two random vectors, than just
the two distributions taken separately. In a sense, the whole is (much) more
than the sum of its parts. This is something that does not happen in the
deterministic world. If you give me the $x$-coordinate of a point, and,
separately, its $y$-coordinate, I will be able to pinpoint the exact location of
that point. 

On the other hand, suppose that the $x$-coordinate of a point is unknown, so we
treat it as a random variable, and suppose that this variable admits the
standard normal distribution. Do the same for $y$. Even with this information,
you cannot say anything about the position of the point $(x,y)$. It could be
that the reason we are uncertain about $x$ and the reason we are uncertain about
$y$ have nothing to do with each other; in that case we would be right to assume
that $x$ and $y$ are independent. If, on the other hand, we got the values of
both $x$ and $y$ by measuring them using the same, inaccurate, tape measure, we
cannot assume that the errors are independent. It is more likely that both $x$
and $y$ are too big, or both $x$ and $y$ are too small.

Mathematically, we say that random variables $X$ and $Y$ are independent if 
$$\PP[X \in [a,b]] \times \PP[ Y \in [c,d] ] = \PP[ X\in [a,b] \text{ and } Y\in [c,d]]\text{ for all } a,b,c,d.$$ 
While up to the point,
this definition is not very eye-opening, or directly applicable in most cases.
Intuitively, $X$ and $Y$ are independent if the distribution of $Y$ would not
change if we received additional information about $X$. In our problem, random
variables $X$ and $Y$ correspond to vectors `x` and `y`. Their scatterplot above
clearly conveys the following message: when `x` is around $-2$, we expect `y` to
be around `4`, while when `x` is around $0$, `y` would be expected to be around
$0$, too.

Sometimes, it is not so easy to decide whether two variables are independent by staring at a scatterplot. What would you say about the scatterplot below?
<img src="_main_files/figure-html/unnamed-chunk-79-1.png" width="50%" style="display: block; margin: auto;" />
The **permutation test** is designed to help you decide when two (simulated)
random variables are likely to be independent. The idea is simple. Suppose that
`x` and `y` are simulations from two independent (not necessarily identical)
distributions; say `x=runif(1000)` and `y=rnorm(1000)`. The vector
`y_perm=sample(y)` is a randomly permuted version of `y` (see R section below)
and it contains exactly the same information about the distribution of `y` as
`y` itself does. Both `y` and `y_perm` will produce exactly the same histogram.
Permuting `y`, however, "uncouples" it from `x`. If there was any dependence
between the values of `x` and `y` before, there certainly isn't any now. In
other the joint distribution of `x` and `y_perm` has the same marginals as the
joint distribution of `x` and `y`, but all the (possible) dependence has been
removed. What remains is to compare the scatterplot between `x` and `y` and the
scatterplot between `x` and `y_perm`. If they look about the same, we conclude
that `x` and `y` are independent. Otherwise, there is some dependence between
them. 

One question remains: why did we have to draw three scatterplots of permuted
versions of `y`? That is because we have only finitely many data points, and it
can happen, by pure chance, that the permutation we applied to `y` does not
completely scramble its dependence on `x`. With a "sample" of three such plots,
we 
get a better feeling for the inherent randomness in this permutation procedure,
and it is much easier to tell whether "one of these things is not like the
others". Btw, the random variables in the scatterplot above are, indeed,
independent; here are the $4$ permutation-test plots to "prove" it:
<img src="_main_files/figure-html/unnamed-chunk-80-1.png" width="672" style="display: block; margin: auto;" />

Unlike univariate (one-variable) distributions which are visualized using
histograms or similar plots, multivariate (several-variable) distributions are
harder to depict. The most direct relative of the histogram is a **3d
histogram**. Just like the $x$-axis is divided into bins in the univariate case,
in the multivariate case we divide the $xy$-plane into regions (squares, e.g.)
and count the number of points falling into each of these regions. After that
a 3d bar (a skyscraper) is drawn above each square with the height of each
skyscraper equal (or proportional) to the number of points which fall into its
base. Here is a 3d histogram of our original pair (`x`,`y`) from the problem.
You should be able to rotate and zoom it right here in the notes, provided your
browser has JavaScript enabled:

<div align="center">
preserveeadb352554ad0478
</div>

A visualization solution that requires less technology would start the same way,
i.e., by dividing the $xy$ plane into regions, but instead of the third
dimension, it would use different colors to represent the counts. Here is an
example where the regions are hexagons, as opposed to squares; it just looks
better, for some reason:

<img src="_main_files/figure-html/unnamed-chunk-82-1.png" width="672" style="display: block; margin: auto;" />

Just to showcase the range of possibilities, here is another visualization
technique which which requires deeper statistical tools, namely the 
**density contour plot**:
<img src="_main_files/figure-html/unnamed-chunk-83-1.png" width="80%" style="display: block; margin: auto;" />

*R.* There is very little new R here. You should remember that if `x` and `y` are
vectors of the same length, `plot(x,y)` gives you a scatterplot of `x` and `y`.

To compute the sample correlation between two vectors, use the `cor`. 

We used the command `sample(y)` to obtain a randomly permuted version of `y`.
The simplicity of this is due to default parameters of the command `sample`
which we already learned about. In particular, the default number of samples is
exactly the size of the input vector `y` and, by default, sampling is performed
*without replacement*. If you think about it for a second, you will realize that
a sample of size $n$ from the vector of size $n$ *without* replacement is
nothing by a random permutation of `y`. 

You are not required to do this in your submissions, but if you want to display
several plots side-by-side, use the command is `par(mfrow=c(m,n))` before the
`plot` commands. It tells R to plot the next $mn$ plots in a $m\times n$ grid.

</div>

<div class="example">
Let the random variables $X$ and $Y$ have the joint distribution given by 
the following table:

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> 1 </th>
   <th style="text-align:right;"> 2 </th>
   <th style="text-align:right;"> 3 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 0.1 </td>
   <td style="text-align:right;"> 0.2 </td>
   <td style="text-align:right;"> 0.3 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0.2 </td>
   <td style="text-align:right;"> 0.2 </td>
   <td style="text-align:right;"> 0.0 </td>
  </tr>
</tbody>
</table>
   
Simulate $10,000$ draws from the distribution of $(X,Y)$ and display a 
contingency table of your results.
</div>

<p class="solution">


```r
joint_distribution_long = data.frame(
   x = c(1, 1, 1, 2, 2, 2),
   y = c(1, 2, 3, 1, 2, 3)
)
probabilities_long = 
       c(0.1, 0.2, 0.3, 0.2, 0.2, 0.0)

sampled_rows = sample(
   x = 1:nrow(joint_distribution_long),
   size = 10000,
   replace = TRUE,
   prob = probabilities_long
)

draws = joint_distribution_long[sampled_rows, ]

table(draws)
##    y
## x      1    2    3
##   1  962 2027 3047
##   2 1945 2019    0
```

</p>

<div class="comments"> 
*Math.* The main mathematical idea is to think of *each pair* of possible values
of $X$ and $Y$ as a separate "object", put all these objects in a "bag", then
then draw from the bag. In other words, we convert the bivariate distribution
from the problem to the following univariate distribution

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> (1,1) </th>
   <th style="text-align:right;"> (1,2) </th>
   <th style="text-align:right;"> (1,3) </th>
   <th style="text-align:right;"> (2,1) </th>
   <th style="text-align:right;"> (2,2) </th>
   <th style="text-align:right;"> (2,3) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 0.1 </td>
   <td style="text-align:right;"> 0.2 </td>
   <td style="text-align:right;"> 0.3 </td>
   <td style="text-align:right;"> 0.2 </td>
   <td style="text-align:right;"> 0.2 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table>

and sample from it. When you do, you will get a vector whose elements are pairs
of numbers. The last step is to extract the components of those pairs into
separate vectors. 

*R.* The most important new R concept here is `data.frame`. You should think of
it as a spreadsheet. It is, mathematically, a matrix, but we do not perform any
mathematical operations on it. Moreover, not all columns in the data frame have
to be numeric. Some of them can be strings, and other can be something even more
exotic. You should think of a data frame as a bunch of column vectors of the
same length stacked side by side. It is important to note that each column of a
data frame will have a name, so that we don't have to access it by its position
only (as we would have to in the case of a matrix).  

In this class, the column vectors of data frames are going to contain simulated
values. In statistics, it is data that comes in data frames, with rows
corresponding to different observations, and columns to various observed
variables.

The easiest way to construct a data frame using already existing vectors is as follows:


```r
x = c(1, 2, 3)
y = c("a", "b", "c")
(df = data.frame(x, y))
##   x y
## 1 1 a
## 2 2 b
## 3 3 c
```

Note that the two columns inherited their names from the vectors `x` and `y`
that fed into them. Note, also, that all rows got consecutive numerical values
as names by default. Row names are sometimes useful to have, but are in general
a nuisance and should be ignored (especially in this class). Column names are
more important, and there is a special notation (the dollar-sign notation) that
allows you to access a column by its name:


```r
df$y
## [1] "a" "b" "c"
```

If you want to give your columns custom names (or if you are building them out
of explicitly given vectors as in the solution above) use the following syntax


```r
z = c("a", "b", "c", "d")
(df = data.frame(letters = z, numbers = c(1, 2, 3, 4)))
##   letters numbers
## 1       a       1
## 2       b       2
## 3       c       3
## 4       d       4
```

A feature that data frames share with vectors and matrices is that you can use vector indexing as in the following example (where `df` is as above)


```r
df[c(2, 4, 4, 1), ]
##     letters numbers
## 2         b       2
## 4         d       4
## 4.1       d       4
## 1         a       1
```

Make sure you understand why the expression inside the brackets is `c(2,4,4,1),`
and not `c(2,4,4,1)`. R's desire to keep row names unique leads to some
cumbersome constructs such as `4.1` above. As I mentioned before, just disregard
them. 

A nice thing about data frames is that they can easily be pretty-printed in
RStudio. Go to the Environment tab in one of your RStudio panes, and double
click on the name of the data frame you just built. It will appear as a nicely
formatted spreadsheet. 

Once we have the data frame containing all $6$ pairs of possible values $X$ and
$Y$ can take (called `joint_distribution_long` in the solution above), we can
proceed by sampling from its rows, by sampling from the set `1,2,3,4,5,6` with
probabilities `0.1, 0.2, 0.3, 0.2, 0.2, 0.0`. The result of the corresponding
`sample` command will be a sequence - called `sampled_rows` in the solution - of
length $10,000$ composed of numbers $1,2,3,4,5$ or $6$. The reason we chose the
name `sampled_rows` is because each number corresponds to a row from the data
frame `joint_distribution_long`, and by indexing `joint_distribution_long` by
`sampled_rows` we are effectively sampling from its rows. In other words, the
command `joint_distribution_long[sampled_rows, ]` turns a bunch of numbers into
a bunch of rows (many of them repeated) of the data frame
`joint_distribution_long`. 

The final step is to use the function `table`. This time, we are applying it to
a data frame and not to a vector, but the effect is the same. It tabulates all
possible combinations of values of the columns, and counts how many times each
of them happened. The same result would have been obtained by calling
`table(draws$x, draws$y)`. 
</div>


## Monte Carlo

<div class="example">
Use Monte Carlo to estimate the expected value of the exponential random
variable with parameter $\ld = 4$ using $n=10$, $n=1,000$ and $n=1,000,000$
simulations. Compare to the exact value.
</div>

<p class="solution">


```r
x = rexp(10, rate = 4)
mean(x)
## [1] 0.1779768
```

For an exponential random variable with parameter $\ld$, the expected value is 
$1/\ld$ (such information can be found in [Appendix A](./dist.html)) which, 
in this case, is  $0.25$. The error made was 0.072023 for $n=10$ simulations.

We increase the number of simulations to $n=1000$ and get a better result


```r
x = rexp(1000, rate = 4)
mean(x)
## [1] 0.2564643
```

with (smaller) error -0.0064643. Finally, let's try $n=1,000,000$:


```r
x = rexp(1e+06, rate = 4)
mean(x)
## [1] 0.250381
```

The error is even smaller -0.00038101. 
</p>
<!-- This can be obtained quite easily by integration (by parts): -->
<!-- $$ \EE[X] = \int_{-\infty}^{\infty} x f(x)\, dx = \int_0^{\infty} x \ld e^{-\ld x}\, dx = \tfrac{1}{\ld}$$ -->

<div class="comments">

*R.* The only new thing here is the command `mean` which computes the mean of a vector. 

*Math.* There is a lot going on here conceptually. This is the first time we
used the Monte Carlo method. It is an incredibly useful tool, as you will keep
being reminded throughout this class. The idea behind it is simple, and it is
based on the *Law of large numbers*:

**Theorem** Let $X_1,X_2, \dots$ be an independent sequence of random
variables with the same distribution, for which the expected value can be
computed. Then
$$ \tfrac{1}{n} \Big( X_1+X_2+\dots+X_n\Big) \to \EE[X_1] \text{ as } n\to\infty$$
The idea behind Monte Carlo is to turn this theorem "upside down". The goal is
to compute $\EE[X\_1]$ and use a supply of random numbers, each of which
comes from the same distribution, to accomplish that. The random number
generator inside `rexp` gives us a supply of numbers (stored in the vector `x`)
and all we have to do is compute their average. This gives us the left-hand side
of the formula above, and, if $n$ is large enough, we hope that  this average
does not differ too much from its theoretical limit. As $n$ gets larger, we
expect better and better results. That is why your error above gets smaller as
$n$ increases. 

It looks like Monte Carlo can only be used to compute the expected value of a
random variable, which does not seem like such a bit deal. But it is! You will see
in the sequel that almost anything can be written as the expected value of
*some* random variable.
</div>

<div class="example">
Use Monte Carlo to estimate $\EE[X^2]$, where $X$ is a standard normal 
random variable. 
</div>

<p class="solution">

You may or may now know that when $X$ is standard normal $Y=X^2$ has a $\chi^2$
distribution with one degree of freedom. If you do, you can solve the problem
like this:


```r
y = rchisq(5000, df = 1)
mean(y)
## [1] 0.9771929
```

If you don't, you can do the following: 


```r
x = rnorm(5000)
y = x^2
mean(y)
## [1] 1.019852
```

</p>

<div class="comments">

*Math+R.* We are asked to compute $\EE[ X^2]$, which can be interpreted in
two ways. First, we can think of $Y=X^2$ as a random variable in its own right and you
can try to take draws from the distribution of $Y$. In the case of the normal
distribution, the distribution of $Y$ is known - it happens to be a
$\chi^2$-distribution with a single degree of freedom (don't worry if you never
heard of it). We can simulate it in R by using its R name `chisq` and 
get a number close to the exact value of $1$. 

If you did not know about the $\chi^2$ distribution, you would not know what R
name to put the prefix `r` in front of. What makes the simulation possible is
the fact that $Y$ is a *transformation* of 
a random variable we know how to simulate. In that case, we simply simulate the
required number of draws `x` from the geometric distribution (using `rnorm`) and
then apply the transformation $x \mapsto x^2$ to the result. The transformed
vector `y` is then nothing but the sequence of draws from the distribution of
$X^2$. 

The idea described above is one of main advantages of the Monte Carlo technique:
if you know how to simulate a random variable, you also know how to simulate
any (deterministic) function of it. That fact will come into its own a bit later
when we start working with several random variables and stochastic processes,
but it can be very helpful even in the case of a single random variable, as you
will see in the next problem. 

</div>

<div class="example">
Let $X$ be a standard normal random variable. Use Monte Carlo to estimate the
probability $\PP[ X > 1 ]$. Compare to the exact value.
</div>

<p class="solution">

The estimated probability:


```r
x = rnorm(10000)
y = x > 1
(p_est = mean(y))
## [1] 0.1608
```

The exact probability and the error


```r
p_true = 1 - pnorm(1)
(err = p_est - p_true)
## [1] 0.002144746
```

</p>

<div class="comments">

*R.* As we learned before,  the symbol `>` is an operation, which returns a Boolean (`TRUE` or `FALSE`) value. For example:


```r
1 > 2
## [1] FALSE
```

```r
5^2 > 20
## [1] TRUE
```

It is vectorized:


```r
x = c(1, 2, 4)
y = c(5, -4, 3)
x > y
## [1] FALSE  TRUE  TRUE
```

and recycling rules apply to it (so that you can compare a vector and a scalar, for example)


```r
x = 1:10
x > 5
##  [1] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
```

Therefore, the vector `y` in the solution is a vector of length $10000$ whose
elements are either `TRUE` or `FALSE`; here are the first 5 rows of data frame
with columns `x` and `y` from our solution:

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> x </th>
   <th style="text-align:left;"> y </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 1.9493 </td>
   <td style="text-align:left;"> FALSE </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -1.1015 </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1.0448 </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -0.1384 </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -0.2573 </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
</tbody>
</table>

Finally, `z` contains the `mean` of `y`. How do you compute a mean of Boolean values?  In R (and many other languages) `TRUE` and `FALSE` have default numerical values, usually $1$ and $0$. This way, when $R$ is asked to compute the `sum` of a Boolean vector it will effectively count the number of values which are `TRUE`. Similarly, the `mean` is the relative proportion of `TRUE` values. 

*Math.* We computed the **proportion** of the "times" $X>1$ (among many simulations of $X$) and used it to approximate the **probability** $\PP[ X>1]$.  More formally, 
we started from a random variable $X$ with a normal distribution and then transformed it into another random variable, $Y$, by setting $Y=1$ whenever $X>1$ and $0$ otherwise. This is often written as follows
$$ Y = \begin{cases} 1, & X>1 \\ 0, & X\leq 1.\end{cases}$$
The random variable $Y$ is very special - it can only take values $0$ and $1$ (i.e., its support is $\{0,1\}$). Such random variables are called **indicator random variables**, and their distribution, called the **Bernoulli distribution**, always looks like this:

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> 0 </th>
   <th style="text-align:left;"> 1 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1-p </td>
   <td style="text-align:left;"> p </td>
  </tr>
</tbody>
</table>
for some $p \in [0,1]$. The parameter $p$  is nothing but the probability $\PP[Y=1]$. 

So why did we decide to transform $X$ into $Y$? Because of the following simple fact:
$$ \EE[ Y] = 1 \times p + 0 \times (1-p) = p.$$
The expected value of an indicator is the probability $p$, and we know that we can use Monte Carlo whenever we can express the quantity we are computing as an expected value of a random variable we know how to simulate. 
</div>

Many times, simulating a random variable is easier than analyzing it analytically. Here is a fun example:

<div class="example">
Use Monte Carlo to estimate the value of $\pi$ and compute the error. 
</div>

<p class="solution">


```r
nsim = 1000000
x =  runif(nsim,-1, 1)
y =  runif(nsim,-1, 1)
z = (x ^ 2 + y ^ 2) < 1
(pi_est = 4 * mean(z))
## [1] 3.141728
(err = pi_est - pi)
## [1] 0.0001353464
```
</p>

<div class="comments">

*Math.*
<img src="pics/mc_pi.gif" width="50%" style="float:right; padding:10px" style="display: block; margin: auto;" />
As we learned in the previous problem, probabilities of events can be computed using Monte Carlo, as long as we know how to simulate the underlying indicator random variable. In this case, we want to compute $\pi$, so we would need to find a "situation" in which the probability of something is $\pi$. Of course, $\pi>1$, so it cannot be a probability of anything, but $\pi/4$ can, and computing $\pi/4$ is as useful as computing $\pi$. To create the required probabilistic "situation" we think of the geometric meaning of $\pi$, and come up with the following scheme. Let $X$ and $Y$ be two independent uniform random variables each with values between $-1$ and $1$. We can think of the pair $(X,Y)$ as a random point in the square $[-1,1]\times [-1,1]$. This point will sometimes fall inside the unit circle, and sometimes it will not. What is the probability of hitting the circle? Well, since $(X,Y)$ is uniformly distributed everywhere inside the square, this probability should be equal to the portion of the area of our square which belongs to the unit circle. The area of the square is $4$ and the area of the circle is $\pi$, so the required probability is $\pi/4$. Using the idea from the previous problem, we define the indicator random variable $Z$ as follows
$$ Z = \begin{cases} 1 & (X,Y) \text{ is inside the unit circle, } \\ 0 & \text{ otherwise.}
\end{cases}
= \begin{cases} 1& X^2+Y^2 < 1, \\ 0 & \text{ otherwise.} \end{cases}$$
</div>

<div class="example">
1. Write an R function `cumavg` which computes the sequence of running averages of a vector, i.e., if the input is $x=(x_1,x_2,x_3,\dots, x_n)$, the output should be
$$ \Big(x_1, \frac{1}{2} (x_1+x_2), \frac{1}{3}(x_1+x_2+x_3), \dots, \frac{1}{n} (x_1+x_2+\dots+x_n)\Big).$$ Test it to check that it really works. (*Hint:* look up the function `cumsum`. )
   
2. Apply `cumavg` to the vector $4 z$ from the previous problem and plot your results (use a smaller value for `nsim`. Maybe $1000$.) Plot the values against their index. Add a red horizontal line at the level $\pi$. Rerun the same code (including the simulation part) several times.
</div>


<p class="solution">

<part> 1. </part>


```r
cumavg = function(x) {
    c = cumsum(x)
    n = 1:length(x)
    return(c/n)
}
x = c(1, 3, 5, 3, 3, 9)
cumavg(x)
## [1] 1 2 3 3 3 4
```

<part> 2. </part>


```r
nsim = 1000
x =  runif(nsim,-1, 1)
y =  runif(nsim,-1, 1)
z = (x ^ 2 + y ^ 2) < 1
pi_est = cumavg(4 * z)
plot(
   1:nsim,
   pi_est,
   type = "l",
   xlab = "number of simulations",
   ylab = "estimate of pi",
   main = "Computing pi by Monte Carlo"
)
abline(pi, 0,
       col = "red")
```

<img src="_main_files/figure-html/unnamed-chunk-107-1.png" width="672" style="display: block; margin: auto;" />
</p>

<div class="comments">

Part 1. Once you know about `cumsum`, the problem becomes much easier. 

Part 2. This course is not about R graphics, but I think it is a good idea to teach you how to make basic plots in R. We already used the function `plot` to draw scatterplots.
By default, each point drawn by `plot` is marked by a small circle so it might not seem like a good idea to use it. Luckily this, and many other things, can be adjusted by numerous additional arguments. One of such arguments is `type` which determines the type of the plot. We used `type="l"` which tells R to join the points with straight lines:

```r
x = c(1, 3, 4, 7)
y = c(2, 1, 5, 5)
plot(x, y, type = "l")
```

<img src="_main_files/figure-html/unnamed-chunk-108-1.png" width="672" style="display: block; margin: auto;" />
The other arguments, `xlab`, `ylab` and `main` determine labels for axes and the entire plot. The function `abline(a,b)` adds a line $y = a x + b$ to an already existing plot. It is very useful in statistics if one wants to show the regression line superimposed on the scatterplot of data. Finally, the argument `col`, of course, determines the color of the line. To learn about various graphical parameters, type `?par`. 

*Math.* The conceptual reason for this exercise is to explore (numerically) the kinds of errors we make when we use Monte Carlo. Unlike the deterministic numerical procedures,  Monte Carlo has a strange property that no bound on the error can be made with absolute certainty. Let me give you an example. Suppose that you have a biased coin, with the probability $0.6$ of heads and $0.4$ of tails. You don't know this probability, and use a Monte Carlo technique to estimate it - you toss your coin $1000$ times and record the number of times you observe $H$. The law of large numbers suggests that the relative frequency of heads is close to the true probability of $H$. Indeed, you run a simulation

```r
x = sample(c("T", "H"), 1000, prob = c(0.4, 0.6), replace = TRUE)
y = x == "H"
mean(y)
## [1] 0.594
```
and get a pretty accurate estimate of $0.594$. If you run the same code a few more times, you will get different estimates, but all of them will be close to $0.6$. Theoretically, however, your simulation could have yielded $1000$ Hs, which would lead you to report $p=1$ as the Monte-Carlo estimate. The point is that even though such disasters are theoretically possible, they are exceedingly unlikely. The probability of getting all $H$ in $1000$ tosses of this coin is a number with more than $500$ zeros after the decimal point.  

The take-home message is that even though there are no guarantees, Monte Carlo performs well the vast majority of the time. The crucial ingredient, however, is the number of simulations. The plot you were asked to make illustrates exactly that. The function `cumavg` gives you a whole sequence of Monte-Carlo estimates of the same thing (the number $\pi$) with different numbers of simulations `nsim`. For small values of `nsim` the error is typically very large (and very random). As the number of simulations grows, the situations stabilizes and the error decreases. Without going into the theory behind it, let me only mention is that in the majority of practical applications we have the following relationship:
$$ error \sim \frac{1}{\sqrt{n}}.$$
In words, if you want to double the precision, you need to quadruple the number of simulations. If you want an extra digit in your estimate, you need to multiply the number of simulations by $100$. Here is an image where I superimposed $40$ plots like the one you were asked to produce (the red lines are $\pm \frac{4}{\sqrt{n}}$):

<img src="_main_files/figure-html/unnamed-chunk-110-1.png" width="672" style="display: block; margin: auto;" />
</div>

## Conditional distributions

<div class="example">
Let $X$ and $Y$ be two independent geometric random variables with parameters $p=0.5,$ and let $Z=X+Y$. Compute $\PP[ X = 3| Z = 5]$ using simulation. Compare to the exact value. 
</div>

 
<p class="solution">

By simulation:


```r
nsim = 1000000
X = rgeom(nsim, prob = 0.5)
Y = rgeom(nsim, prob = 0.5)
Z = X + Y
X_cond = X[Z == 5]
mean(X_cond  == 3) 
## [1] 0.1684758
```

To get the exact value, we start from the definition:
$$ \PP[ X = 3 | Z= 5 ] = \frac{\PP[ X=3 \eand Z=5]}{\PP[Z=5]} = \frac{\PP[X=3 \eand Y = 2]}{\PP[Z=5]}, $$
where the last equality follows from the fact that $\{ X=3 \text{ and } Z=5 \}$ is exactly the same event as $\{ X = 3 \text{ and } Y=2\}$. 
Since $X$ and $Y$ are independent, we have 
$$\PP[ X=3 \eand Y=2 ] = \PP[X=3] \times \PP[ Y=2] = 2^{-4} 2^{-3} = 2^{-7}.$$
To compute $\PP[ Z = 5]$ we need to split the event $\{ Z = 5 \}$ into events we know how to deal with. Since $Z$ is built from $X$ and $Y$, we write
$$ \begin{align} \PP[ Z = 5 ] = &\PP[X=0 \eand Y=5]+ \PP[ X=1 \eand Y=4] + \PP[ X=2 \eand Y=3] + \\
&  \PP[ X=3 \eand Y=2] + \PP[ X=4 \eand Y=1] + \PP[ X = 5 \eand Y=0]. \end{align}$$
Each of the individual probabilities in the sum above is $2^{-7}$, so $\PP[ X = 3 | Z = 5] = \frac{1}{6}$. 
This gives us an error of 0.0018091.
</p>

<div class="comments">

*Math.*  Let us, first, recall what the conditional probability is. The definition we learn in the probability class is the following $$ \PP[A | B] = \frac{\PP[A \eand B]}{\PP[B]},$$ as long as $\PP[B]>0$. The interpretation is that $\PP[A|B]$ is still the probability of $A$, but now in the world where $B$ is guaranteed to happen. Conditioning usually happens when we receive new information. If someone tells us that $B$ happened, we can disregard everything in the complement of $B$ and adjust our probability to account for that fact. First we remove from $A$ anything that belongs to the complement of $B$, and recompute the probability $\PP[A \cap B]$. We also have to divide by $\PP[B]$ because we want the total probability to be equal to $1$. 

Our code starts as usual, but simulating $X$ and $Y$ from the required distribution, and constructing a new vector $Z$ as their sum.  The variable `X_cond` is new; we build it from $X$ by removing all the elements whose corresponding $Z$ is *not* equal to $5$. This is an example of what is sometimes called the **rejection method** in simulation. We simply "reject" all simulations which do not satisfy the condition we are conditioning on. We can think of `X_cond` as bunch of simulations of $X$, but in the world where $Z=5$ is guaranteed to happen. Once we have `X_cond`, we proceed as usual by computing the relative frequency of the value $3$ among all possible values $X$ can take. Note that the same `X_cond` can also be used to compute the conditional probability $\PP[ X=1| Z=5]$. In fact, `X_cond` contains the information about the entire **conditional distribution of $X$ given $Z=5$**; if we draw a histogram of `X_cond`, we will get a good idea of what this distribution looks like:
<img src="_main_files/figure-html/unnamed-chunk-112-1.png" width="672" style="display: block; margin: auto;" />
Since `X_cond` contains only discrete values from $0$ to $5$, a contingency table might be a better tool for understanding its distribution:
<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> 0 </th>
   <th style="text-align:right;"> 1 </th>
   <th style="text-align:right;"> 2 </th>
   <th style="text-align:right;"> 3 </th>
   <th style="text-align:right;"> 4 </th>
   <th style="text-align:right;"> 5 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 7745 </td>
   <td style="text-align:right;"> 7761 </td>
   <td style="text-align:right;"> 7691 </td>
   <td style="text-align:right;"> 7807 </td>
   <td style="text-align:right;"> 7731 </td>
   <td style="text-align:right;"> 7604 </td>
  </tr>
</tbody>
</table>

The histogram and the table  above suggest that  the distribution of $X$, given $Z=5$, is uniform on $\{0,1,2,3,4,5\}$. It is - a calculation almost identical to the one we performed above gives that $\PP[ X= i| Z=5] = \frac{1}{6}$ for each $i=0,1,2,3,4,5$. 

One more observation at the end. Note that we drew $n=1,000,000$ simulations this time. While it is probably an overkill for this particular example, conditional probabilities in general require more simulations than unconditional ones. Of course, that is because we reject most of our original draws. Indeed, the size of the vector `X_cond` is 46339 - more than a $20$-fold decrease. This fact becomes particularly apparent when we try to use Monte Carlo for  conditional distributions associated with *continuous* random vectors as we will see in out next problem. 
</div>

<div class="example">
Let $X$ and $Y$ be independent random variables where $X$ has the $N(0,1)$ distribution and $Y$ the exponential distribution with parameter $\ld=1$. Find a graphical approximation to the conditional density of $Y$, given $X+Y\geq 1$. Repeat the same, but condition on $X+Y=1$.  
</div>

<p class="solution">


```r
nsim = 1e+05
x = rnorm(nsim)
y = rexp(nsim)

cond = x + y >= 1
x_cond = x[cond]
hist(x_cond, breaks = 100)
```

<img src="_main_files/figure-html/unnamed-chunk-114-1.png" width="672" style="display: block; margin: auto;" />


```r
nsim = 1e+05
eps = 0.1
x = rnorm(nsim)
y = rexp(nsim)
cond = (1 - eps < x + y) & (x + y < 1 + eps)
x_cond = x[cond]
hist(x_cond, breaks = 100)
```

<img src="_main_files/figure-html/unnamed-chunk-115-1.png" width="672" style="display: block; margin: auto;" />

</p>

<div class="comments">
*Math.* In the case of conditioning on $X+Y\geq 1$ we repeated the same procedure as in the discrete case. We simply rejected all draws that do not satisfy the condition.

When Conditioning on $X+Y=1$, however, you immediately encounter a  problem  that you don't get with discrete distributions. The event $\{ X+Y=1\}$ has probability $0$ and will never happen.
That means that our strategy form the previous problem will simply not work - you will reject **all** draws. The problem goes beyond a particular approach to the problem, as the conditional probabilities such as $\PP[ Y \geq 0 | X+Y=1]$ are not well defined. Indeed, the formula
$$ \PP[ Y \geq 0 | X+Y=1] "=" \frac{\PP[ Y\geq 0 \text{ and } X+Y=1]}{ \PP[X+Y=1]}$$
requires that the probability in the denominator be strictly positive. Otherwise you are dividing by zero. The theoretical solution to this is by no means simple and requires mathematics beyond the scope of these notes. Practically, there is a very simple way of going around it. Instead of conditioning on the zero-probability event $X+Y=1$, we use  a slightly more relaxed condition
$$ X+Y \in (1-\eps, 1+\eps) $$ for a small, but positive, $\eps$. In many cases of interest, this approximation works very well, as long as $\eps$ is not too big. How big? Well, that will depend on the particular problem, as well as on the number of simulations you are drawing. The best way is to try several values and experiment. For example, if we chose $\eps=0.01$ in our problem, the number of elements in `x_cond` (i.e., the number of non-rejected draws) would be on the order of $100$, which may be considered to small to produce an accurate histogram. On the other hand, when $\eps=1$, your result will be inaccurate because. The rule of thumb is to take the smallest $\eps$ you can, while keeping the number of non-rejected draws sufficiently large. 
</div>


## Additional Problems for Chapter 2

<div class="problem">


1. Find the Weibull distribution in R's help system.<!-- ' -->
Simulate $n=10000$ draws from the Weibull distribution with shape parameter $2$ and scale parameter $3$. Draw a histogram of your simulations. 

2.  Suppose that the vector `x` contains $n=10000$ simulations from the standard
    normal $\mu=0, \sigma=1)$. Without simulating any new random numbers,
    transform it into the vector `y` such that `y` is a vector of $n=10000$
    simulations from the normal with $\mu=1$ and $\sigma=0.5$. Draw histograms
    of both `x` and `y` on the same plot. (*Note:* the extra parameter `add` is
    used to superimpose plots. You may want to use different colors, too. Use
    the e parameter `col` for that. )

3.  Starting with `x=seq(-3,3,by=0.1)`, define the appropriate vector `y` and
    use `x` and `y` to plot the graph of the cdf of the standard normal. The
    command you want to use is `plot` with the following extra arguments
     - `type="l"` (to get a smooth line instead of a bunch of points). 
     - `main="The CDF of the standard normal"` (to set the title), and
     -  another argument (which you must look up yourself) that will set the $y$-axis label to $F(x)$. 

</div>
<div class="solution">


<part> 1. </part>


```r
x = rweibull(10000, shape = 2, scale = 3)
hist(x)
```

<img src="_main_files/figure-html/unnamed-chunk-268-1.png" width="672" style="display: block; margin: auto;" />

<part> 2. </part>

Let $X$ be a normally distributed random variable, with parameters $\mu_X$ and $\sigma_X$. When we apply a linear transformation $Y = \alpha X + \beta$ to X, the result $Y$ has a normal distribution again, but with different parameters. These parameters, call them $\mu_Y$ and $\sigma_Y$, are easily identified by taking the expected value and the variance:

\begin{align} \mu_Y & = \EE[Y] = \alpha \EE[X] + \beta = \alpha \mu_X + \beta \\
\sigma_Y^2 & = \Var[Y] = \Var[\alpha X + \beta] = \alpha^2 \Var[X] = \alpha^2 \sigma_X^2 
\end{align}

In the problem we are given $\mu_X=0$ and $\sigma_X=1$, so we must take $\alpha = 0.5$ and $\beta=1$ to get $\mu_Y=1$ and $\sigma_Y=0.5$ (note that this is
exactly the opposite of taking $z$-scores, where we transform a general normal into the standard normal). In R


```r
x = rnorm(10000)
y = 0.5 * x + 1
```

Let's check that the parameters of `y` are as as required: 


```r
(mean(y))
## [1] 1.002488
(sd(y))
## [1] 0.4989339
```

<part> 3. </part>


```r
x = seq(-3, 3, by = 0.1)
y = pnorm(x)
plot(x, y, type = "l", ylab = "F(x)", main = "The CDF of the standard normal")
```

<img src="_main_files/figure-html/unnamed-chunk-271-1.png" width="672" style="display: block; margin: auto;" />


</div>

<div class="problem">



1. Simulate $n=1000$ draws from the  distribution whose distribution table is given by
<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> 2 </th>
   <th style="text-align:right;"> 4 </th>
   <th style="text-align:right;"> 8 </th>
   <th style="text-align:right;"> 16 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 0.2 </td>
   <td style="text-align:right;"> 0.3 </td>
   <td style="text-align:right;"> 0.1 </td>
   <td style="text-align:right;"> 0.4 </td>
  </tr>
</tbody>
</table>
   Draw a histogram of your results.

2.  You may have learned in probability how to compute the pdf $f_Y(y)$ of a
    transformation $Y=g(X)$ of a random variable with pdf $f_X(x)$. Suppose
    that you forgot how to do that, but have access to $10,000$ simulations from
    the distribution of $X$. How would you get an approximate idea about the
    shape of the function $f_Y$?
    
       More concretely, take $X$ to be exponentially distributed with parameter $1$ and
       $g(x) = \sin(x)$ and produce a picture that approximates the pdf $f_Y$ of $Y$.
       (Note: even if you remember how to do this analytically, you will run into a
       difficulty. The function $\sin(x)$ is not one-to-one and the method usually
       taught in probability classes will not apply. If you learned how to do it in the
       many-to-one case of $g(x)= \sin(x)$, kudos to your instructor!)

3.  Let $X$ be a random variable with the Cauchy distribution, and $Y =
    \operatorname{arctan}(X)$. R allows you to simulate from the Cauchy
    distribution, even if you do not know what it is. How would you use that to
    make an educated guess as to what the distribution of $Y$ is? To make your
    life easier, consider $\tfrac{2}{\pi} Y$ first. 



</div>

<div class="solution">



<part> 1. </part>


```r
x = sample(c(2, 4, 8, 16), size = 10000, prob = c(0.2, 0.3, 0.1, 0.4), replace = TRUE)
hist(x)
```

<img src="_main_files/figure-html/unnamed-chunk-273-1.png" width="672" style="display: block; margin: auto;" />

Note: given that we are dealing with a discrete distribution, 
a contingency table might be a better choice:

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> 2 </th>
   <th style="text-align:right;"> 4 </th>
   <th style="text-align:right;"> 8 </th>
   <th style="text-align:right;"> 16 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 2044 </td>
   <td style="text-align:right;"> 2945 </td>
   <td style="text-align:right;"> 1045 </td>
   <td style="text-align:right;"> 3966 </td>
  </tr>
</tbody>
</table>


<part> 2. </part>

We apply the function $\sin$ to the simulations. The histogram of the obtained values is going to be a good (graphical) approximation to the pdf of the transformed random variable:


```r
x = rexp(100000)
y = sin(x)
hist(y)
```

<img src="_main_files/figure-html/unnamed-chunk-275-1.png" width="672" style="display: block; margin: auto;" />

<part> 3. </part>

Having learned that histograms look like the pdfs of the underlying distributions, we draw the histogram:


```r
x = rcauchy(10000)
y = atan(x) * 2/pi
hist(y)
```

<img src="_main_files/figure-html/unnamed-chunk-276-1.png" width="672" style="display: block; margin: auto;" />

It looks uniform (if we replace $10,000$ by $100,000$ it will look even more uniform). We conclude that $2/\pi \arctan(X)$ is probably uniformly distributed on $(-1,1)$. Hence,  $Y = \arctan(X)$ is probably uniformly distributed on $(-\pi/2, \pi/2)$. 


</div>

<div class="problem">

A basic method for obtaining simulations draws from distributions other than the
uniform is the **transformation method**. The idea is to start with (pseudo)
random numbers, i.e., draws from the uniform $U(0,1)$ distribution, and then
apply a function $g$ to each simulation. The difficulty is, of course, how to
choose the right function $g$.
<br>
Let $X$ be a random variable with a continuous and strictly increasing cdf $F$.
What is the distribution of $Y=F(X)$? What does that have to do with the transformation method?
   
(Hint: if you are having difficulty with this problem, feel free to run some experiments using R. )

</div>
<div class="solution">

Let us perform an experiment where $X \sim N(0,1)$. Remembering that the cdf is given by the R function `pnorm`:

```r
x = rnorm(100000)
y = pnorm(x)
hist(y)
```

<img src="_main_files/figure-html/unnamed-chunk-277-1.png" width="672" style="display: block; margin: auto;" />

This looks like a histogram of a uniform distribution on $(0,1)$. 
Let's try with some other continuous distributions


```r
x1 = rexp(100000)
x2 = rcauchy(100000)
x3 = runif(100000)
x4 = rgamma(100000, shape = 3)
par(mfrow = c(2, 2))
hist(pexp(x1))
hist(pcauchy(x2))
hist(punif(x3))
hist(pgamma(x4, shape = 3))
```

<img src="_main_files/figure-html/unnamed-chunk-278-1.png" width="672" style="display: block; margin: auto;" />

All of those point to the same conjecture, namely that $F(X)$ is 
uniformly distributed on $(0,1)$. 
To prove that, we 
take $Y=F(X)$ and try to compute that cdf $F_Y$ of $Y$:
$$F_Y(y) = \PP[ Y \leq y] = \PP[ F(X) \leq y]$$
Since $F$ is strictly increasing, it admits an inverse $F^{-1}$. 
Moreover, for any $y \in (0,1)$, 
the set of all values of $x$ such that $F(x)\leq y$ (the red range) is 
exactly the interval $(-\infty, F^{-1}(y)]$ (the blue range), as in 
the picture below:

<center>
<img src="pics/cdf_plot.png" width="60%" style="padding:10px" style="display: block; margin: auto;" />
</center>  

Hence,  $$F_Y(y)=\PP[Y\leq y] = \PP[ F(X) \leq y] = \PP[ X \leq F^{-1}(y) ] = F(F^{-1}(y)) = y, 
\text{ for } y\in (0,1).$$ The cdf $F_Y$ is, therefore, equal to the cdf 
of a uniform on $(0,1)$.
Since the cdf uniquely determines the distribution,  $Y$ must be uniformly 
distributed on $(0,1)$. 

</div>

<div class="problemec">

1. Let $f_1$ and $f_2$ be two pdfs. We take a constant $\alpha \in (0,1)$ and define the function $f$ by
$$ f(x) = \alpha f_1(x) + (1-\alpha) f_2(x).$$
The function $f$ is the pdf of a third distribution, which is called the
**mixture of $f_1$ and $f_2$ with weights $\alpha$ and $1-\alpha$**.
Assuming that you know how to simulate from the distributions with pdfs $f_1$
and $f_2$, how would you draw $10,000$ simulations from the mixture $f$? Show
your method on the example of a mixture of $N(0,1)$ and $N(4,1)$ with
$\alpha=2/3$. Plot the histogram of the obtained sample (play with the
parameter `breaks` until you get a nice picture.)
   
   (*Hint:* start with two vectors, the first containing $10,000$ simulations from
$f_1$ and the second from $f_2$. Then "toss" $10,000$ biased coins with
$\mathbb{P}[ H ] = \alpha$ ... )

2. The **double exponential** or
**Laplace** distribution is a continuous probability distribution whose pdf is
given by $$ \tfrac{1}{2} \exp(-|x|), x\in {\mathbb R}.$$ This distribution
is not built into R. How would you produce simulations from the double
exponential using R?


</div>
<div class="solution">

<part> 1. </part>

The idea is that before each draw a biased coin (with $\PP[H]=\alpha$) is tossed. If $H$ is obtained, we draw from the distribution with pdf $f_1$. Otherwise, we draw from the distribution with pdf $f_2$. We write a function which performs one such simulation, and then use the command `replicate` to call it  several times and  store the results in the vector:

```r
single_draw = function() {
    coin = sample(c(1, 2), prob = c(2/3, 1/3), size = 1, replace = TRUE)
    if (coin == 1) 
        return(rnorm(1)) else return(rnorm(1, mean = 4, sd = 1))
}

nsim = 10000
y = replicate(nsim, single_draw())

hist(y)
```

<img src="_main_files/figure-html/unnamed-chunk-280-1.png" width="672" style="display: block; margin: auto;" />

As you can see, the histogram has two "humps", one centered around $0$ and the other 
centered around $4$. The first one is taller, which reflects the higher 
weight ($\alpha=2/3$) that $N(0,1)$ has in this mixture. 

If you wanted to write a more succinct vectorized code (which is not necessarily faster in this case), you could also do something like this

```r
nsim = 10000
alpha = 2/3
x1 = rnorm(nsim)
x2 = rnorm(nsim, mean = 4, sd = 1)
coin = sample(c(TRUE, FALSE), size = nsim, prob = c(alpha, 1 - alpha), replace = TRUE)
y = ifelse(coin, x1, x2)
```
The function `ifelse` is a vectorized version of the `if-then` blok and takes three arguments of equal length. The first one is a vector of logical values `c`, and the other two, `x1, x2` only need to be of the same type. The result of is a vector whose value at the position `i` is `x1[i]` if `c[i]==TRUE` and `x2[i]` otherwise. 

<part> 2. </part>

The Laplace distribution can be understood as a mixture, with $\alpha=1/2$ of two distributions. The first one is an exponential, and the second one is the exponential, but with the negative sign. 
Using our strategy from part 1. above, we could get simulations of it as follows:

```r
nsim = 100000
alpha = 1/2
x1 = rexp(nsim)
x2 = -rexp(nsim)  # note the minus sign in front of rexp
coin = sample(c(TRUE, FALSE), size = nsim, prob = c(alpha, 1 - alpha), replace = TRUE)
y = ifelse(coin, x1, x2)
hist(y)
```

<img src="_main_files/figure-html/unnamed-chunk-282-1.png" width="672" style="display: block; margin: auto;" />

You can do this more efficiently if you realize that every time we toss a coin and choose between 
`x1` and `x2`, we are really choosing the sign in front of an exponentially distributed random 
variable. In other words, we can use `coin` as 
a vector of random signs for a vector or draws from the exponential distribution:


```r
nsim = 10000
alpha = 1/2
x = rexp(nsim)
coin = sample(c(-1, 1), size = nsim, prob = c(alpha, 1 - alpha), replace = TRUE)
y = coin * x
hist(y)
```

<img src="_main_files/figure-html/unnamed-chunk-283-1.png" width="672" style="display: block; margin: auto;" />


</div>

<div class="problem">

Let `x=rnorm(1000)` and `y=rnorm(1000)`. For each of the following pairs, use the permutation test to decide whether they  are independent or not

   a) `x^2+y^2` and `y^2`
   b) `(x+y)/sqrt(2)` and `(x-y)/sqrt(2)`
   c) `x` and `1`
   d) `x^2+y^2` and `atan(y/x)`. 

What your conclusions in b. and d. suggest about the geometric properties of the distribution of $(X,Y)$ where  $X$ and $Y$ are independent with standard normal distributions? 
   
(Note: do not worry about dividing by $0$ in d. It will  happen with probability $0$.)
   
</div>
<div class="solution">

Let us start by writing a function to save some keystrokes


```r
permutation_test = function(z, w) {
    par(mfrow = c(2, 2))
    plot(z, w, asp = 1)
    plot(z, sample(w), asp = 1)
    plot(z, sample(w), asp = 1)
    plot(z, sample(w), asp = 1)
}

x = rnorm(1000)
y = rnorm(1000)
```

<part> 1. </part>


```r
permutation_test(x^2 + y^2, y^2)
```

<img src="_main_files/figure-html/unnamed-chunk-285-1.png" width="768" style="display: block; margin: auto;" />
The first plot is very different from the other three. Therefore,the vectors are probably *not* independent. 

<part> 2. </part>


```r
permutation_test((x + y)/sqrt(2), (x - y)/sqrt(2))
```

<img src="_main_files/figure-html/unnamed-chunk-286-1.png" width="768" style="display: block; margin: auto;" />
The first plot could easily be confused for one of the other three. Therefore the vectors are probably independent. 


<part> 3. </part>


```r
# we have to use rep(1,length(x)) to get a vector of 1s of the same length as x.
# R will not recycle it properly if you simply write 1
permutation_test(x, rep(1, length(x)))
```

<img src="_main_files/figure-html/unnamed-chunk-287-1.png" width="768" style="display: block; margin: auto;" />
The plots look very similar. Therefore, the vectors are probably independent. We could have known this without drawing any graphs. Anything is independent of a constant random variable (vector).

<part> 4. </part>


```r
permutation_test(x^2 + y^2, atan(y/x))
```

<img src="_main_files/figure-html/unnamed-chunk-288-1.png" width="768" style="display: block; margin: auto;" />

Plots look very similar to each other. Therefore, `z` and `w` are probably independent. 

These plots in b) and d) reveal that the distribution of the random vector $(X,Y)$ consisting of two independent standard normals is probably rotation invariant. In b) we are asked to compare the coordinates of the vector obtained from $(X,Y)$ by a rotation at $45$ degrees around the origin. The fact that independence persisted suggests that  components remain independent even after a (specific) rotation. If you tried  rotations by different angles you would get the same result. The experiment in d) told us that the (squared) distance $X^2+Y^2$ and angle between $(X,Y)$ and the $x$-are independent. This is also something that one would expect from a rotationally-invariant distribution. Indeed, the distribution of the distance to the origin should not depend on the direction. 

It is important to note that none of this proves anything. It is simply numerical evidence for a given conclusion. 

</div>

<div class="problem">

Simulate $n=10000$ draws from the joint distribution given by the following
table:

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> 1 </th>
   <th style="text-align:right;"> 2 </th>
   <th style="text-align:right;"> 3 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;"> 1 </td>
   <td style="text-align:right;"> 0.1 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0.3 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> 2 </td>
   <td style="text-align:right;"> 0.1 </td>
   <td style="text-align:right;"> 0.1 </td>
   <td style="text-align:right;"> 0.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> 3 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0.4 </td>
  </tr>
</tbody>
</table>

Display the contingency table of your results, as well as a table showing the
"errors", i.e., differences between the theoretical frequencies (i.e.,
probabilities given above) and the obtained relative frequencies in the sample.

</div>
<div class="solution">

We are using the procedure from Section 2.2 in the notes. 


```r
nsim = 10000

joint_distribution_long = data.frame(
   x = c(1, 1, 1, 2, 2, 2, 3, 3, 3),
   y = c(1, 2, 3, 1, 2, 3, 1, 2, 3)
   )
probabilities_long =
   c(0.1, 0.0, 0.3,
     0.1, 0.1, 0.0,
     0.0, 0.0, 0.4)

sampled_rows = sample(
   x = 1:nrow(joint_distribution_long),
   size = nsim,
   replace = TRUE,
   prob = probabilities_long
)

draws = joint_distribution_long[sampled_rows,]

(freq = table(draws))
##    y
## x      1    2    3
##   1  946    0 3044
##   2 1015 1018    0
##   3    0    0 3977

(rel_freq = table(draws) / nsim)
##    y
## x        1      2      3
##   1 0.0946 0.0000 0.3044
##   2 0.1015 0.1018 0.0000
##   3 0.0000 0.0000 0.3977

(th_freq = matrix(probabilities_long, byrow = TRUE, nrow = 3))
##      [,1] [,2] [,3]
## [1,]  0.1  0.0  0.3
## [2,]  0.1  0.1  0.0
## [3,]  0.0  0.0  0.4

(err = rel_freq - th_freq)
##    y
## x         1       2       3
##   1 -0.0054  0.0000  0.0044
##   2  0.0015  0.0018  0.0000
##   3  0.0000  0.0000 -0.0023
```

</div>

<div class="problem">

Estimate the following integrals using Monte Carlo 

a) $\int_0^1 \cos(x)\, dx$

b) $\int_{-\infty}^{\infty}\frac{1}{\sqrt{2\pi}}\frac{e^{-x^2/2}}{1+x^4}\,dx$

c) $\int_0^{\infty} e^{-x^3-x}\, dx$
   
d) $\int_{-\infty}^{\infty} \frac{\cos(x^2)}{1+x^2}\, dx$ (extra credit) 

</div>
<div class="solution">

The idea here is to use the "fundamental theorem of statistics"
$$ \EE[ g(X) ] = \int g(x)\, f_X(x)\, dx $$
where $f_X$ is the pdf of $X$ and $g$ is any reasonably well-behaved function. 
Normally, one would use the integral on the right to compute the expectation
on the left. We are flipping the logic, and using the expectation 
(which we can approximate via Monte Carlo) to estimate the integral on the 
right. 

<part> a) </part>

We pick $g(x) = \cos(x)$ and $X$ a r.v. with a uniform distribution on $(0,1)$, so that $f_X(x) = 1$ for $x\in (0,1)$ and $0$ otherwise:


```r
nsim = 10000
x = runif(nsim)
y = cos(x)
mean(y)
## [1] 0.841413
```
For comparison, the exact value of the integral is $\sin(1) \approx 0.841471$. 

<part> b) </part>

We cannot use the uniform distribution anymore, because the limits of integration are $\pm \infty$. Part of the expression inside the integral can be recognized as a (standard) normal density, so we take $X \sim N(0,1)$ and $g(x) =
1/(1+x^4)$


```r
nsim = 10000
x = rnorm(nsim)
y = 1/(1 + x^4)
mean(y)
## [1] 0.6790206
```
The "exact" value (i.e., very precise approximation to this integral obtained using another numerical method) is $0.676763$. 

<part> c) </part>

We integrate $g(x) = \exp(-x^3)$ against the exponential pdf $f_X(x) = \exp(-x)$, for $x>0$: 

```r
nsim = 10000
x = rexp(nsim)
y = exp(-x^3)
mean(y)
## [1] 0.5678835
```
A close approximation of the true value is $0.56889$.

<part> d) </part>

In this case, a possible choice of the distribution for $X$ is the Cauchy distribution (no worries if you never heard about it), whose pdf is $f_X(x) = \frac{1}{\pi(1+x^2)}$, so that $g(x) = \pi \cos(x^2)$:

```r
nsim = 10000
x = rcauchy(nsim)
y = pi * cos(x^2)
mean(y)
## [1] 1.304995
```
The "exact" value is $1.30561$. 

</div>

<div class="problem">

The **tricylinder** is a solid body constructed as follows: create three
cylinders of radius 1 around each of the three coordinate axes and intersect
them:
<figure style="
    display: flex;
    flex-flow: column;
    padding: 5px;
    margin: auto;">
 <img src="pics/tricylinder.png" style="border-bottom: -10px;"></img>
<figcaption style=" 
    background-color: #fff;
    color: #000;
    font: italic smaller sans-serif;
    padding: 3px;
    text-align: center;">
Image by Ag2gaeh - Own work, CC BY-SA 4.0, https://commons.wikimedia.org/w/index.php?curid=63604565 
</figcaption>
</figure>

Use Monte Carlo to estimate the volume of the tricylinder and 
check your estimate against the exact value $8(2-\sqrt{2})$. </p>

</div>
<div class="solution">

  By the very construction, it is clear that the entire tricylinder lies within the cube $[-1,1]\times [-1,1] \times [-1,1]$. Therefore, we can compute its volume by simulating random draws from the uniform distribution in that cube, and
computing the relative frequence of those values that fall inside the tricylinder. The whole point is that it is easy to check, given a point $(x,y,z)$,  whether it lies inside the tricylinder or not. Indeed, the answer is "yes" if and only if all three of the following inequalities are satisfied:
$$ x^2+y^2 \le 1,\  x^2+z^2\leq 1 \text{ and } y^2+z^2\leq 1.$$

```r
nsim = 10000
x = runif(nsim, min = -1, max = 1)
y = runif(nsim, min = -1, max = 1)
z = runif(nsim, min = -1, max = 1)
is_in = (x^2 + y^2 <= 1) & (x^2 + z^2 <= 1) & (y^2 + z^2 <= 1)
(2^3 * sum(is_in)/nsim)
## [1] 4.692
```
We multiplied by $2^3$ because that is the volume of the cube $[-1,1]\times [-1,1] \times [-1,1]$. Without it, we would get the portion of the cube taken by the tricylinder, and not its volume. 

The true value of $8(2-\sqrt{2})$ is, approximately, $4.6862$.

</div>

<div class="problemec">

Read about the **Monty Hall Problem** online (the introduction to its 
[Wikipedia page](https://en.wikipedia.org/wiki/Monty_Hall_problem) has a nice  description),
Use Monte Carlo to compare the two possible strategies (switching and
not-switching) and decide which is better.
</div>
<div class="solution">

The host knows where the car is and what contestant's guess is. If those two are the same (i.e., contestant guessed right), he will choose one of the two remaining doors at random. If not, he simply shows the contestant the other door with the goat behind it. This exactly what the function `show_door` implements:


```r
show_door = function(car, guess) {
    all_doors = c(1, 2, 3)
    goat_doors = all_doors[all_doors != car]
    
    if (car == guess) {
        random_goat_door = sample(goat_doors, size = 1)
        return(random_goat_door)
    } else {
        the_other_goat_door = goat_doors[goat_doors != guess]
        return(the_other_goat_door)
    }
}
```

Next, we write a function which simulates the outcome of a single game. It will have one argument, `switch` which will determine whether the contestant switches the door or not. 


```r
one_game = function(switch) {
    all_doors = c(1, 2, 3)
    car = sample(all_doors, size = 1)
    guess = sample(all_doors, size = 1)
    
    if (switch) {
        unguessed_doors = all_doors[all_doors != guess]
        shown_door = show_door(car, guess)
        switched_guess = unguessed_doors[unguessed_doors != shown_door]
        return(switched_guess == car)
    } else {
        return(guess == car)
    }
}
```

Finally we run two batches of $10,000$ simulations, one with `switch=TRUE` and another with `switch=FALSE`:

```r
nsim = 10000
switch_doors = replicate(nsim, one_game(TRUE))
dont_switch_doors = replicate(nsim, one_game(FALSE))
(prob_with_switching = mean(switch_doors))
## [1] 0.6568
(prob_without_switching = mean(dont_switch_doors))
## [1] 0.3282
```
Therefore, the probability of winning after switching is about double the probability of winning without switching. Switching is good for you!

(A philosophical note: this was the most "agnostic" approach to this simulation. Simulations can often be simplified with a bit of insight. For example, we could have realized that the switching strategy simply flips the correctness of the guess (from "correct" to "wrong" and vice versa) and used it to write a much shorter answer. Ultimately, we could have realized that, because the probability of the initial guess being correct is $1/3$, switching leads to a correct guess in $2/3$ of the cases (and not switching in only $1/3$ of the cases). In this case, the whole code would be `sample(c("correct", "incorrect"), size=10000, prob= c(2/3,1/3), replacement=TRUE)`, which is an extremely inefficient way to estimate the value of the number $2/3$!)
</div>


<div class="problem">

We learned how to simulate from a joint distribution of two discrete vectors
$(X,Y$) by thinking of it as one-dimensional distribution but with values
represented by pairs of numbers. Here is another way this can be done:
  
1. Find the marginal distribution of one of them, say $X$, and simulate from it

2. Given the value you just obtained, let's <!--'--> call it $x$,  simulate from the conditional distribution of $Y$, given $X=x$. 

Implement this procedure on the following joint distribution:
<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> 1 </th>
   <th style="text-align:right;"> 2 </th>
   <th style="text-align:right;"> 3 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;"> 1 </td>
   <td style="text-align:right;"> 0.1 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0.3 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> 2 </td>
   <td style="text-align:right;"> 0.1 </td>
   <td style="text-align:right;"> 0.1 </td>
   <td style="text-align:right;"> 0.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> 3 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0.4 </td>
  </tr>
</tbody>
</table>

Display the contingency table of your simulations, first using counts, and then
using relative frequencies. Compare to the theoretical values (i.e., the
probabilities in the table above).

</div>
<div class="solution">


```r
margin_X = c(0.2, 0.1, 0.7 )
cond_Y_X = matrix(
   c( 0.5, 0.0, 3/7,
      0.5, 1.0, 0.0,
      0.0, 0.0, 4/7),
   byrow=TRUE,
   nrow=3)

single_draw = function() {
   x = sample(c(1,2,3), size=1, prob=margin_X)
   y = sample(c(1,2,3), size=1, prob=cond_Y_X[,x])
   return(c(x,y))
}

nsim=10000
df = data.frame(
   t(replicate(nsim, single_draw()))
)
colnames(df) = c("x","y")
t(table(df))
##    x
## y      1    2    3
##   1 1000    0 2986
##   2  983 1067    0
##   3    0    0 3964
```

The variables `margin_X` and `cond_X_Y` are what you get when you compute the marginal and the conditional distribution from the given joint-distribution table as you did in your probability class. 

The function `single_draw` performs a single draw form the distribution of $(X,Y)$ by first drawing the value of $X$ from its marginal distribution. Then, it chooses the row of the conditional distribution table according to the obtained value of $X$ and simulates from it. 

The function `replicate` is used to repeat `single_draw` many times and collect the results. By default, `replicate` attaches the output of each new "replication" as a new column and not a row, so we need to transpose the final product. That is what the function `t()` is for. We turn the result into a data frame because the function `table` knows how to handle data frames automatically. Another use of the transpose gives `x` the horizontal axis, and `y` the vertical one, like in the statement of the problem. 
</div>

<div class="problem">

Exactly one percent of the people in a given population have a certain disease.
The accuracy of the diagnostic test for it is such that it
detects the sick as sick with probability $0.95$ and the healthy as healthy with
probability $0.9$. A person chosen at random from the population tested
positive. What is the probability the he/she is, in fact, sick. Do the problem
both analytically and by Monte Carlo.

</div>
<div class="solution">

This is a classical example of the unexpected conclusions we sometimes get from the Bayes formula. As usual, we depict the situation using a tree diagram:
<center>
<img src="pics/bayes_pic.png" width="50%" style="padding:10px" style="display: block; margin: auto;" />
</center>  
The person can test positive (denoted by $tS$ in the plot) in two ways. By actually being sick ($S$) and then testing positive, or by being healthy and then testing positive. Bayes formula (or simply a look at the picture above) gives us
$$ \PP[ S | tS ] = \frac{ 0.01 \times 0.95}{ 0.01\times 0.95 + 0.1\times 0.99 } \approx 0.088.$$
Thus, even when the test is quite accurate, the probability of getting a false positive is very high. 

Let us do the same via Monte Carlo. We proceed like this. First we "pick a person" from the population by sampling from `c("H", "S")` and then "test" this person. After repeating this `nsim` times, we condition on the positive test, by removing all draws where the test was negative. This leaves us with a population of people who tested positive, and we simply need to see what proportion of those were are actually sick.


```r
single_draw = function() {
    x = sample(c("H", "S"), size = 1, prob = c(0.99, 0.01))
    if (x == "H") {
        y = sample(c("tH", "tS"), size = 1, prob = c(0.9, 0.1))
    } else {
        y = sample(c("tH", "tS"), size = 1, prob = c(0.05, 0.95))
    }
    return(c(x, y))
}

nsim = 100000
df = data.frame(t(replicate(nsim, single_draw())))
colnames(df) = c("status", "test_result")

cond = (df$test_result == "tS")
df_cond = df[cond, ]
(prob = mean(df_cond$status == "S"))
## [1] 0.09049444
```
</div>


<div class="problem">

A point is chosen at random, uniformly in the unit cube 
$[0,1]\times[0,1]\times [0,1]$. Its distance to the origin $(0,0)$ is measured, and
turns out to be equal to $1.5$.

Use simulations to estimate the shape of the pdf of the conditional distribution
of the point's <!--'--> distance to $(1,1,1)$. Compare it to the unconditional
case, i.e., the case where no information about the distance to $(0,0,0)$ is
known.

Compute the mean of this (conditional) distribution for a few values of
the parameter $\eps$ you use to deal with conditioning in 
the continuous case. Make sure you include values of $\eps$ on both sides 
of the spectrum - too big, and too small.

</div>
<div class="solution">

We want to vary the parameter `eps` later, so let's write a function first:

```r
simulate = function(nsim, eps, conditional) {
    x = runif(nsim)
    y = runif(nsim)
    z = runif(nsim)
    d1 = sqrt((1 - x)^2 + (1 - y)^2 + (1 - z)^2)
    if (conditional) {
        d0 = sqrt(x^2 + y^2 + z^2)
        cond = (d0 > 1.5 - eps) & (d0 < 1.5 + eps)
        return(d1[cond])
    } else {
        return(d1)
    }
}
```
Histograms may be used as approximations to the pdf of the (conditional) distribution:

```r
nsim = 1000000
eps = 0.1
d1_cond = simulate(nsim, eps, conditional = TRUE)
d1 = simulate(nsim, eps, conditional = FALSE)
par(mfrow = c(1, 2))
hist(d1, breaks = 50)
hist(d1_cond, breaks = 50)
```

<img src="_main_files/figure-html/unnamed-chunk-304-1.png" width="672" style="display: block; margin: auto;" />
Note that, in addition to clearly different shapes,  the supports of the two distributions differ, too. Unconditionally, the distance to $(1,1,1)$ can be any number from $0$ to $\sqrt{3} \approx 1.73$. If it is known that the distance to $(0,0,0)$ is $1.5$, however, the distance to $(1,1,1)$ cannot be larger than $1$.

Finally, let us compare the results we obtain by varying the parameter $\eps$, first with `nsim=100000`:

```r
nsim = 100000
epss = c(2, 1, 0.5, 0.3, 0.2, 0.1, 0.02, 0.01, 0.001, 0.0001)
d1s = vector(length = length(epss))
for (eps in epss) {
    sims = simulate(nsim, eps = eps, conditional = TRUE)
    print(paste("Eps = ", eps, ", Draws = ", length(sims), " Mean = ", mean(sims)))
}
## [1] "Eps =  2 , Draws =  100000  Mean =  0.960342228444094"
## [1] "Eps =  1 , Draws =  93544  Mean =  0.929726634933677"
## [1] "Eps =  0.5 , Draws =  47806  Mean =  0.753283074403369"
## [1] "Eps =  0.3 , Draws =  20224  Mean =  0.595529938750379"
## [1] "Eps =  0.2 , Draws =  10658  Mean =  0.496362640888308"
## [1] "Eps =  0.1 , Draws =  3930  Mean =  0.36209037346251"
## [1] "Eps =  0.02 , Draws =  647  Mean =  0.310139851430518"
## [1] "Eps =  0.01 , Draws =  354  Mean =  0.30926108659397"
## [1] "Eps =  0.001 , Draws =  33  Mean =  0.334224126737702"
## [1] "Eps =  0.0001 , Draws =  4  Mean =  0.275311021507976"
```
The same experiment, but with `nsim=1000000` yields:

```r
nsim = 1000000
epss = c(2, 1, 0.5, 0.3, 0.2, 0.1, 0.02, 0.01, 0.001, 0.0001)
d1s = vector(length = length(epss))
for (eps in epss) {
    sims = simulate(nsim, eps = eps, conditional = TRUE)
    print(paste("Eps = ", eps, ", Draws = ", length(sims), " Mean = ", mean(sims)))
}
## [1] "Eps =  2 , Draws =  1000000  Mean =  0.960506260771782"
## [1] "Eps =  1 , Draws =  934686  Mean =  0.928432784386909"
## [1] "Eps =  0.5 , Draws =  477123  Mean =  0.753640516540863"
## [1] "Eps =  0.3 , Draws =  201634  Mean =  0.596081456550207"
## [1] "Eps =  0.2 , Draws =  103279  Mean =  0.494799342061533"
## [1] "Eps =  0.1 , Draws =  38529  Mean =  0.361335849359528"
## [1] "Eps =  0.02 , Draws =  6944  Mean =  0.3064588479179"
## [1] "Eps =  0.01 , Draws =  3371  Mean =  0.30560770769072"
## [1] "Eps =  0.001 , Draws =  331  Mean =  0.301734543251831"
## [1] "Eps =  0.0001 , Draws =  33  Mean =  0.31500400469211"
```
</div>


⬇︎ In case you were wondering, the text below belongs to footnotes from somewhere high above.⬇︎

<!--chapter:end:02-simulation.Rmd-->




\usepackage{mydefs_long}
\newcommand{\PP}{{\mathbb{P}}}
\newcommand{\N}{{\mathbb{N}}}
\newcommand{\bZ}{{\mathbb{Z}}}
\newcommand{\R}{{\mathbb{R}}}

\newcommand{\sS}{{\mathcal{S}}}
\newcommand{\EE}{{\mathbb{E}}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}
\newcommand{\corr}{\operatorname{corr}}
\newcommand{\Id}{\operatorname{Id}}

\newcommand{\ld}{\lambda}
\newcommand{\eand}{\text{ and }}
\newcommand{\efor}{\text{ for }}
\newcommand{\eforall}{\text{ forall }}

\newcommand{\tot}{\tfrac{1}{2}}
\newcommand{\seqz}[1]{\{#1_n\}_{n\in \N_0}}
\newcommand{\abs}[1]{|#1|}
\newcommand{\set}[1]{\{#1\}}
\newcommand{\tf}[2]{\frac{#1}{#2}}
\newcommand{\ot}{\frac{1}{2}}
\newcommand{\oo}[1]{\frac{1}{#1}}
\newcommand{\eps}{\varepsilon}
\newcommand{\inds}[1]{\mathbf{1}_{\{#1\}}}
\newcommand{\sets}[2]{ \{ #1\, : \, #2\}}
\newcommand{\ft}[2]{#1,\dots, #2}
\newcommand{\seq}[1]{\{#1_n\}_{n\in\N}}
\newcommand{\ewhere}{\text{ where }}

\renewcommand{\Pr}{{\mathbf P}}
\newcommand{\upn}[2]{#1^{(#2)}}
\newcommand{\Prup}[1]{\upn{\Pr}{#1}}
\newcommand{\Prz}{\Prup{0}}
\newcommand{\Pro}{\Prup{1}}
\newcommand{\Prn}{\Prup{n}}
\newcommand{\aaa}[1]{{a}^{(#1)}}
\renewcommand{\aa}[1]{{a}^{(#1)}}
\newcommand{\aaz}{\aaa{0}}
\newcommand{\az}{\aa{0}}
\renewcommand{\SS}{\sS}
\newcommand{\pnp}[1]{p^{(#1)}}
\newcommand{\pn}{\pnp{n}}
\newcommand{\tpnp}[1]{\tilde{p}^{(#1)}}
\newcommand{\tpn}{\tpnp{n}}
\newcommand{\fnf}[1]{f^{(#1)}}
\newcommand{\fn}{\fnf{n}}
\newcommand{\tofro}{\leftrightarrow}
\newcommand{\Vn}{V^{(n)}}

\newcommand{\mat}[1]{\begin{bmatrix}#1\end{bmatrix}}
          
# Random Walks
<div style="counter-reset: thechapter 3;"> </div>


## What are stochastic processes?

A **stochastic process** is a sequence - finite or infinite - of random
variables. We usually write $\{X_n\}_{n\in\N_0}$  or $\{X_n\}_{0\leq n \leq T}$,
depending on whether we are talking about an infinite or a finite sequence. The
number $T\in \N_0$ is called the **time horizon**, and we sometimes set
$T=+\infty$ when the sequence is infinite. The index $n$ is often interpreted
as *time*, so that a stochastic process can be thought of as a model of a random
process evolving in time. The initial value of the index $n$ is often normalized
to $0$, even though other values may be used. This it usually very clear from
the context.

It is important that all the random variables $X_0, X_1,\dots$ "live" on the
same sample space $\Omega$. This way, we can talk about the notion of a
**trajectory** or a **sample path** of a stochastic process: it is, simply, the
sequence of numbers $$X_0(\omega), X_1(\omega), \dots$$ but with $\omega\in
\Omega$ considered "fixed". In other words, we can think of a stochastic
process as a random variable whose value is not a number, but  sequence of
numbers. This will become much clearer once we introduce enough examples.

## The Simple Symmetric Random Walk

A stochastic process $\{X\}_{n\in\N_0}$ is said to be a 
**simple symmetric random walk (SSRW)** if

1.  $X_0=0$,

2.  the random variables $\delta_1 = X_1-X_0$, 
$\delta_2 = X_2 - X_1$, ..., called the **steps** of the random walk, are independent

3.  each $\delta_n$ has a **coin-toss distribution**, i.e., its distribution 
is given by $$\PP[ \delta_n = 1] = \PP[ \delta_n=-1] = \tfrac{1}{2} \text{ for each } n.$$

Some comments:

 - This definition captures the main features of an
    idealized notion of a particle that gets shoved, randomly, in one of
    two possible directions, over and over. In other words, these "shoves"
    force the particle to take a step, and steps are 
    modeled by the random variables
    variables $\delta_1,\delta_2, \dots$. The position of the
    particle after $n$ steps is $X_n$; indeed,
    $$X_n = \delta_1 + \delta_2 + \dots + \delta_n \text{ for }n\in \N.$$ It
    is important to assume that any two steps are independent of each
    other -  the most important properties of random walks depend on this
    in a critical way.

- Sometimes, we only need a finite number of steps of a random walk,
    so we only care about the random variables $X_0, X_1,\dots, X_T$. This
    stochastic process (now with a finite time horizon $T$) will also be
    called a random walk. If we want to stress that the horizon is not infinite, 
    we sometimes call it the **finite-horizon random walk**. Whether $T$ is 
    finite or infinite is usually 
    clear from the context.
    
- The starting point $X_0=0$ is just a normalization. Sometimes we
    need more flexibility and allow our process to start at $X_0=x$ for
    some $x\in \N$. To stress that fact, we talk about the random walk **starting at $x$**.
    If no starting point is mentioned, you should assume $X_0=0$.

-  We will talk about **biased** (or **asymmetric**) random walks a bit later. 
    The only
    difference will be that the probabilities of each $\delta_n$ taking
    values $1$ or $-1$ will be $p\in (0,1)$ and $1-p$,  and not necessarily $\tot$, 
    The probability $p$ cannot change 
    from step to step and the steps $\delta_1, \delta_2, \dots$ will continue to be 
    independent from each other.
    
- The word simple in its name refers to the fact that distribution of every 
    step is a coin toss. You can easily imagine a more complicated mechanism that 
    would govern each step. For example, not only the direction, but also the 
    size of the step could be random. In fact, any distribution you can think
    of can be used as a step distribution of a random walk. Unfortunately, we will 
    have very little to say about such, general, random walks in these notes.

## How to simulate random walks

In addition to being quite simple conceptually, random walks are also easy 
to simulate. The fact that the steps $\delta_n = X_n - X_{n-1}$ are independent
coin tosses immediately suggests a feasible strategy: 
simulate $T$ independent coin tosses first, and then define each 
$X_n$ as the sum of the first $n$ tosses. 

Before we implement this idea in R, let us agree on a few conventions which 
we will use whenever we simulate a stochastic process:

- the result of each simulation is a `data.frame` object
-  its columns will be the random variables $X_0$, $X_1$, \dots It is a good
idea to name your columns `X0`, `X1`, `X2`, etc.
- each row will represent one "draw"˜
˜µ
This is best achieved by the following two-stage approach in R:

a) write a function which will simulate a single trajectory 
of your process, If
your process comes with parameters, it is a good idea to include them
as arguments to this function. 

b) use the function `replicate` to stack together many such simulations and 
convert the result to a `data.frame`. Don't 
forget to transpose first (use the function `t`) because `replicate` works column by column, 
and not row by row. 



Let's implement this in the case of a simple random walk. Of course, it is
impossible to simulate a random walk on an infinite horizon ($T=\infty$) 
so we must restrict to finite-horizon random walks^[It is somewhat unfortunate that the standard notation for the time horizon, namely $T$, coincides with a
shortcut `T` for `TRUE` in R. Our example still works fine because this shortcut is used only if there is no variable named `T`.]. The function `cumsum` which
produces partial sums of its input comes in very handy.


```r
single_trajectory = function(T, p = 0.5) {
    delta = sample(c(-1, 1), size = T, replace = TRUE, prob = c(1 - p, p))
    x = cumsum(delta)
    return(x)
}
```

Next, we run the same function `nsim` times and record the results. It is a
lucky break that the default names given to columns are `X1`, `X2`, ... so we
don't have to rename them. We do have to add the zero-th column $X_0=0$ because, 
formally speaking, the "random variable" $X_0=0$ is a part of the stochastic
process. This needs to be done before other columns are added to maintain the
proper order of columns, which is important when you want to plot trajectories.


```r
simulate_walk = function(nsim, T, p = 0.5) {
  return(
    data.frame(
      X0 = 0,
      t(replicate(nsim, single_trajectory(T, p)))
    ))
}
walk = simulate_walk(nsim = 10000, T = 500)
```


## Two ways of looking at a stochastic proceses

Now that we have the data frame `walk`, we can explore in at least two qualitatively different ways:

### Column-wise (distributionally)

Here we focus on individual random variables (column) or pairs, triplets, etc. of random variables and study their (joint) distributions. For example, we can plot histograms of the random variables $X_5, X_8, X_{30}$ or $X_{500}$:

<center>

<img src="_main_files/figure-html/unnamed-chunk-144-1.png" width="100%" style="display: block; margin: auto;" />

</center>

We can also use various (graphical or not) devices to understand joint distributions of pairs of random variables:

<center>
<img src="_main_files/figure-html/unnamed-chunk-145-1.png" width="672" style="display: block; margin: auto;" />
</center>

### Row-wise (trajectorially or path-wise)

If we focus on what is going on in a given row of `walk`, we are going to see 
a different cross-section of our stochastic process. This way we are fixing the
state of the world $\omega$ (represented by a row of `walk`), i.e., the particular
realization of our process, but
varying the time parameter. A typical picture associated to a trajectory 
of a random walk is the following



<img src="_main_files/figure-html/unnamed-chunk-146-1.png" width="672" style="display: block; margin: auto;" />

You can try to combine the two approaches (if you must) and plot several trajectories on the same plot. 
While this produces pretty pictures (and has one or two genuine applications), it usually leads to a 
sensory overload. Note that the trajectories below are jittered a bit. That means that the positions of the points are randomly shifted by a small amount. This allows us to see features of the plot that would otherwise be hidden because of the overlap.

<center>

<img src="_main_files/figure-html/unnamed-chunk-147-1.png" width="672" style="display: block; margin: auto;" />

</center>


## The path space

The row-wise (or path-wise or trajectory-wise) view of the random walk described above illustrates a 
very important point: the random walk (and random processes in general) can be
seen as random "variable" whose values are not merely numbers; they are sequences of numbers (trajectories). 
In other words, a random process is simply a "random trajectory". 
We can simulate this random trajectory as we did above, but simulating the steps and adding them up, but we could also 
take a different approach. We could build the set of
all possible trajectories, and then pick a random trajectory out of it. 

For a random walk on a finite horizon $T$, a trajectory is
simply a sequence of natural numbers starting from $0$. Different
realizations of the coin-tosses $\delta_n$ will lead to different
trajectories, but not every sequence of natural numbers corresponds to a
trajectory. For example $(0,3,4,5)$ is not possible because the increments of the random walk can only take values $1$ or $-1$. In fact, a finite
sequence $(x_0, x_1, \dots, x_T)$ is a (possible) sample path of a
random walk if and only if $x_0=0$ and $x_{k}-x_{k-1} \in \{-1,1\}$
for each $k$. For example, when $T=3$, there are $8$ possible trajectories:
$$ \begin{align} \Omega = \{ 
&(0,1,2,3), (0,1,2,1),(0,1,0,2), (0,1,0,-1), \\
& (0,-1,-2,-3), (0,-1,-2,-1), (0,-1,0,-2), (0,-1,0,1)\}
\end{align}$$
When you (mentally) picture them, think of  their graphs:

<center>

<img src="_main_files/figure-html/unnamed-chunk-148-1.png" width="672" style="display: block; margin: auto;" />
</center>

Each trajectory corresponds to a particular combinations of the values of the 
increments $(\delta_1,\dots, \delta_T)$, each such combination happens with probability $2^{-T}$. 
This means that any two trajectories are equally likely. That is convenient, because
this puts uniform probability on the collection of trajectories. We are now ready to 
implement our simulation procedure in R; let us write the function `single_trajectory` using this
approach and use it to simulate a few trajectories. We assume that a function `all_paths(T)` which returns
a list of all possible paths with horizon $T$ has already been implemented (more info about a possible 
implementation in R is given in a problem below):


```r
T=5
Omega = all_paths(T)
single_trajectory = function() {
  return(unlist(sample(size=1,Omega)))
}

simulate_walk = function(nsim, p=0.5) {
   return(data.frame(
            X0=0, 
            t(replicate(nsim, single_trajectory()))
        ))
}
```


## The distribution of $X_n$

Building a path space is not simply an exercise in abstraction. Here is how we can use is to
understand the distribution of the position of the random walk:

<div class="example">
Let $X$ be a simple symmetric random walk with time horizon $T=5$. What is the probability that $X_{5}=1$?
</div>
<div class="solution">
Let $\Omega$ be the path space, i.e., the set of all possible trajectories of length $5$ - there are $2^{5}=32$ of them. The probability that $X_{5}=1$ is the probability that a randomly picked path from $\Omega$ will take the value $1$ at $n=5$. Since all paths are equally likely, we need to *count*
the number of paths with value $1$ at $n=5$ and then divide by the total number of paths, i.e., $32$.

So, how many paths are there that take value $1$ at $n=5$? Each path is built out of steps of absolute value $1$. Some of them go up (call them up-steps) and some of them go down (down-steps). A moment's though reveals that the only way to reach $1$ in $5$ steps is if you have exactly $3$ up-steps and $2$ down-steps. Conversely, any path that has $3$ up-steps and $2$ down-steps ends at $1$. 

This realization transforms the problem into the following: how many paths are there with exactly $3$ up-steps (note that we don't have to specify that there are $2$ down-steps - it will happen automatically). The only difference between different paths with exactly $3$ up-steps is the position of these up-steps. In some of them the up-steps happen right at the start, in some at the very end, and in some they are scattered around. Each path with $3$ up-steps is uniquely determined by the list of positions of those up-steps, i.e., with a size-$3$ subset of $\{1,2,3,4,5\}$. This is not a surprise at all, since each path is build out of increments, and positions of positive increments clearly determine values of all increments.

The problem has now become purely mathematical: how many size-$3$ subsets of $\{1,2,3,4,5\}$ are there? The answer comes in the form of a *binomial coefficient* $\binom{5}{3}$ whose value is $10$ - there are exactly ten ways to pick three positions out of five. Therefore,
$$ \PP[ X_{5} = 1] = 10 \times 2^{-5} = \frac{5}{16}.$$
</div>

Can we do this in general?

<div class="example">
Let $X$ be a simple symmetric random walk with time horizon $T$. What is the probability that $X_{n}=k$?
</div>
<div class="solution">
The reasoning from the last example still applies. A trajectory with $u$ up-steps and $d$ down-steps 
will end at $u-d$, so we must have $u-d=k$. On the other hand $u+d=n$ since all steps that are not up-steps are necessarily down-steps. This gives as a simple linear system with two equations and two unknowns which solves to $u = (n+k)/2$, $d=(n-k)/2$. Note the $n$ and $k$ must have the same parity for this solution to be meaningful. Also, $k$ must be between $-n$ and $n$. 

Having figured out how many up-steps is necessary to reach $k$, all we need to do is count the number of trajectories with that many up-steps. Like before, we can do that by counting the number of 
ways we can choose their position among $n$ steps, and, like before, the answer is the binomial coefficient $\binom{n}{u}$ where $u=(n+k)/2$. Dividing by the total number of trajectories gives us the final answer:
$$ \PP[ X_n = k ] = \binom{n}{ (n+k)/2} 2^{-n},$$
for all $k$ between $-n$ and $n$ with same parity as $n$. For all other $k$, the probability is $0$.
</div>

The binomial coefficient and the $n$-th power suggest that the distribution of $X_n$ might have something
to do with the binomial distribution. It is clearly not the binomial, since it 
can take negative values, but it is related. To figure out what is going on, let us first remember what the binomial distribution is all about. Formally, it is a discrete distribution with two parameters $n\in\N$ and $p\in (0,1)$. Its support is $\set{0,1,2,\dots, n}$ and the distribution is given by the following table, where $q=1-p$

<center>
<div style="width: 80%">
0 | 1 | 2 | ... | k | ... |n
:---:|:---:|:---:|:---:|:---:|:---:|:---:|
 $\binom{n}{0} q^n$ | $\binom{n}{1} p q^{n-1}$ | $\binom{n}{2} p^2 q^{n-2}$ | ... | $\binom{n}{k} p^k q^{n-k}$ | ... | $\binom{n}{n} p^n$
</div>
</center>

The binomial distribution is best understood, however, when it is expressed as a "number of successes". 
More precisely, 

> If $B_1,B_2,\dots, B_n$ are $n$ *independent* Bernoulli random variables with 
> *the same* parameter $p$, then their sum $B_1+\dots+B_n$ has a binomial distribution with 
> parameters $n$ and $p$.

We think of $B_1, \dots, B_n$ as indicator random variables of "successes" in $n$ independent
"experiments" each of which "succeeds" with probability $p$. A canonical example is tossing a biased coin
$n$ times and counting the number of "heads". 

We know that the position $X_n$ at time $n$ of the random walk admits the representation
$$ X_n = \delta_1+\delta_2+\dots+\delta_n,$$
just like the binomial random variable. The distribution of $\delta_k$ is not Bernoulli, though, since it takes the values $-1$ and $1$, and not $0,1$. This is easily fixed by applying the linear transformation $x\mapsto \ot (x+1)$; indeed $( -1 +1)/2 = 0$ and $( 1 + 1) / 2 =1$, and, so, 
$$ \ot (\delta_k+1)\text{ is a Bernoulli random variable with parameter } p=\frac{1}{2}.$$
Consequently, if we add all $B_k = \tot(1+\delta_k)$ and remember our discussion from above we get the following statement

> In a simple symmetric random walk the random variable $\frac{1}{2} (n + X_n)$ has 
> the binomial distribution with parameters $n$ and $p=1/2$, for each $n$.

Can you use that fact to rederive the distribution of $X_n$? 

## Biased random walks

If the steps of the random walk preferred one direction to the other,
the definition would need to be tweaked a little bit and the word "symmetric" in the name gets replaced by "biased" (or "asymmetric"):

A stochastic process $\{X\}_{n\in\N_0}$ is said to be a 
**simple biased random walk with parameter $p\in (0,1)$ if

1.  $X_0=0$,

2.  the random variables $\delta_1 = X_1-X_0$, 
$\delta_2 = X_2 - X_1$, ..., called the **steps** of the random walk, are independent and

3.  each $\delta_n$ has a **biased coin-toss distribution**, i.e., its distribution 
is given by
    $$\PP[ \delta_n = 1] = p \text{ and } \PP[ \delta_n=-1] = 1-p \text{ for each } n.$$

As far as the distribution of $X_n$ is concerned, we don't expect 
it to be the same as in the symmetric case. After all, the 
biased random walk (think $p=0.999$) will prefer one direction over 
the other. Our trick 
with writing $\ot(n+X_n)$ as a sum of Bernoulli random variables still works. 
We just have to remember 
that $p$ is not $\ot$ anymore to conclude that $\tot (X_n + n)$ has the binomial 
distribution with parameters $n$ and $p$; if we put $u = (n+k)/2$ we get
\begin{align}
\PP[ X_n = k] &= \PP[ \tot (X_n+n) = u] = \binom{n}{u} p^u q^{n-u}\\ & = \binom{n}{\ot (n+k)} p^{\ot (n+k)} q^{\ot (n-k)}. 
\end{align}
Note that be binomial coefficient stays the same as in the symmetric case, 
but the factor $2^{-n} = (1/2)^{\ot (n+k)} (1/2)^{\ot(n-k)}$ becomes 
$p^{\ot (n+k)} q^{\ot (n-k)}$.

Can we reuse the sample space $\Omega$ to build a
biased random walk? Yes, we can, but we  need to
assign possibly different probabilities to individuals. Indeed, if
$p=0.99$, the probability that all the increments $\delta$ of a $10$-step 
random walk take the
value $+1$ is $(0.99)^{10} \approx 0.90$. This is much larger 
than the probability that all steps take the value $-1$, which is $(0.01)^{10}= 10^{-20}$. 

In general, the probability that a particular path is picked out of $\Omega$
will depend on the number of up-steps and down-steps; more precisely it equals
$p^u q^{n-u}$ where $u$ is the number of up-steps. The interesting thing is that
the number of up-steps $u$ depends only on the final position $x_n$ of the path; indeed $u =
\ot (n+x_n)$. This way, all paths of length $T=5$ that end up at $1$ get the
same probability of being chosen, namely $p^3 q^2$. Let us use the awful
seizure-inducing graph with multiple paths for good, and adjust the each path
according to its probability; some jitter has been added to deal with overlap.
The lighter-colored paths are less likely to happen then the darker-colored paths.

<center>

<img src="_main_files/figure-html/unnamed-chunk-150-1.png" width="672" style="display: block; margin: auto;" />

</center>




## Additional problems for Chapter 3

<div class="problem">

Let $\seqz{X}$ be a simple symmetric random walk. Which of the following
processes are simple random walks?

1.  $\seqz{2 X}$ ?

2.  $\seqz{X^2}$ ?

3.  $\seqz{-X}$ ?

4.  $\seqz{ Y}$, where $Y_n = X_{5+n}-X_5$ ?

How about the case $p\ne \tot$?
</div>
<div class="solution">

1.  No - the support of the distribution of $X_1$ is $\set{-2,2}$ and
    not $\set{-1,1}$.

2.  No - $X_1^2=1$, and not $\pm 1$ with equal probabilities.

3.  Yes - all parts of the definition check out.

4.  Yes - all parts of the definition check out.

The answers are the same if $p\ne \tot$, but, in 3., $-X_n$ comes with
probability $1-p$ of an up-step, and not $p$. 
</div>


<div class="problem">

Let $\seqz{X}$ be a simple random walk.  

1. Find the distribution of the product  $X_1 X_2$

2. Compute $\PP[ \abs{X_1 X_2 X_3}]=2$

3. Find the probability that $X$ will hit neither the level $2$ nor the level $-2$ until (and including) time $T=3$

4. Find the independent pairs of random variables among the following choices:
    - $X_1$ and $X_2$
    - $X_4 - X_2$ and $X_3$
    - $X_4 - X_2$ and $X_6 - X_5$
    - $X_1+X_3$ and $X_2+X_4$. 
    

</div>
<div class="solution">

<part> 1. </part>

The possible paths when the time horizon is
$T=2$ are $$(0,1,2), (0,1,0), (0,-1,-2) \text{ and } (0,-1,0)$$ 
The values of the product $X_1  X_2$ on those paths
are $2, 0, 2$, and $0$, respectively. Each happens with probability
$0.25$. Therefore $\PP[ X_1 X_2 = 0]
= \PP[ X_1 X_2 = 2] = \tot$, i.e., its distribution is given by

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> 0 </th>
   <th style="text-align:right;"> 2 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 0.5 </td>
   <td style="text-align:right;"> 0.5 </td>
  </tr>
</tbody>
</table>


<part> 2. </part>

$|X_1 X_2 X_3|=2$ only in the following two cases
$$ X_1=1, X_2=2, X_3=1 \text{ or } X_1=-1, X_2=-2, X_3=-1.$$
Each of those paths has probability $1/8$ of happening, so $\PP[ |X_1 X_2 X_3| = 2] = 1/4$. 


<part> 3. </part>

The only chance for $X$ to hit $2$ or $−2$ before or at T = 3 is at 
time $n = 2$. Since $X_2 \in \{ -2, 0, 2\}$, this happens with probability
$\PP[ X_2 \in \{-2,2\}] = 1 - \PP[X_2 = 0] = 0.5$.

<part> 4. </part>

The only independent pair is $X_4 - X_2$ and $X_6 - X_5$ because 
the two random variables are build out of 
completely different increments: $X_4 - X_2 = \delta_3+\delta_4$ while $X_6-X_5 = \delta_6$. 


The others are not independent. For example, if we are told that $X_1+X_3 = 4$, it necessarily 
follows that $\delta_1= \delta_2=\delta_3=1$. 
Hence, $X_2+X_4 = 2\delta_1+2\delta_2+\delta_3+\delta_4 = 5+\delta_4$ which 
cannot be less than $4$. On the other hand, without any information, $X_2+X_4$ can easily 
be negative.

</div>

<div class="problem">

Let $\seqz{X}$ be a simple random walk.  

1. Compute $\PP[ X_{32} = 4| X_8 = 6]$. 

2. Compute $\PP[ X_9 = 3 \text{ and } X_{15}=5 ]$

3. (extra credit) Compute $\PP[ X_7 + X_{12} = X_1 + X_{16}]$
</div>
<div class="solution">

<part> 1. </part>

This is the same as $\PP[ X_{32}- X_8 = -2 | X_8=6]$. The random variables $X_8$ and $X_{32}-X_8$ are independent (as they are built out of different $\delta$s), so we can remove the conditioning. 

It remains to compute $\PP[X_{32} - X_8 = -2]$. For that, we note that $X_{32} - X_8$ is a sum of $24$ independent coin tosses, so its distribution is the same as that of $X_{24}$. Therefore, by our formula for the distribution of $X_n$, we have
$$ \PP[X_{32}= 4 | X_8 = 6] = \PP[X_{24} = -2] = \binom{24}{11} 2^{-24}.$$
<part> 2. </part>

We have
\begin{align}
\PP[ X_9 = 3 \text{ and } X_{15}=5 ] & = \PP[ X_{15} = 5 | X_9 = 3] \times \PP[ X_9=3] \\ & = \PP[ X_6 = 2] \times \PP[X_9=3] = \binom{6}{4} 2^{-6} \binom{9}{6} 2^{-9},
\end{align}
where we used the same ideas as in 1. above

<part> 3. </part>

We rewrite everything using $\delta$s:
\begin{align} X_7+X_{12} = X_1+X_{16} &\Leftrightarrow X_7-X_1 = X_{16}-X_{12} \Leftrightarrow \delta_2+\dots+\delta_7 = \delta_{13} + \dots+\delta_{16}\\ & \Leftrightarrow (-\delta_2) + \dots + (-\delta_7) + \delta_{13}+ \dots + \delta_{16} = 0.
\end{align}

Since $-\delta_k$ has the same distribution as $\delta_k$ (both are coin tosses) and remains independent of all other $\delta_i$, the left-hand side of the last expression in the chain of equivalences above is a sum of $10$ indepenedent coin tosses. Therefore, the probability that it equals $0$ is the same as $\PP[X_{10}=0] = \binom{10}{5} 2^{-10}$.
</div>


<!--
  same_value_three_points
-->
<div class="problem">

Let $\seqz{X}$ be a simple random walk. For $n\in\N$ compute the probability that $X_{2n}$, $X_{4n}$ and $X_{6n}$ take the same value. 
</div>
<div class="solution">

Increments $X_{4n}-X_{2n}$ and
$X_{6n} - X_{4n}$ are independent, and each is a sum of $2n$ independent
coin tosses (therefore has the same distribution as $X_{2n}$). Hence,
$$\begin{aligned}
    \PP[ X_{2n} = X_{4n} \eand X_{4n} = X_{6n} ] 
    &= 
    \PP[ X_{4n} - X_{2n} = 0  \eand X_{6n} - X_{4n} = 0  ]\\ 
    &=
    \PP[ X_{4n} - X_{2n} = 0] \times \PP[ X_{6n} - X_{4n}=0]\\
    &=\PP[ X_{2n}=0] \times \PP[ X_{2n} =0 ]\\ & = \binom{2n}{n} 2^{-2n}
    \binom{2n}{n} 2^{-2n} =  \binom{2n}{n}^2 2^{-4n}.
  \end{aligned}$$ 
</div>

<!--
  R-impl-all paths
-->
<div class="problemec">

Write an R function (call it `all_paths`) which takes  an integer argument `T` and returns a list of all possible paths of a random walk with time horizon $T$. 
(Note: Since vectors cannot have other vectors as elements, you will need to use a data structure called `list` for this. It behaves very much like a vector, so it should not be a problem.)
</div>
<div class="solution">

The implementation below uses the function `combn` which returns the list of all
subsets of a certain size of a certain vector. Since each path is determined by
the positions of its up-steps, we need to loop through all numbers $i$ from $0$
to $T$ and then list all subsets of the size $i$. The next step is to turn a set
of positions to a path of a random walk. This can be done in many ways; one is
implemented implemented in `choice_to_path` using vector indexing.


```r
choice_to_path = function(comb, T) {
    increments = rep(-1, T)
    increments[comb] = 1
    path = cumsum(increments)
    return(path)
}

all_paths = function(T) {
    Omega = list(2^T)
    index = 1
    for (i in 0:T) {
        choices = combn(T, i, simplify = FALSE)
        for (choice in choices) {
            Omega[[index]] = choice_to_path(choice, T)
            index = index + 1
        }
    }
    return(Omega)
}
```
</div>


<!--
  var_cov_corr
  ------------------------------------------------
-->
<div class="problem">

Let $\seqz{X}$ be a simple symmetric random walk. Given $n\in\N_0$ and
$k\in\N$, compute $\Var[X_n]$, $\Cov[X_n, X_{n+k}]$ and
$\corr[X_n, X_{n+k}]$, where $\Cov$ stands for the covariance and
$\corr$ for the correlation. (Note: look up $\Cov$ and $\corr$ if you forgot what they are). 

Compute $\lim_{n\to\infty} \corr[X_n, X_{n+k}]$. How would you interpret the result you obtained?
</div>
<div class="solution">

We have $\Var[\delta_i] = 1$ for each $i\in\N$, so
$$\Var[X_n] = \sum_{i=1}^n \Var[\delta_i] = n.$$ Since
$\EE[X_n] = \EE[X_{n+k}]=0$ and $X_{n+k} - X_n$ is independent of $X_n$,
we have $$\begin{aligned}
        \Cov[X_n,X_{n+k}] &= \EE[ X_n X_{n+k}] = \EE[ X_n (X_{n+k} - X_n)] + \EE[X_n^2] = \EE[X_n] \EE[X_{n+k} - X_n] + \EE[X_n^2]\\ &= \EE[X_n^2] = n.
    \end{aligned}$$ Finally, $$\begin{aligned}
         \corr[X_n, X_{n+k}] = \tf{\Cov[X_n, X_{n+k}]}{\sqrt{\Var[X_n]} \sqrt{\Var[X_{n+k}]}}
         = \tf{n}{\sqrt{n(n+k)}} = \sqrt{\tf{n}{n+k}}.
    \end{aligned}$$
When we let $n\to\infty$, we get $1$. This means that the positions of the random walk, $k$ steps apart, get closer and close to perfect correlation as $n\to\infty$. If you know $X_n$ and $n$ is large, you almost know $X_{n+k}$, at least at the typical scale of $X_n$.
</div>

<!--
  area_under_walk
  ------------------------------
-->
<div class="problem">

Let $\seqz{X}$ be a simple random walk with $\PP[X_1=1]=p\in (0,1)$, and 
let $A_n$ be the (signed) area under its graph (in the picture below, $A_n$ is 
the area of the blue part minus the area of the orange part). 

<img src="_main_files/figure-html/unnamed-chunk-309-1.png" width="90%" style="display: block; margin: auto;" />


1. Find a formula for $A_n$ in terms of $X_1,\dots, X_n$. 

2. Compute $\EE[A_n]$ and $\Var[A_n]$, for $n\in\N$. (You will find the following 
formulas helpful $\sum_{j=1}^n j = \frac{n(n+1)}{2}$ and $\sum_{j=1}^n
j^2=\frac{n(n+1)(2n+1)}{6}$.)
</div>
<div class="solution">

<part> 1. </part>

The dashed lines divide the area "under" the graph in separate trapezoids, so $A_n$ is the sum of their areas. The trapezoid between $X_{k-1}$ and $X_{k}$ has
area $1 \times (X_{k-1}+X_{k})/2$, so 
$$ A_n = \sum_{k=1}^n \tfrac{1}{2} (X_{k-1}+X_k) = X_1+X_2+\dots+X_{n-1} + \tot X_n.$$

<part> 2. </part>

Let us first represent $A_n$ in terms of the sequence $\set{\delta_n}_{n\in\N_0}$
\begin{align}
A_n &= (\delta_1) + (\delta_1+\delta_2) + \dots + (\delta_1+\dots + \delta_{n-1}) +
\tot (\delta_1+ \dots + \delta_n)\\
&= (n-\tot) \delta_1 + (n-1-\tot) \delta_2 + \dots + \tot \delta_n.
\end{align}

We compute $\EE[\delta_k]=p-q$  so that, by the formulas from the problem, 
\begin{align}
  \EE[A_n]&= \sum_{j=1}^n (j-\tot) \EE[\delta_{n-j}] = (p-q)
   \Big( \tot n(n+1) - \tot n\Big)\\ & = \frac{p-q}{2} n^2
\end{align}

Just like above, but relying on the independence of $\set{\delta_n}$ and the fact that $\Var[\delta_k]=1-(2p-1)^2=4pq$, we have
\begin{align}
\Var[A_n] &=
 \sum_{j=1}^n \Var[(j - \tot) \delta_{n-j}]
= \sum_{j=1}^n (j-\tot)^2 \Var[\delta_k] \\&
= 4pq \sum_{j=1}^n (j-\tot)^2 = 4pq \Big( \sum_{j=1}^n j^2 - \sum_{j=1}^n j + \frac{1}{4} n \Big)\\
& = 4pq \Big( \frac{n}{n+1}{(2n+1)}{6} - \frac{n (n+1)}{2} + \frac{n}{4})
= \frac{pq}{3} ( 4 n^3 - n)
\end{align}
</div>

⬇︎ In case you were wondering, the text below belongs to footnotes from somewhere high above.⬇︎

<!--chapter:end:03-random-walks.Rmd-->



\usepackage{mydefs_long}
\newcommand{\PP}{{\mathbb{P}}}
\newcommand{\N}{{\mathbb{N}}}
\newcommand{\bZ}{{\mathbb{Z}}}
\newcommand{\R}{{\mathbb{R}}}

\newcommand{\sS}{{\mathcal{S}}}
\newcommand{\EE}{{\mathbb{E}}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}
\newcommand{\corr}{\operatorname{corr}}
\newcommand{\Id}{\operatorname{Id}}

\newcommand{\ld}{\lambda}
\newcommand{\eand}{\text{ and }}
\newcommand{\efor}{\text{ for }}
\newcommand{\eforall}{\text{ forall }}

\newcommand{\tot}{\tfrac{1}{2}}
\newcommand{\seqz}[1]{\{#1_n\}_{n\in \N_0}}
\newcommand{\abs}[1]{|#1|}
\newcommand{\set}[1]{\{#1\}}
\newcommand{\tf}[2]{\frac{#1}{#2}}
\newcommand{\ot}{\frac{1}{2}}
\newcommand{\oo}[1]{\frac{1}{#1}}
\newcommand{\eps}{\varepsilon}
\newcommand{\inds}[1]{\mathbf{1}_{\{#1\}}}
\newcommand{\sets}[2]{ \{ #1\, : \, #2\}}
\newcommand{\ft}[2]{#1,\dots, #2}
\newcommand{\seq}[1]{\{#1_n\}_{n\in\N}}
\newcommand{\ewhere}{\text{ where }}

\renewcommand{\Pr}{{\mathbf P}}
\newcommand{\upn}[2]{#1^{(#2)}}
\newcommand{\Prup}[1]{\upn{\Pr}{#1}}
\newcommand{\Prz}{\Prup{0}}
\newcommand{\Pro}{\Prup{1}}
\newcommand{\Prn}{\Prup{n}}
\newcommand{\aaa}[1]{{a}^{(#1)}}
\renewcommand{\aa}[1]{{a}^{(#1)}}
\newcommand{\aaz}{\aaa{0}}
\newcommand{\az}{\aa{0}}
\renewcommand{\SS}{\sS}
\newcommand{\pnp}[1]{p^{(#1)}}
\newcommand{\pn}{\pnp{n}}
\newcommand{\tpnp}[1]{\tilde{p}^{(#1)}}
\newcommand{\tpn}{\tpnp{n}}
\newcommand{\fnf}[1]{f^{(#1)}}
\newcommand{\fn}{\fnf{n}}
\newcommand{\tofro}{\leftrightarrow}
\newcommand{\Vn}{V^{(n)}}

\newcommand{\mat}[1]{\begin{bmatrix}#1\end{bmatrix}}
          


# More about Random Walks
<div style="counter-reset: thechapter 4;"> </div>

## The reflection principle


Counting trajectories in order to compute probabilities is a powerful method, 
as our next  example shows. It also reveals a potential
weakness of the combinatorial approach: it works best when all $\omega$
are equally likely (e.g., when $p=\tot$ in the case of the random walk).

We start by asking a simple question: what is the typical record value
of the random walk, i.e., how far "up" (or "right" depending on your point of view) 
does it typically get? Clearly,
the largest value it can attain is $T$. This happens only when 
all coin tosses came up $+1$, an extremely unlikely event - 
its probability is $2^{-T}$. On the other hand, this maximal value is at least $0$, since
$X_0=0$, already. A bit of thought reveals that any value between those
two extremes is possible, but it is not at all easy to compute their
probabilities.

More precisely, if $\{X_n\}$ is a simple random walk with time horizon
$T$. We define its **running-maximum process** $\seqz{M}$ by
$$M_n=\max(X_0,\dots, X_n),\ \efor 0 \leq n \leq T,$$ 
and ask what the probabilities $\PP[M_n = k]$ for $k=0,\dots, n$ are. 
An easy numerical solution to this problem can be given by simulation. We reuse the function 
`simulate_walk` defined at the beginning of the chapter, but also employ a new function, called `apply` which "applies" a function to each row (or column) of a data frame or a matrix. It seems to be tailor-made for our purpose^[The function `apply` is often used as a substitute for a `for` loop because it has  several advantages over it. First, the code is much easier to read and understand. Second, `apply` can easily be parallelized. Third, while this is not such a big issue anymore, `for` loops used to be orders of magnitude slower than the corresponding `apply` in the past. R's `for` loops got much better recently, but they still lag behind `apply` in some cases. To be fair, `apply` is known to use more *memory* than `for` in certain cases.] because we want to compute the maximum of each row of the simulation matrix (remember - the row means  keep the realization fixed, but vary the time-index $n$). The syntax of `apply` is simple - it needs the data frame, the margin (rows are coded as 1 and columns as 2; so when the margin is 1, the function is applied row-wise and when the margin is 2, the function is applied column-wise) and the function to be applied (`max` in our case). The output is a vector of size `nsim` with all row-wise maxima:


```r
walk = simulate_walk(nsim = 100000, T = 12, p = 0.5)
M = apply(walk, 1, max)
hist(M, breaks = seq(-0.5, 12.5, 1), probability = TRUE)
```

<img src="_main_files/figure-html/unnamed-chunk-167-1.png" width="672" style="display: block; margin: auto;" />

The overall shape of the distribution is as we expected; the support is $\{0,1,2,\dots, 12\}$ and the 
probabilities tend to decrease as $k$ gets larger. The unexpected feature is that $\PP[ M_{12} = 1]$ seems
to be the same as $\PP[ M_{12} = 2]$. It drops after that for $k=3$, but it looks like 
$\PP[ M_{12} = 3] = \PP[ M_{12}=4]$ again. Somehow the probability does not seem to change at 
all from $2i-1$ to $2i$. 

Fortunately, there is an explicit formula for the distribution of $M_n$ and we can derive it
by a nice counting trick known as **the reflection principle**. 



As usual, we may assume without loss of generality that $n=T$ since the
values of $\delta_{n+1}, \dots, \delta_T$ do not affect $M_n$ at all.
We start by picking a level $l\in\set{1,\dots, n}$ and first compute
the probability $\PP[M_n\geq l]$ - it will turn out to be easier than
attacking $\PP[ M_n=l]$ directly. The symmetry assumption $p=1/2$ ensures that
all trajectories are equally likely, so we can do this by counting the
number of trajectories whose maximal level reached is at least $l$, and
then multiply by $2^{-n}$.

What makes the computation of $\PP[M_n \geq l]$ a bit easier than that
of $\PP[ M_n = l]$ is the following equivalence

$$M_n\geq l \text{ if and only if } X_k=l \text{ for some } k.$$

In words, the set of trajectories whose maximum is at least $l$ is
exactly the same as the set of trajectories that hit the level $l$ at
some time. Let us denote the set of trajectories $\omega$ with this property by
$A_l$, so that $\PP[ M_n \geq l] = \PP[A_l]$. 
We can further split $A_l$ into three disjoint events $A_l^{>}$, 
$A_l^{=}$ and $A_l^{<}$, depending on whether $X_n<l$, $X_n=l$ or $X_n>l$.
In the picture below, the red trajectory is in $A_l^{>}$, the green trajectory in $A_l^=$ 
 the orange one in $A_l^{<}$, while the blue one is not in $A_l$ at all. 

<center>

<img src="_main_files/figure-html/unnamed-chunk-168-1.png" width="80%" style="display: block; margin: auto;" />

</center>

With the set of all trajectories $\Omega$ partitioned into four disjoint classes, namely $A^>_l, A^=_l, A^<_l$ and $(A_l)^c$, we are ready to reveal the main idea behind the reflection principle:

<center style="margin-bottom: 20px;">
$A_l^<$ and $A_l^>$ have exactly the same number of elements, i.e., $\# A^>_l = \# A_l^<$.
</center>


To see why that is true, start by choosing a trajectory $\omega\in A_l^{>}$ and denoting by
$\tau_l(\omega)$ the *first time* $\omega$ visits the
level $l$. Since $\omega \in A^>$ such a time clearly exists. 
Then we associate to $\omega$ another trajectory, call it $\bar{\omega}$, obtained from $\omega$
in the following way:

1. $\bar{\omega}$ and $\omega$ are the same until the time $\tau_l(\omega)$. 
2. After that, $\bar{\omega}$ is the reflection of $\omega$ around the level $l$. 

Equivalently the increments of $\omega$ and $\bar{\omega}$ are exactly the same up to time $\tau(\omega)$, and exactly the opposite afterwards. In the picture below - the orange trajectory is $\omega$ and the green trajectory is its 
"reflection" $\bar{\omega}$; note that they overlap until time $5$:

<center>

<img src="_main_files/figure-html/unnamed-chunk-169-1.png" width="80%" style="display: block; margin: auto;" />

</center>

Convince yourself that this procedure establishes
a bijection between the sets $A_l^{>}$ and $A_l^{<}$, making these two
sets equal in size. 

So why is it important to know that $\# A_l^> = \# A_l^<$? Because the trajectories in 
$A_l^>$ (as well as in $A_l^=$) are easy to count. 
For them, the requirement that the level 
$l$ is hit at a certain point is redundant; if you are at or above $l$
at the very end, you must have hit $l$ at a certain point.  
Therefore, $A_l^{>}$ is simply the family of those trajectories 
$\omega$ whose final positions $X_n(\omega)$ are somewhere strictly above $l$. Hence,
\begin{align}
       \PP[A_l^{>}] &= \PP[ X_n=l+1 \text{ or } X_n = l+2 \text{ or } \dots \text{ or }
     X_n=n]\\ & = \sum_{k=l+1}^n \PP[X_n = k]
\end{align}

Similarly,      $$\begin{aligned}
     \PP[ A_l^{=}] = \PP[X_n=l].\end{aligned}$$ 
Finally, by the reflection principle, 
$$\begin{aligned}
    \PP[ A_l^{<}] = \PP[A_l^{>}] = \sum_{k=l+1}^n \PP[X_n=k].\end{aligned}$$

Putting all of this
together, we get $$\begin{aligned}
    \PP[ A_l ] = \PP[ X_n=l] + 2 \sum_{k=l+1}^n \PP[X_n=k],\end{aligned}$$
so that $$\begin{aligned}
    \PP[ M_n = l ] &= \PP[ M_n \geq l] - \PP[ M_n \geq l+1]\\ & = \PP
    [A_l] - \PP
    [A_{l+1}]\\ & =
    \PP[ X_n = l] + 2 \PP[X_n = l+1] + 2\PP[X_n = l+2]+ \dots + 2\PP[ X_n=n] -\\
    & \qquad \qquad  \quad \  -
    \PP[ X_n = l+1] - 2 \PP[X_n = l+2] - \dots - 2\PP[ X_n=n]\\
    &= \PP[ X_n=l] + \PP[X_n=l+1]
    \end{aligned}$$
    
Now that we have the explicit expression
$$ \PP[ M_n = l ] = \PP[ X_n=l] + \PP[X_n = l+1] \text{ for } l=0,1,\dots, n,$$
we can shed some light on the fact on the shape of the histogram for $M_n$ we plotted above. 
Since $\PP[X_n=l]$ is $0$ if $n$ and $l$ don't have the same parity, it is clear that only
one of the probabilities $\PP[X_n=l]$ and $\PP[X_n=l+1]$ can be positive. It follows that, for
$n$ even, we have
\begin{align}
\PP[ M_n =0] &= \PP[X_n=0] + \PP[X_n=1] = \PP[X_n=0]\\
\PP[M_n=1] &= \PP[ X_n=1] + \PP[X_n=2] = \PP[X_n=2]\\
\PP[M_n=2] &= \PP[ X_n=2] + \PP[X_n=3] = \PP[X_n=2]\\
\PP[M_n=3] &= \PP[ X_n=3] + \PP[X_n=4] = \PP[X_n=4]\\
\PP[M_n=4] &= \PP[ X_n=4] + \PP[X_n=5] = \PP[X_n=4] \text{ etc.}
\end{align}
In a similar way, for $n$ odd, we have
\begin{align}
\PP[ M_n =0] &= \PP[X_n=0] + \PP[X_n=1] = \PP[X_n=1]\\
\PP[M_n=1] &= \PP[ X_n=1] + \PP[X_n=2] = \PP[X_n=1]\\
\PP[M_n=2] &= \PP[ X_n=2] + \PP[X_n=3] = \PP[X_n=3]\\
\PP[M_n=3] &= \PP[ X_n=3] + \PP[X_n=4] = \PP[X_n=3]\\
\PP[M_n=4] &= \PP[ X_n=4] + \PP[X_n=5] = \PP[X_n=5] \text{ etc.}
\end{align}

Here is a example of a typical problem where the reflection principle (i.e., the formula for $\PP[M_n=k]$) is used:

<div class="problem">
Let $X$ be a simple symmetric random walk. 
  What is the probability that $X_n\leq 0$ for all $0\leq n \leq T$? 
</div>

<div class="solution">

  This is really a question about the maximum, but in disguise.  The walk will stay negative or $0$ if and only if its running maximum $M_T$ at time $T$ takes the value $0$. By our formula for $\PP[M_n=l]$ we have
  $$ \PP[M_T=0] = \PP[X_T=0] + \PP[X_T = 1].$$
When $T=2N$ this evaluates to $\binom{2N}{N} 2^{-2N}$, and when $T=2N-1$ to
$\binom{2N-1}{N} 2^{-(2N-1)}$. 
</div>

<div class="problem">
  What is the probability that a simple symmetric random walk will reach the level $l=1$ in $T$ steps or fewer?
  What happens when $T\to\infty$?
</div>

<div class="solution">The first question is exactly the opposite of the question in our previous example, so the answer is
  $$ 1 - \PP[M_T=0] = 1- \PP[X_T=0] - \PP[X_T=1].$$
  As above, this evaluates to $\binom{2N}{N} 2^{-2N}$ when $T=2N$ is even (we skip the case of odd $T$ because it is very similar). 
  When $N\to\infty$, we expect $\binom{2N}{N}$ to go to $+\infty$ and $2^{-2N}$ to go to 
  $0$, so it is not immediately clear which term will win. 
  One way to make a guess is to think about it probabilistically: we are looking at the 
  probability $\PP[X_{2N}=0]$ that the random walk takes the 
  value $0$ after exactly $2N$ steps. Even though no  other (single) value is more 
  likely to happen, there are so many other values $X_{2N}$ could take (anything 
  from $-2N$ to $2N$ except for $0$) that we conjecture that
  its probability converges to $0$. A  formal mathematical argument which proves that
  our conjecture is, indeed correct, involves **Stirling's formula**:
  
  $$ N! \sim \sqrt{2 \pi N} \left( \tf{N}{e} \right)^N \text{ where }
   A_N \sim B_N \text{ means that } \lim_{N\to\infty} \tf{A_N}{B_N}=1. $$
  
  We write $\binom{2N}{N} = \tfrac{(2N)!}{N! N!}$ and apply Stirling's formula to each factorial (let's skip the details)
  to conclude that 
  $$ 
  \binom{2N}{N} 2^{-2n}\sim \frac{1}{\sqrt{N \pi}} 
  \text{ so that }  \lim_{N\to\infty}
  \binom{2N}{N} 2^{-2n}
  = 0 $$
</div>

The result of the previous problem implies the following important fact:

> The simple symmetric random walk will reach the level $1$, 
> with certainty, given enough time.

Indeed, we just proved that the probability of this not happening during the first $T$ steps
shrinks down to $0$ as $T\to\infty$.

But wait, there is more! By symmetry, the level $1$ can be replaced by $-1$. Also, once we hit
$1$, the random walk "renews itself" (this property is called the Strong
Markov Property and we will talk about it later), so it will eventually
hit the level $2$, as well. Continuing the same way, we get the
following remarkable result

> **Sooner or later, the symple symmetric random walk will visit any level.** 


We close this chapter with an application of the reflection principle
to a classical problem in probability and combinatorics. Feel free to skip it
if you want to. 

<div class="problemec">
Suppose that two
candidates, Daisy and Oscar, are running for office, and $T \in\N$
voters cast their ballots. Votes are counted the old-fashioned way,
namely by the same official, one by one, until all $T$ of them have been
processed. After each ballot is opened, the official records the number
of votes each candidate has received so far. At the end, the official
announces that Daisy has won by a margin of $k>0$ votes, i.e., that
Daisy got $(T+k)/2$ votes and Oscar the remaining $(T-k)/2$ votes. What
is the probability that at no time during the counting has Oscar been in
the lead?
</div>

<div class="solution">
We assume that the order in which the official counts the votes is
completely independent of the actual votes, and that each voter chooses
Daisy with probability $p\in (0,1)$ and Oscar with probability $q=1-p$.
We don't know *a priori* what $p$ is, and, as it turns out, we don't need to!

For $0 \leq n \leq T$, let $X_n$ be the number of votes received by
Daisy *minus* the number of votes received by Oscar in the first $n$
ballots. When the $n+1$-st vote is counted, $X_n$ either increases by
$1$ (if the vote was for Daisy), or decreases by 1 otherwise. The votes
are independent of each other and $X_0=0$, so $X_n$, $0\leq n \leq T$ is
a simple random walk with the time horizon $T$. The probability of an
up-step is $p\in (0,1)$, so this random walk is not necessarily
symmetric. The ballot problem can now be restated as follows:

*For a simple random walk $\set{X_n}_{0\leq n \leq T}$, what is the
probability that $X_n\geq 0$ **for all** $n$ with $0\leq n \leq T$, given that
$X_T=k$?*

The first step towards understanding the solution is the realization
that the exact value of $p$ does not matter. Indeed, we are interested
in the conditional probability $\PP[ F|G]=\PP[F\cap G]/\PP[G]$, where
$F$ denotes the set of $\omega$ whose corresponding trajectories always
stay non-negative, while the trajectories corresponding to $\omega\in G$
reach $k$ at time $T$. Each $\omega \in G$ consists of exactly $(T+k)/2$
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
trajectory that starts at $0$ and ends at $-k-2$, and vice versa. 

<img src="_main_files/figure-html/unnamed-chunk-170-1.png" width="80%" style="display: block; margin: auto;" />


The
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
above). A special case $k=0$ seems to be even
more popular - the number of $2n$-step paths from $0$ to $0$ never going
below zero is called the **$n$-th Catalan number** and equals 
 \begin{align}
   C_n=\frac{1}{n+1} \binom{2n}{n}.
 \end{align}
</div>

<div class="problemec">
Given $n\in\N$, compute $\PP[ \tau_1 = 2n+1 ]$ for a simple, but possibly biased, random walk. (Note: Clearly, $\PP[ \tau_1=2n]=0$.)
</div>
<div class="solution">
Let $A$ denote the set of all trajectories of length $2n+1$ that hit $1$ for the first time at time $2n+1$, and let $A'$ be the set of all trajectories of length $2n$ which stay at or below $0$ at all times and take the value $0$ at time $2n$. 
Clearly, each trajectory in $A$ is a trajectory in $A'$ with $1$ attached at the very end, so that $\# A = \# A'$. 

By the (last part) of the previous problem, $\# A' = \oo{n+1} \binom{2n}{n}$ (the $n^{\text{th}}$ Catalan number).
As above, all paths in $A$ have the same probability weight, namely $p^{n+1} q^n$, so 
$$ \PP[ \tau_1 = 2n+1]= p^{n+1} q^n \frac{1}{n+1} \binom{2n}{n}.$$

</div>

<div class="problemec">
Given  $p\in (0,1)$, 

1. compute $\PP[\tau_1<\infty]$;
2. decide whether or not $\EE[\tau_1]<\infty$;
3. compute, heuristically, the value of $\EE[\tau_1]$ for those $p$ for which it is finite.
</div>
<div class="solution">
<part> 1. </part>
  Using the previous problem, we need to sum the following series
  $$\sum_{k=0}^{\infty}  \PP[\tau_1=k] = \sum_{n=0}^{\infty} \PP[ \tau_1 = 2n+1] = 
  \sum_{n=0}^{\infty} p^{n+1} q^{n} \frac{1}{n+1} \binom{2n}{n} = p \sum_{n=0}^{\infty} (pq)^n \frac{1}{n+1} \binom{2n}{n}.$$
  The sum looks difficult, so let us plot a numerical approximation of its value for  different values of the parameter $p$ (the true value is plotted in orange):
  
<img src="_main_files/figure-html/unnamed-chunk-171-1.png" width="50%" style="display: block; margin: auto;" />
  
We conjecture that $\PP[ \tau_1 <\infty ] = 1$ for $p\geq \tot$, but $\PP[ \tau_1<\infty]<1$ for $p<\tot$. 
Indeed, using methods beyond the scope of these notes, it can be shown that our conjecture is true and that
$$ \PP[ \tau_1<\infty ] =\begin{cases} 1, & p \geq \tot \\ \frac{p}{q}, & p<\tot. \end{cases} $$
  
<part> 2. </part>

Since $\PP[ \tau_1= \infty]>0$ for $p<\tot$, we can immediately conclude that $\EE[\tau_1]=\infty$ in that 
case. Therefore, we assume that $p\geq \tot$, and consider the sum
$$ \EE[\tau_1] = \sum_{k=0}^{\infty} k \PP[\tau_1 = k] = \sum_{n=0}^{\infty} (2n+1) \PP[ \tau_1 = 2n+1] = \sum_{n=0}^{\infty} p^{n+1} q^{n} \frac{2n+1}{n+1} \binom{2n}{n}.$$
  We have already seen that (by Stirling's formula) we have $\binom{2n}{n} \sim \frac{2^{2n}}{\sqrt{\pi n}}$, so the question reduces to the one about convergence of the following, simpler,  series:
  $$ \sum_{n=1}^{\infty} \oo{\sqrt{n}} p^n q^{n} 2^{2n} = \sum_{n=1}^{\infty} \oo{\sqrt{n}} (4pq)^n.$$
  When $p=\tot$, we have $4pq=1$, and the series above becomes a $p$-series with $p=\tot$. Hence, it diverges. On the other hand, when $p>\tot$, $4pq<1$, the terms of the series are dominated by the terms of the convergent geometric series $\sum_{n=1}^{\infty} (4pq)^n$. Therefore, it, itself, must converge. All in all:
  $$ \EE[\tau_1] = \begin{cases} \infty, & p\leq \tot, \\ <\infty, & p > \tot. \end{cases}. $$
<part> 3. </part>

Let $a_j = \EE^{j}[\tau_1]$, where $\EE^{j}$ means that 
the random walk starts from the level $j$, i.e., $X_0=j$, instead of the usual $X_0=0$. Think about why it is plausible that the 
following relations hold for the sequence $a_n$:
$$a_1 = 0,\text{ and } a_j = 1 + p a_{j+1} + q a_{j-1}.$$ 
We guess that $a_j$ has the form $a_j = c(1-j)$, for $j<1$ (why?) and plug that guess into the above equation to get:
$$ c(1-j) = 1 + p c (-j) + q c (2-j) = 1 - c - 2 c q + c(1-j).$$
It follows that $c = \tfrac{1}{1-2q} = \tfrac{1}{p-q}$. Thus, if you believe the heuristic, we have
$$ \EE[ \tau_1 ] = \begin{cases} \frac{1}{p-q}, & p>\tot, \\ + \infty, & p\leq \tot. \end{cases}$$
(Note: If you have never seen it before, the approach we took here seems very unusual. Indeed, in order to find the value of $a_0$ we decided to compute values for the elements *of the whole sequence* $a_n$. This kind of 
thinking will appear many times later in the chapters on Markov Chains.)

</div>

## Stopping times

A **random time** is simply a random variable which takes values in the set $\N_0$ - it is random, and 
it can be interpreted as a point in time. Not all random times are created equal, though: here are three
examples based on a simple symmetric random walk $X$:

1. $\tau = 3$. This is the simplest random time - it always takes the value $3$, no matter what. It is random 
only in the formal sense of the word (just as the constant random vairbale $X=3$ *is* a random variable, but not a very interesting one). Constant random times, like $\tau=3$, are called **deterministic times**.

2. $\tau=\tau_1$ where $\tau_1$ is the first time $X$ hits the level $1$. It is no longer constant - it clearly depends on the underlying trajectory of the random walk: sometimes $\tau_1=1$; other times it can be very large. 

3. $\tau=\tau_{\max}$ where $\tau_{\max}$ is the first time $X$ takes its maximal value in the interval $\set{0,1,\dots, 100}$. The random time $\tau_{\max}$ is clearly non-constant, but it differs from $\tau=3$ or $\tau=\tau_1$ in a significant way.

Indeed, the first two examples have the following property:

> Given a time $n$, you can tell whether $\tau=n$ or not using only the information you have gathered by  time $n$.

The third one does *not*. Random times with this property are called **stopping times**. Here is a more precise, mathematical, definition. You should note that we allow our stopping times to take the value $+\infty$. The usual interpretation is that whatever the stopping time is modeling never happens. 


**Definition.** A random variable $\tau$ taking
values in $\N_0\cup\set{+\infty} = \{0,1,2,\dots, +\infty\}$ is said to be a **stopping time** with respect to the process
$\seqz{X}$ if for each $n\in\N_0$ there exists a function
$G^n:\R^{n+1}\to \set{0,1}$ such that
$$\inds{\tau=n}=G^n(X_0,X_1,\dots, X_n), \text{ for all } n\in\N_0.$$


The functions $G^n$ are called the **decision functions**, and should be thought of as a black
box which takes the values of the process $\seqz{X}$ observed up to the
present point and outputs either $0$ or $1$. The value $0$ means *keep
going* and $1$ means *stop*. The whole point is that the decision has to be
based only on the available observations and not on the future ones.

Alternatively, you can think of a stopping time as an R function whose input is
a vector which represents a trajectory $\omega$ of a random walk (or any other
process) and the output is a nonnegative integer. This function needs to be such
that if it "decides" to output the value $k$, it had to have based its decision
only on the first $k$ components of $\omega$. This means that if the output
corresponding to the input trajectory $\omega$ is $k$, and $\omega'$ is
another trajectory whose first components match those of $\omega$, then the
output corresponding to $\omega$' must also be $k$.

Now that we know how to spot stopping times, let's list some examples:

1.  The simplest examples of stopping times are (non-random)
    **deterministic times**. Just set $\tau=5$ (or $\tau=723$ or $\tau=n_0$ for any
    $n_0\in\N_0\cup\set{+\infty}$), no matter what the state of the
    world $\omega\in\Omega$ is. The family of decision rules is easy to
    construct:
    $$G^n(x_0,x_1,\dots, x_n)=\begin{cases} 1,& n=n_0, \\ 0, & n\not=
      n_0.\end{cases}.$$ Decision functions $G^n$ do not depend on the
    values of $X_0,X_1,\dots, X_n$ *at all*. A gambler who stops gambling 
    after 20 games, no
    matter what the winnings or losses are uses such a rule.

2.  Probably the most well-known examples of stopping times are **(first)
    hitting times**. They can be defined for general stochastic
    processes, but we will stick to simple random walks for the purposes
    of this example. So, let $X_n=\sum_{k=0}^n \delta_k$ be a simple random
    walk, and let $\tau_l$ be the first time $X$ hits the level $l\in\N$.
    More precisely, we use the following slightly non-intuitive but
    mathematically correct definition
    $$\tau_l=\min\sets{n\in\N_0}{X_n=l}.$$ The set $\sets{n\in\N_0}{X_n=l}$
    is the collection of all time-points at which $X$ visits the level
    $l$. The earliest one - the minimum of that set - is the first
    hitting time of $l$. In states of the world $\omega\in\Omega$ in
    which the level $l$ just never gets reached, i.e., when
    $\sets{n\in\N_0}{X_n=l}$ is an empty set, we set
    $\tau_l(\omega)=+\infty$. 
    
    In order to show that $\tau_l$ is indeed a
    stopping time, we need to construct the decision functions $G^n$,
    $n\in\N_0$. Let us start with $n=0$. We would have $\tau_l=0$ only in the
    (impossible) case $X_0=l$, so we always have $G^0(X_0)=0$. How about
    $n\in\N$. For the value of $\tau_l$ to be equal to exactly $n$, two
    things must happen:

    1.  $X_n=l$ (the level $l$ must actually be hit at time $n$), and

    2.  $X_{n-1}\not = l$, $X_{n-2}\not= l$, ..., $X_{1}\not=l$,
        $X_0\not=l$ (the level $l$ has not been hit before).

    Therefore, $$G^n(x_0,x_1,\dots, x_n)=\begin{cases}
    1,& x_0\not=l, x_1\not= l, \dots, x_{n-1}\not=l, x_n=l\\
    0,&\text{otherwise}.
    \end{cases}$$ The hitting time $\tau_2$ of the level $l=2$ for a
    particular trajectory of a symmetric simple random walk is depicted
    below: 
    
<img src="_main_files/figure-html/unnamed-chunk-172-1.png" width="80%" style="display: block; margin: auto;" />
    
3.  How about something that is *not* a stopping time? Let $T\in\N$ be
    an arbitrary time-horizon and let $\tau_{\max}$ be the last time during
    $\ft{0}{T}$ that the random walk visits its maximum during
    $\ft{0}{T}$:
    
    <img src="_main_files/figure-html/unnamed-chunk-173-1.png" width="80%" style="display: block; margin: auto;" />
    
    If you bought a share of a stock
    at time $n=0$, had to sell it some time before or at $T$ and had the
    ability to predict the future, this is one of the points you would
    choose to sell it at. Of course, it is impossible in general to
    decide whether $\tau_{\max}=n$, for some $n\in\ft{0}{T-1}$ without the
    knowledge of the values of the random walk after $n$. 

    More
    precisely, let us sketch the proof of the fact that $\tau_{\max}$ is not a
    stopping time. Suppose, to the contrary, that it is, and let $G^n$
    be the associated family of decision functions. Consider the following two
    trajectories: $(0,1,2,3,\dots,
      T-1,T)$ and $(0,1,2,3,\dots, T-1,T-2)$. They differ only in the
    direction of the last step. They also differ in the fact that
    $\tau_{\max}=T$ for the first one and $\tau_{\max}=T-1$ for the second one. On the
    other hand, by the definition of the decision functions, we have
    $$\inds{\tau_{\max}=T-1}=G^{T-1}(X_0,\dots, X_{T-1}).$$ The right-hand side
    is equal for both trajectories, while the left-hand side equals to
    $0$ for the first one and $1$ for the second one. A contradiction.

## Wald's identity and Gambler's ruin


One of the superpowers of stopping times is that they often behave just like deterministic times. The best way to understand this statement is in the context of the beautiful *martingale theory*. Unfortunately, learning about martingales would take an entire semester, so we have to settle for an illustrative example, namely, Wald's identity.  

Let $\seq{\xi}$ be a sequence of independent and identically distributed random variables. The example you 
should keep in mind is $\xi_n = \delta_n$, where $\delta_n$ are coin tosses in the definition of a random walk. We set $X_n = \sum_{k=1}^n \xi_k$ and note that it is easy to compute $\EE[X_n]$:
$$ \EE[ X_n ] = \EE[ \xi_1+\dots + \xi_n] = \EE[\xi_1] + \dots + \EE[\xi_n] = n \mu, \text{ where } \mu = \EE[\xi_1]=\EE[\xi_2]=\dots$$
provided $\EE[\xi_1]$ exists. The expected value $\mu$ is the same for all $\xi_1,\xi_2,\dots$ because they all have the same distribution.  In words, the equality above tells us that the expected value of $X$ moves with *speed* $\mu$. Wald's identity tells us that the same thing is true when the deterministic time $n$ is replaced by a stopping time. To understand its statement below, we must first introduce a bit more notation. Let $\seqz{X}$ be a 
stochastic process, and let $\tau$ be a random time which never takes the value $+\infty$. Remember that $X_0, X_1, \dots$ are random variables, i.e., functions of the elementary outcome $\omega\in\Omega$. The same is true for $\tau$. Therefore, in order to define the *random variable* $X_{\tau}$ we need to specify what its value is for any given $\omega$:
$$ X_{\tau} (\omega) = X_{n}(\omega) \text{ where } n=\tau(\omega).$$
This is exactly what you would expect; the elementary outcome $\omega$ not only tells us which trajectory of the process to consider, but also the time at which to do it. Note that when $\tau=n$ is a deterministic time, $X_{\tau}$ is exactly $X_n$. 

**Theorem.** (Wald's identity) Let $\seq{\xi}$ be a sequence of independent and identically distributed random variables, and let $X_n = \sum_{k=1}^n \xi_k$ be the associated random walk. If $\EE[ \abs{\xi_n}]<\infty$ and $\tau$ is a stopping time for $\seqz{X}$ such that $\EE[\tau]<\infty$, then 
$$ \EE[X_{\tau}] = \EE[\tau] \mu \text{ where } \mu = \EE[\xi_1] = \EE[\xi_2] = \dots $$

 
Before we prove this theorem, here is a handy identity:

<div class="problem">
(The "tail formula" for the expectation) Let $\tau$ be an
$\N_0$-valued random variable. Show that 
$$\EE[\tau]=\sum_{k=1}^{\infty} \PP[\tau \geq k].$$
</div>
<div class="solution">
Clearly, $\PP[\tau\geq k] = \PP[ \tau=k] + \PP[\tau=k+1]+\dots$. 
Therefore, 

$$ 
\begin{array}{cccccccc}
\sum_{k=1}^{\infty} \PP[\tau \geq k] &=& \PP[ \tau=1]   &+& \PP[\tau=2] &+& \PP[\tau=3] &+& \dots  \\
&& &+& \PP[\tau=2] &+& \PP[\tau=3] &+& \dots \\
&& &&  &+& \PP[\tau=3] &+& \dots \\
&& && && &+& \dots
\end{array}
$$
If you look at the "columns", you will realize that the expression $\PP[\tau=1]$ appears in this sum once, $\PP[\tau=2]$ twice, $\PP[\tau=3]$ three times, etc.
Hence
$$\sum_{k=1}^{\infty} \PP[ \tau\geq k] = \sum_{n=1}^{\infty} n \PP[\tau=n] = \EE[\tau].$$
</div>
<div class="problemec">
  Prove Wald's identity.
</div>
<div class="solution">
Here is another representation of the random variable $X_{\tau}$:
$$X_{\tau} = \sum_{k=1}^{\tau} \xi_k=\sum_{k=1}^{\infty} \xi_k \inds{k\leq \tau}.$$ The idea
behind it is simple: add all the values of $\xi_k$ for $k\leq
\tau$ and keep adding zeros (since $\xi_k \inds{k\leq \tau}=0$ for $k>\tau$)
after that. Taking expectation of both sides and switching $\EE$ and
$\sum$ (this can be justified, but the argument is technical and we omit
it here) yields: $$
 \EE[\sum_{k=1}^{\tau} \xi_k]=\sum_{k=1}^{\infty} \EE[ \inds{k\leq \tau}\xi_k].
$$ Let us examine the term $\EE[\xi_k\inds{k\leq \tau}]$ in
some detail. We first note that
$$\inds{k\leq \tau}=1-\inds{k>\tau}=1-\inds{k-1\geq
  \tau}=1-\sum_{j=0}^{k-1}\inds{\tau=j},$$
  so that
  $$
  \EE[\xi_k \inds{k\leq \tau}]=\EE[\xi_k]-\sum_{j=0}^{k-1}\EE[ \xi_k
\inds{\tau=j} ].$$ By the assumption that $\tau$ is a stopping time, the
indicator $\inds{\tau=j}$ can be represented as
$\inds{\tau=j}=G^j(X_0,\dots, X_j)$, and, because each $X_i$ is just a sum
of the increments $\xi_1, \dots, \xi_i$, we can actually write $\inds{\tau=j}$ as a function of
$\xi_1,\dots, \xi_j$ only: $\inds{\tau=j}=H^j(\xi_1,\dots, \xi_j).$ By
the independence of $(\xi_1,\dots, \xi_j)$ from $\xi_k$ (because $j<k$)
we have 
\begin{align}
    \EE[\xi_k \inds{\tau=j}]&=\EE[ \xi_k H^j(\xi_1,\dots, \xi_j)]=
   \EE[\xi_k] \EE[ H^j(\xi_1,\dots, \xi_j)]=\EE[\xi_k] \EE[\inds{\tau=j}]=
   \EE[\xi_k]\PP[T=j].
\end{align}
 Therefore, 
 \begin{align}
    \EE[\xi_k \inds{k\leq \tau}]&=\EE[\xi_k]-\sum_{j=0}^{k-1} \EE[\xi_k]
   \PP[\tau=j]=\EE[\xi_k] \PP[\tau\geq k] =\mu \PP[\tau\geq k],
\end{align}
 where the last equality follows from the fact that all $\xi_k$ have the same expectation, namely $\mu$.


 
Putting it all together, we get
\begin{align}
    \EE[X_{\tau}]&=\EE[\sum_{k=1}^{\tau} \xi_k]=\sum_{k=1}^{\infty}
   \mu \PP[\tau\geq k]=\mu \sum_{k=1}^{\infty} \PP[\tau\geq
   k]= \EE[\tau] \mu,
\end{align}
where we use the  "tail formula" to get  the last equality.
</div>
<div class="problem">
  Show, by giving an example, that Wald's identity does not necessarily hold if $\tau$ is not a stopping time.
</div>
<div class="solution">
  Let $X$ be a simple symmetric random walk, and let $\tau$ be a random time constructed like this:
  \begin{align}
    \tau = \begin{cases} 1, & X_1=1 \\ 0,& X_1=-1. \end{cases}
  \end{align}
  Then, 
  \begin{align}
    X_{\tau} = \begin{cases} X_1, & X_1=1 \\ X_0, & X_1=-1, \end{cases} = 
    \begin{cases} 1, & X_1=1 \\ 0,& X_1=-1. \end{cases}
  \end{align}
  and, therefore, $\EE[ X_{\tau}] = 1 \cdot 1/2 + 0 \cdot 1/2 = 1/2$. On the other hand $\mu=\EE[\xi_1]=0$ and $\EE[\tau] = 1/2$, so $1/2 = \EE[X_{\tau}] \ne \EE[\tau] \mu = 0$. 
  
  It is clear that $\tau$ cannot be a stopping time, since Wald's identity would hold for it if it were.
  To see that it is not more directly, consider the event when $\tau=0$. 
  Its occurrence depends on whether $X_1=1$ or not, which is not known at time $0$.
</div>

A famous use of Wald's identity is in the solution of the following classical problem:

<div class="problem">
A gambler starts with $\$x$ dollars and repeatedly plays a game in
which she wins a dollar with probability $\tot$ and loses a dollar with
probability $\tot$. She decides to stop when one of the following two
things happens:

1.  she goes bankrupt, i.e., her wealth hits $0$, or

2.  she makes enough money, i.e., her wealth reaches some predetermined level $a>x$.

The "Gambler's ruin"  problem (dating at least to 1600s)  asks
the following question: what is the probability that the gambler will
make $a$ dollars before she goes bankrupt?
</div>

<div class="solution">
Let the gambler's "wealth" $\seqz{W}$ be 
  modeled by a simple random walk starting
from $x$, whose increments $\xi_k=\delta_k$ are coin-tosses. Then
$W_n=x+X_n$, where $X_n = \sum_{k=1}^n \xi_k$ is a SSRW. Let $\tau$ be the
time the gambler stops. We can represent $\tau$ in two different (but
equivalent) ways. On the one hand, we can think of $T$ as the smaller of
the two hitting times $\tau_{-x}$ and $\tau_{a-x}$ of the levels $-x$ and
$a-x$ for the random walk $\seqz{X}$ (remember that $W_n=x+X_n$, so
these two correspond to the hitting times for the process $\seqz{W}$ of
the levels $0$ and $a$). On the other hand, we can think of $\tau$ as the
first hitting time of the two-element *set* $\set{-x,a-x}$ for the
process $\seqz{X}$. In either case, it is quite clear that $\tau$ is a
stopping time (can you write down the decision functions?). 

When we
talked about the maximum of the simple symmetric random walk, we proved
that it hits any value if given enough time. Therefore, the probability
that the gambler's wealth will remain strictly between $0$ and $a$
forever is zero. So, $\PP[T<\infty]=1$.

\medskip

What can we say about the random variable $X_{\tau}$ - the gambler's wealth
(minus $x$) at the *random* time $\tau$? Clearly, it is either equal to
$-x$ or to $a-x$, and the probabilities $p_0$ and $p_a$ with which it
takes these values are exactly what we are after in this problem. We
know that, since there are no other values $X_{\tau}$ can take, we must have
$p_0+p_a=1$. Wald's identity gives us another equation for
$p_0$ and $p_a$: 
$$\EE[X_{\tau}]=\EE[\xi_1] \EE[\tau]=0\cdot \EE[\tau]=0 \text{ so that }
0 = \EE[X_{\tau}]=p_0 (-x)+p_a (a-x).$$ 

We now have a system of two linear equations with two unknowns, and solving it yields
$$p_0= \frac{a-x}{a}, \ p_a=\frac{x}{a}.$$ 
It is remarkable that the two probabilities are proportional to the amounts of
money the gambler needs to make (lose) in the two outcomes. The
situation is different when $p\not=\tot$.
</div>

In order to be able to use Wald's identity, we need to check its conditions. We have already seen that 
$\tau$ needs to be a stopping time, and not just any old random time. There are also two conditions about the expected values of $\tau$ and of $\xi_1$. If you read the above solution carefully, you will realize that we never checked whether $\EE[\tau]<\infty$. We should have, but we did not because we still don't have the mathematical tools to do it. We will see later that, indeed, $\EE[\tau]<\infty$ for this particular stopping time. In general, the condition that $\EE[\tau]<\infty$ is important, as the following simple example shows:

<div class="problem">
  Let $\seqz{X}$ be a simple symmetric random walk, and let $\tau_1$ be the first hitting time of the level $1$.
  Use Wald's identity to show that $\EE[\tau]=+\infty$.
</div>
<div class="solution">
  Suppose, to the contrary, that $\EE[\tau]<\infty$. Since $\EE[\delta_1]<\infty$ and $\tau_1$ is a stopping time, Wald's identity applies:
  $$ \EE[X_{\tau_1}] = \EE[ \delta_1] \cdot \EE[\tau_1].$$
  The right hand side is then equal to $0$ because $\EE[\delta_1]=0$. On the other hand, $X_{\tau_1}=1$: the value of $X_n$ when it first hits the level $1$ is, of course, $1$. This leads to a contradiction $1=\EE[X_{\tau_1}] = \EE[\delta_1] \EE[\tau_1] = 0$. Therefore, our initial assumption that $\EE[\tau_1]<\infty$ was wrong!
</div>

## Additional problems for Chapter 4

<!--
  3-max-problems
  ------------------------------------------------
-->
<div class="problem">

1. Let $\{X_n\}_{0\leq n \leq 10}$ be a simple symmetric random walk with
time horizon $T=10$. What is the probability it will never reach the
level $5$?

2. A fair coin is tossed repeatedly, with the first toss resulting in $H$
(i.e., heads). After that, each time the outcome of the coin matches the
previous outcome, the player gets a dollar. If the two do not match, the
player has to pay a dollar. The player stops playing once she "earns"
$10$ dollars. What is the probability that she will need at least 20
tosses (including the first one) to achieve that?

3. A fair coin is tossed repeatedly and the record of the outcomes is kept.
Tossing stops the moment the total number of heads obtained so far
exceeds the total number of tails by 3. For example, a possible sequence
of tosses could look like *HHTTTHHTHHTHH*. What is the probability that
the length of such a sequence is at most 10?
</div>
<div class="solution">

<part> 1. </part>
This is the same as asking that its maximum $M_{10}$ up to time $T=10$
be $\leq 4$. This can be further computed using the formula from class:
$$\begin{aligned}
\PP[ M_{10}\leq 4 ] &= \PP[ M_{10}=0] + \PP[ M_{10}=1] + \PP[ M_{10} = 2]
+ \PP[M_{10} = 3] + \PP[ M_{10} = 4] \\ & = 
  (\PP[ X_{10} = 0] + \PP[ X_{10} = 1] ) +
(\PP[ X_{10} = 1] + \PP[ X_{10} = 2] ) \\ & +
  (\PP[ X_{10} = 2] + \PP[ X_{10} = 3] ) +
(\PP[ X_{10} = 3] + \PP[ X_{10} = 4] )\\ & +
  (\PP[ X_{10} = 4] + \PP[ X_{10} = 5] ) \\ &=
  2 (\PP[ X_{10}=4]  + \PP[X_{10} = 2]) + \PP[X_{10} =0] \\&=
  2^{-10}( 2 \binom{10}{7} + 2 \binom{10}{6} + \binom{10}{5})\end{aligned}$$

<part> 2. </part>

Let the outcomes of the coin tosses be denoted by $\gamma_1 = H$,
$\gamma_2, \gamma_3, \dots$. We define the random variables
$\delta_1,\delta_2,\dots$ as follows: $\delta_1 = 1$ if $\gamma_2 = T$
and $\delta_1 = -1$, otherwise. Similarly, $\delta_2 = 1$ if $\gamma_3 =
  \gamma_2$ and $-1$ otherwise. It is clear that
$\delta_1,\delta_2,\dots$ is an iid sequence of coin tosses (just like
in the definition of) of a simple symmetric random walk. After $n$
tosses ( the first one), our gambler has
$X_n = \delta_1+\delta_2 + \dots + \delta_n$ dollars. She will need at
least 19 tosses (excluding the first one) to reach $10$ dollars if and
only if the value of the running maximum process at time $n=18$ is at
most $9$. Using the formula from the formula sheet, this evaluates to
$$\begin{aligned}
    \PP[ M_{18}\leq 9] &= \sum_{k=0}^{9} \PP[ M_{18} = k] = 
    \sum_{k=0}^{9} (\PP[X_{18}=k] + \PP[ X_{18} = k+1])\\ 
                       & = \PP[ X_{18} =0 ]
      + 2\, \PP[X_{18} = 2] + 2\, \PP[X_{18} = 4] + \dots \\ & \qquad   \dots + 2\, \PP[ X_{18} = 8] +
    \PP[ X_{18} = 10] \\
                       &= 2^{-18}\left( \binom{18}{9} + 2 \binom{18}{10} +
                       2\binom{18}{11} + 2 \binom{18}{12} + 2
                       \binom{18}{13} + \binom{18}{14}\right)
  \end{aligned}$$ Btw, you could have gotten a seemingly different
answer. Since it is impossible to reach $10$ in exactly $19$ steps (the
parity is wrong), the required probability is also equal to
\begin{align}
  \PP[ M_{19}\leq 9] &= \sum_{k=0}^9 \Big( \PP[ X_{19} = k] +  \PP[ X_{19} =
    k+1] \Big)
    = 2^{-19} \times 2 \times \sum_{k=1}^9 \binom{19}{(19+k)/2}\\
    &=
    2^{-18} \times \left( \binom{19}{10} + \binom{19}{11} + \dots +
  \binom{19}{16} \right).
\end{align}
  
<part> 3. </part>

Let $X_n$, $n\in\N_0$ be the number of heads *minus* the number of tails
obtained so far. Then, $\seqz{X}$ is a simple symmetric random walk, and
we stop tossing the coin when $X$ hits $3$ for the first time. This will
happen during the first 10 tosses, if and only if $M_{10} \geq  3$,
where $M_n$ denotes the (running) maximum of $X$. According to the
reflection principle, $$\nonumber
    \begin{split}
  \PP[M_{10} \geq 3]&= \PP[ X_{10} \geq 3 ] + \PP[ X_{10} \geq 4]\\ &
 = 2(
 \PP[X_{10}= 4]
 +\PP[X_{10}= 6]
 +\PP[X_{10}= 8]
 +\PP[X_{10}= 10])\\
 &= 2^{-9} \left[
 \binom{10}{3}+\binom{10}{2}+\binom{10}{1}+\binom{10}{0}
 \right] =  {\frac{11}{32}}.
    \end{split}$$
</div>


<!--
  time_until_hit
  ------------------------------------------------
-->
<div class="problem">

The purpose of this problem is to understand how long we have to wait util a simple symmetric random walk hits the level $1$.  Theory presented so far guarantees that this will happen sooner or later, but it gives no indication of the length of the wait. As usual, we denote by $\tau_1$ the (random) first time the SSRW $\{X_n\}_{n\in\N_0}$ hits the level $1$. 

1. Write an R function that simulates a trajectory of a random walk, but only until the first time it hits level $1$. You don't have to record the trajectory itself - just keep tossing coins until the trajectory hits $1$ and return the number of steps needed. Your function needs to accept an argument, `T`,  such that your simulation stops if $1$ has not been reached in the first `T` steps.

2. Pick a large-ish value of the parameter `T` (say $100$) and `replicate` the simulation from 1. above sufficiently many times (say $10,000$). Draw a histogram of your results. 

3. Repeat the simulation for the following values of $T$: $500$, $1,000$, $10,000$, $50,000$, $100,000$, and compute the mean and the standard deviation of your simulations.  Display your results in two tables. Are these numbers underestimates or overestimates of $\EE[\tau_1]$ and $\Var[\tau_1]$? Explain why.  (Note: Decrease the number `nsim` of simulations to $1000$ or even $100$ if $10,000$ is taking too long.)

4. Repeat all of the above, but for the first time the **absolute value** of your random walk reaches level $5$. What is the most glaring difference between the two cases? What does that mean for the amount of time you are going to have to wait to hit $1$, vs. for the absolute value to hit $5$? More precisely, what do you think their means and standard deviations are? 
</div>
<div class="solution">

<part> 1. </part>


```r
simulate_tau = function(T) {
    X = 0
    for (n in 1:T) {
        X = X + sample(c(-1, 1), size = 1)
        if (X == 1) 
            break
    }
    return(n)
}
```

<part> 2. </part>



```r
nsim = 10000
T = 100
tau = replicate(nsim, simulate_tau(T))
hist(tau, probability = TRUE)
```

<img src="_main_files/figure-html/unnamed-chunk-311-1.png" width="672" style="display: block; margin: auto;" />

<part> 3. </part>


```r
T = c(500, 1000, 10000, 50000, 100000)
Mean = vector(length = 5)
StDev = vector(length = 5)

nsim = 1000
for (i in 1:5) {
    tau = replicate(nsim, simulate_tau(T[i]))
    Mean[i] = mean(tau)
    StDev[i] = sd(tau)
}
df = data.frame(T, Mean, StDev)
options(scipen = 50)  # no scientific (e) notation
print(df)
##        T    Mean      StDev
## 1    500  31.387   97.52087
## 2   1000  43.499  158.33426
## 3  10000 196.021 1156.39220
## 4  50000 264.321 2864.91406
## 5 100000 426.744 5077.33921
```


<part> 4. </part>


```r
simulate_tau_abs = function(T) {
    X = 0
    for (n in 1:T) {
        X = X + sample(c(-1, 1), size = 1)
        if (abs(X) == 5) 
            break
    }
    return(n)
}
```


```r
nsim = 10000
T = 100
tau_abs = replicate(nsim, simulate_tau_abs(T))
hist(tau_abs, probability = TRUE)
```

<img src="_main_files/figure-html/unnamed-chunk-314-1.png" width="672" style="display: block; margin: auto;" />


```r
T = c(500, 1000, 10000, 50000, 100000)
Mean = vector(length = 5)
StDev = vector(length = 5)

nsim = 10000
for (i in 1:5) {
    tau_abs = replicate(nsim, simulate_tau_abs(T[i]))
    Mean[i] = mean(tau_abs)
    StDev[i] = sd(tau_abs)
}
df = data.frame(T, Mean, StDev)
options(scipen = 50)  # no scientific (e) notation
print(df)
##        T    Mean    StDev
## 1    500 24.9444 20.01138
## 2   1000 25.1092 19.88474
## 3  10000 25.2926 20.09310
## 4  50000 24.9758 19.94961
## 5 100000 25.2972 20.35415
```

The most glaring difference between two tables is that the mean and st-dev estimates seem to grow with $T$ in the first, but not in the second case. It suggests that the random variable 
$\tau$ takes such large values that no "cap" $T$ can "contain them". More precisely, the random variable $\tau$ has **infinite expectation** (and also **infinite standard deviation**). Indeed, it its expectation were finite, the value in the "Mean" column would stabilize towards it. Since they don't, this expectation is infinite. Same for standard deviation. The moral of the story is that even though simple symmetric random walks hit every level eventually, you may have to wait a long time for that to happen. 

This does not happen for `tau_abs`. Indeed, it can be shown that both its expectation and standard deviation are finite. The time you are going wait until you hit either $-5$ or $5$ is much shorter "on average" than the time needed to hit $1$. 
</div>



<!-- 
  Luke_cookies
  -------------------------------
-->
<div class="problem">

Luke starts a random walk, where each step takes him to the left or to
the right, with the two alternatives being equally likely and
independent of the previous steps. $11$ steps to his right is a cookie
jar, and Luke gets to take a (single) cookie every time he reaches that
position. He performs exactly $15$ steps, and then stops.

1.  What is the probability that Luke will be exactly by the cookie jar
    when he stops?

2.  What is the probability that Luke stops with with exactly $3$
    cookies in his hand?

3.  What is the probability that Luke stops with at least one cookie in
    his hand?

4.  Suppose now that we place a bowl of broccoli soup one step to the
    right of the cookie jar. It smells so bad that, if reached, Luke
    will throw away all the cookies he is currently carrying (if any)
    and run away pinching his nose. What is the probability that Luke
    will finish his $15$-step walk without ever encountering the yucky
    bowl of broccoli soup and with at least one cookie in his hand?
</div>
<div class="solution">

Let the position at time $n$ be denoted by $X_n$, so that
$\{X_n\}_{0\leq n \leq 15}$ is a simple symmetric random walk with the
time horizon $T=15$.

1.  This is simply $\PP[ X_{15} = 11] = \binom{15}{2} 2^{-15} =
          \binom{15}{13} 2^{-15}$.

2.  The only way for Luke to return with $3$ cookies is to go straight
    to $11$, step away from it, return, step away from it and return
    again. There are exactly $4$ paths that do that. They all start with
    $11$ $+1$s (or \"up\"s or \"right\"s) and then continue in one of
    the following 4 ways
    $$(+1,-1,+1,-1), (+1,-1,-1,+1), (-1,+1,-1,+1) \eand
        (-1,+1,+1,-1).$$ Therefore, the probability is
    $4/2^{15} = 2^{-13}$.

3.  Luke will stop with at least one cookie in his hand, if and only if
    the maximal (i.e., right-most) position of his walk is $11$ or
    above. Therefore, the required probability is
    $\PP[ M_{15} \geq 11]$. Using the formula
    $\PP[ M_T=k] = \PP[X_T = k]
          + \PP[ X_T = k+1]$ we get $$\begin{aligned}
            \PP[ M_{15} \geq 11] 
            &= \PP[ M_{15} = 11] + \PP[ M_{15} = 12] +
            \dots + \PP[ M_{15}=15]\\ & = \PP[ X_{15}=11] + 2 \PP[ X_{15} = 13] + 2
            \PP[X_{15}=15] \\
                                      &= 2^{-15}\Big( \binom{15}{2} + 2
                                      \binom{15}{1} + 2\binom{15}{0}\Big).
         \end{aligned}$$

4.  Here, we want Luke to reach the position $11$ (to get a cookie), but
    not the position $12$ (where the bowl of broccoli soup is). This
    corresponds to the maximum being exactly $11$. By the formula
    $\PP[ M_T = k] =
           \PP[X_T=k] + \PP[X_T = k+1]$, we get
    $$\PP[ M_{15}=11] = \PP[X_{15}=11] = \binom{15}{2}2^{-15}.$$
</div>
 

<!--
  catalan
  ------------------------------------------------
-->
<div class="problemec">

Let $C_n = \frac{1}{n+1}\binom{2n}{n}$ denote the $n$-th Catalan number, as defined at the end of the discussion of the Balot problem above. 

1.  Use the reflection principle to show that $C_n$ is the number
    trajectories $(x_0,\dots, x_{2n})$ of a random
    walk with time horizon $T=2n$ such that $x_k
      \geq 0$, for all $k\in\set{0,1,\dots, 2n}$ and $x_{2n}=0$.

2.  Prove the *Segner's recurrence formula*
    $C_{n+1} = \sum_{i=0}^n C_{i} C_{n-i}$. .

3.  Show that $C_n$ is the number of ways the vertices of a regular
    $2n$-gon can be paired so that the line segments joining paired
    vertices do not intersect.
</div>
<!-- <div class="solution"> -->
<!-- ```{r child="problems/01_Random_Walks/catalan_sol.Rmd"} -->
<!-- ``` -->
<!-- </div> -->

<!--
  no_return_to_zero
  ------------------------------------------------
-->
<div class="problem">

Let $\seqz{X}$ be a simple symmetric random walk. Given $n\in\N$, what
is the probability that $X$ does not visit $0$ during the time interval
$\ft{1}{n}$.
</div>
<div class="solution">

Let us denote the required probability by $p_n$, i.e.,
$$p_n=\PP[ X_1\not= 0, X_2\not=0, \dots, X_n\not=0].$$ For $n=1$,
$p_1=1$, since $X_1$ is either $1$ or $-1$. For $n>1$, let $\delta_1$ be
the first increment $\delta_1=X_1-X_0=X_1$. If $\delta_1=-1$, we need to
compute that probability that a random walk of length $n-1$, starting at
$-1$, does not hit $0$. This probability is, in turn, the same as the
probability that a random walk of length $n-1$, starting from $0$, never
hits $1$. By the symmetry of the increments, the same reasoning works
for the case $\delta_1=1$. Therefore, 
\begin{align}
  p_n &=
  \PP[ X_1\leq 0, X_2\leq 0, \dots, X_{n-1}\leq 0]\, \PP[\delta_1=-1]\\ 
    & \quad+ 
  \PP[ X_1\geq 0, X_2\geq 0, \dots, X_{n-1}\leq 0]\, \PP[\delta_1=1]\\
    &=\tot \PP[ M_{n-1}=0] + \tot \PP[M_{n-1}=0] = \PP[ M_{n-1}=0], 
\end{align}
where $M_n=\max\set{X_0,\dots, X_n}$. Using the formula from the notes, 
this probability is given by $$p_n= 2^{-n+1} \binom{n-1}{ \lfloor n/2 \rfloor},$$
where $\lfloor x \rfloor$ denotes the largest integer $\leq x$. 
</div>


<!--
  hit_times_1
  ------------------------------------------------
-->
<div class="problem">

Let $\tau_{-1}$ be the hitting time of the level ${-1}$ for a simple biased
random walk $\seqz{X}$. Choose the correct answer(s) (they will depend on the value of the 
parameter $p$):

(a) $\PP[\tau_{-1}<\infty] < 1$
(b) $\EE[\tau_{-1}]<\infty$, 
(c) $\PP[\tau_{-1}<\infty]=1$ and $\EE[\tau_{-1}]=\infty$,
(d) $\PP[\tau_{-1}<\infty]<1$ and $\EE[\tau_{-1}]=\infty$, 
(e) none of the above.
</div>
<div class="solution">

Hitting the level $-1$ for a biased random walk with parameter $p$ is equivalent to hitting the level $1$ for a biased random walk with parameter $1-p$. The correct answers are:

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:center;"> p </th>
   <th style="text-align:left;"> answers </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> $<\frac{1}{2}$ </td>
   <td style="text-align:left;"> b. </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $=\frac{1}{2}$ </td>
   <td style="text-align:left;"> c. </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $>\frac{1}{2}$ </td>
   <td style="text-align:left;"> a., d. </td>
  </tr>
</tbody>
</table>

</div>

<!--
  min_stopping_times
  ------------------------------------------------
-->
<div class="problem">

Let $\tau$ and $\tilde{\tau}$ be two stopping times. Which of the following are necessarily stopping times, as well:

1. $\max(\tau,\widetilde{\tau})$
2. $\min(\tau, \widetilde{\tau})$
3. $\tau+\widetilde{\tau}$
4. $\tau-\widetilde{\tau}$ (assuming that $\tau \geq \widetilde{\tau}$)
</div>
<div class="solution">

<part> 1. </part>
Yes. Wait for both of them to happen and then stop.

<part> 2. </part>
Yes. Wait for one of them to happen and stop immediately.

<part> 3. </part>
Yes. Wait for the earlier one to happen, and write down the time when it happens (call it $n$). Then wait for the later one to happen, and wait additional $n$ units of time after that. Then stop. 

<part> 4. </part>
No. Let $\tau=\tau_2$ and $\widetilde{\tau} = \tau_1$ (the hitting times of levels $2$ and $1$). It may happen that $\tau_1=13$ and then $\tau_2=14$, but you don't know whether it will at time $\widetilde{\tau} - \tau = 1$.
</div>

<!--
  stopping_times_2
  ------------------------------------------------
-->
<div class="problem">

Either one of the following $4$ random times is *not* a stopping
time for a simple random walk $\seqz{X}$, or they all are. Choose the
one which is not in the first case, or choose e. if you think they all
are. 

 (a) the first hitting time of level $4$,
 (b) the first time $n \geq 1$ such that $X_{n}-X_{n-1}\not=X_{1}$, 
 (c) the first time the walk hits the level $2$ or the first time the walk sinks below
$-5$, whatever happens *first*,
 (d) the second time the walk hits the level $5$ or the third time the walk hits the level $-2$,
whatever happens *last* 
 (e) none of the above.
</div>
<div class="solution">

The correct answer is e. The first, second, third, or ... hitting times of a level are
stopping times, and so are their minima or maxima. Note that for two
stopping times $\tau_1$ and $\tau_2$, the one that happens *first* is
$\min(\tau_1,\tau_2)$ and the one that happens *last* is $\max(\tau_1,\tau_2)$.
</div>

<!--
  stopping_times_3
  ------------------------------------------------
-->
<div class="problem">

At most one of the following $4$ random times *is* a stopping time
for a simple random walk $\seqz{X}$. Either choose the one which you
think is a stopping time, or choose e. if you think there are no
stopping times among them. 

(a) the first time $n$ such that $X_{n+1} > X_n$,
(b) the first time $n\geq 1$ such that $X_{n}-X_{n-1}=X_{3}$, 
(c) the first time $n\geq 0$ such that $X_n$ gets (strictly) above its average
$\oo{101}\sum_{k=0}^{100} X_k$, 
(d) $\tot(\tau_1 + \tau_3)$, where $\tau_a$ denotes the first hitting time of the level $a$.
(e) none of the above are stopping times.
</div>
<div class="solution">

The correct answer is e. For each of the random times in a.-d. you need
to know something about the future to tell whether they happened when
they happened. For example, for $c.$, you have no way of knowing (in
general) whether or not $X_{2} - X_1$ equals $X_3$ at time $2$.
</div>



⬇︎ In case you were wondering, the text below belongs to footnotes from somewhere high above.⬇︎



<!--chapter:end:04-more-random-walks.Rmd-->



\usepackage{mydefs_long}
\newcommand{\PP}{{\mathbb{P}}}
\newcommand{\N}{{\mathbb{N}}}
\newcommand{\bZ}{{\mathbb{Z}}}
\newcommand{\R}{{\mathbb{R}}}

\newcommand{\sS}{{\mathcal{S}}}
\newcommand{\EE}{{\mathbb{E}}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}
\newcommand{\corr}{\operatorname{corr}}
\newcommand{\Id}{\operatorname{Id}}

\newcommand{\ld}{\lambda}
\newcommand{\eand}{\text{ and }}
\newcommand{\efor}{\text{ for }}
\newcommand{\eforall}{\text{ forall }}

\newcommand{\tot}{\tfrac{1}{2}}
\newcommand{\seqz}[1]{\{#1_n\}_{n\in \N_0}}
\newcommand{\abs}[1]{|#1|}
\newcommand{\set}[1]{\{#1\}}
\newcommand{\tf}[2]{\frac{#1}{#2}}
\newcommand{\ot}{\frac{1}{2}}
\newcommand{\oo}[1]{\frac{1}{#1}}
\newcommand{\eps}{\varepsilon}
\newcommand{\inds}[1]{\mathbf{1}_{\{#1\}}}
\newcommand{\sets}[2]{ \{ #1\, : \, #2\}}
\newcommand{\ft}[2]{#1,\dots, #2}
\newcommand{\seq}[1]{\{#1_n\}_{n\in\N}}
\newcommand{\ewhere}{\text{ where }}

\renewcommand{\Pr}{{\mathbf P}}
\newcommand{\upn}[2]{#1^{(#2)}}
\newcommand{\Prup}[1]{\upn{\Pr}{#1}}
\newcommand{\Prz}{\Prup{0}}
\newcommand{\Pro}{\Prup{1}}
\newcommand{\Prn}{\Prup{n}}
\newcommand{\aaa}[1]{{a}^{(#1)}}
\renewcommand{\aa}[1]{{a}^{(#1)}}
\newcommand{\aaz}{\aaa{0}}
\newcommand{\az}{\aa{0}}
\renewcommand{\SS}{\sS}
\newcommand{\pnp}[1]{p^{(#1)}}
\newcommand{\pn}{\pnp{n}}
\newcommand{\tpnp}[1]{\tilde{p}^{(#1)}}
\newcommand{\tpn}{\tpnp{n}}
\newcommand{\fnf}[1]{f^{(#1)}}
\newcommand{\fn}{\fnf{n}}
\newcommand{\tofro}{\leftrightarrow}
\newcommand{\Vn}{V^{(n)}}

\newcommand{\mat}[1]{\begin{bmatrix}#1\end{bmatrix}}
          

# Markov Chains
<div style="counter-reset: thechapter 5;"> </div>


## The Markov property

Simply put, a stochastic process has the **Markov property** if probabilities governing its
future evolution depend only on its current position, and not on how it
got there. Here is a more precise, mathematical, definition. It will be
assumed throughout this course that any stochastic process $\seqz{X}$
takes values in a countable set $S$ called the **state space**. $S$ will always be either
finite, or countable, and a generic element of $S$ will be denoted by
$i$ or $j$.

A stochastic process $\seqz{X}$ taking values in a countable state space
$S$ is called a **Markov chain** if
\begin{equation}
 \PP[ X_{n+1}=j|X_n=i, X_{n-1}=i_{n-1},\dots, X_1=i_1, X_0=i_0]=
 \PP[
X_{n+1}=j|X_n=i],
(\#eq:markov)
\end{equation}
for all times $n\in\N_0$, all states
$i,j,i_0, i_1, \dots, i_{n-1} \in S$, whenever the two conditional
probabilities are well-defined, i.e., when
\begin{equation}
\PP[ X_n=i, \dots, X_1=i_1, X_0=i_0]>0.
(\#eq:markov-well-defined)
\end{equation}


The Markov property is typically checked in the following way: one
computes the left-hand side of \@ref(eq:markov)
and shows that its value does not
depend on $i_{n-1},i_{n-2}, \dots, i_1, i_0$ (why is that enough?). The
condition \@ref(eq:markov-well-defined)
will  be assumed (without explicit mention) every time we write a conditional
expression like to one in \@ref(eq:markov).

All chains in this course will be 
**homogeneous**, i.e., the conditional
probabilities $\PP[X_{n+1}=j|X_{n}=i]$ will not depend on the current
time $n\in\N_0$, i.e., $\PP[X_{n+1}=j|X_{n}=i]=\PP[X_{m+1}=j|X_{m}=i]$,
for $m,n\in\N_0$.


Markov chains are (relatively) easy to work with because the Markov
property allows us to compute all the probabilities, expectations,
etc. we might be interested in by using only two ingredients.

1.  The **initial distribution**: $\aaz=\sets{\az_i}{i\in S}$,
    $\az_i=\PP[X_0=i]$ - the initial probability distribution of the
    process, and

2.  **Transition probabilities**: $p_{ij}=\PP[X_{n+1}=j|X_n=i]$ - the
    mechanism that the process uses to jump around.

Indeed, if you know $\az_i$ and $p_{ij}$ for all $i,j\in S$ and want to compute
a joint distribution $\PP[X_n=i_n, X_{n-1}=i_{n-1}, \dots,
X_0=i_0]$, you can use the definition of conditional probability
and the Markov property several times (the *multiplication theorem* from
your elementary probability course) as follows:
\begin{align}
    \PP[X_n=i_n, \dots, X_0=i_0] 
       &= \PP[X_n=i_n| X_{n-1}=i_{n-1}, \dots,X_0=i_0] \cdot \PP[X_{n-1}=i_{n-1},
     \dots,X_0=i_0] \\ & 
       = \PP[X_n=i_n| X_{n-1}=i_{n-1}] \cdot \PP[X_{n-1}=i_{n-1}, \dots,X_0=i_0]\\
       &= p_{i_{n-1} i_{n}} \PP[X_{n-1}=i_{n-1}, \dots,X_0=i_0]
\end{align}
   If we repeat the same procedure $n-2$ more times (and flip the order of factors), we get
\begin{align}
\PP[X_n=i_n, \dots, X _0=i_0] &= \az_{i_0} \cdot p_{i_0 i_1} \cdot p_{i_1 i_2}\cdot  \ldots \cdot p_{i_{n-1} i_{n}}
\end{align}
Think of it this way: the probability of the process taking the trajectory $(i_0, i_1, \dots, i_n)$ is:

1. the probability of starting at $i_0$ (which is $\az_{i_0}$), 
2. multiplied by the probability of transitioning from $i_0$ to $i_1$ (which is $p_{i_0 i_1}$), 
3. multiplied by the probability of transitioning from $i_1$ to $i_2$ (which is $p_{i_1 i_2}$), 
4. etc.

When $S$ is finite, there is no loss of generality in
assuming that $S=\set{1,2,\dots, n}$, and then we usually organize the
entries of $\az$ into a *row vector* $$\aaz=(\az_1,\az_2,\dots, \az_n),$$
and the transition probabilities $p_{ij}$ into a *square matrix* $\Pr$,
where $$\Pr =\begin{bmatrix}
  p_{11} & p_{12} & \dots & p_{1n} \\
  p_{21} & p_{22} & \dots & p_{2n} \\
  \vdots  & \vdots  & \ddots & \vdots \\
  p_{n1} & p_{n2} & \dots & p_{nn} \\
\end{bmatrix}$$ In the general case ($S$ possibly infinite), one can
still use the vector and matrix notation as before, but it becomes quite
clumsy. For example, if $S=\bZ$, then $\Pr$ is an
infinite matrix $$\Pr=\begin{bmatrix}
  \ddots & \vdots & \vdots & \vdots &   \\
  \dots & p_{-1\, -1} & p_{-1\, 0} & p_{-1\, 1} & \dots \\
  \dots & p_{0\, -1} & p_{0\, 0} & p_{0\, 1} & \dots \\
  \dots & p_{1\, -1} & p_{1\, 0} & p_{1\, 1} & \dots \\
    & \vdots & \vdots & \vdots & \ddots \\
\end{bmatrix}$$

## First Examples

Here are some examples of Markov chains - you will see many more in problems and
later chapters. Markov chains with a small number of states are often depicted
as *weighted directed graphs*, whose nodes are the chain's states, and the
weight of the directed edge between $i$ and $j$ is $p_{ij}$. Such graphs are
called *transition graphs* and are an excellent way to visualize a number of
important properties of the chain. A transition graph is included for most of
the examples below. Edges are color-coded according to the probability assigned
to them. Black is always $1$, while other colors are uniquely assigned to
different probabilities (edges carrying the same probability get the same
color). 


### Random walks

Let $\seqz{X}$ be a simple (possibly biased) random walk. Let us show
that it indeed has the Markov property \@ref(eq:markov). 
Remember, first, that
$$X_n=\sum_{k=1}^n \delta_k \ewhere \delta_k \text{ are independent
(possibly biased) coin-tosses.}$$ For a choice of
$i_0, \dots, i_n, j=i_{n+1}$ (such that $i_0=0$ and
$i_{k+1}-i_{k}=\pm 1$) we have 
$$%\label{equ:}
    \nonumber 
   \begin{split}
  \PP[ X_{n+1}=i_{n+1}&|X_n=i_n, X_{n-1}=i_{n-1},\dots, X_1=i_1, X_0=i_0]\\ = &
  \PP[ X_{n+1}-X_{n}=i_{n+1}-i_{n}|X_n=i_n, X_{n-1}=i_{n-1},\dots, X_1=i_1, X_0=i_0] \\ = &
  \PP[ \delta_{n+1}=i_{n+1}-i_{n}|X_n=i_n, X_{n-1}=i_{n-1},\dots, X_1=i_1, X_0=i_0] \\= &
  \PP[ \delta_{n+1}=i_{n+1}-i_n],
   \end{split}$$ 
   
  where the last equality follows from the fact that the
increment $\delta_{n+1}$ is independent of the previous increments, and,
therefore, also of the values of $X_1,X_2, \dots, X_n$. The last line
above does not depend on $i_{n-1}, \dots, i_1, i_0$, so $X$ indeed has
the Markov property.

The state space $S$ of $\seqz{X}$ is the set $\bZ$ of all integers, and
the initial distribution $\aaz$ is very simple: we start at $0$ with
probability $1$ (so that $\az_0=1$ and $\az_i=0$, for $i\not= 0$.). The
transition probabilities are simple to write down
$$p_{ij}= \begin{cases} p, & j=i+1 \\ q, & j=i-1 \\ 0, & \text{otherwise.}
\end{cases}$$ If you insist, these can be written down in an infinite matrix,
$$\Pr=\begin{bmatrix}
  \ddots & \vdots & \vdots & \vdots & \vdots & \vdots &  \\
  \dots  & 0 & p  & 0 & 0 & 0 & \dots \\
  \dots  & q & 0  & p & 0 & 0 & \dots \\
  \dots  &0  &q   & 0  & p  & 0  & \dots \\
  \dots  &0  &0  & q& 0 & p& \dots \\
  \dots  &0  & 0 &0 & q& 0& \dots \\
  \dots  &0  & 0 &0 & 0& q& \dots \\
   & \vdots & \vdots & \vdots & \vdots & \vdots & \ddots \\
\end{bmatrix}$$ but this representation is typically not as useful as in the finite case.

Here is a (portion of) a transition graph for a simple random walk. Instead of writing probabilities 
on top of the edges, we color code them as follows: green is $p$ and orange is $1-p$. 

<center>
<img src="_main_files/figure-html/unnamed-chunk-193-1.png" width="672" style="margin-top:-20%; margin-bottom: -20%" style="display: block; margin: auto;" />
</center>


###  Gambler's ruin {#gambler}

In Gambler's ruin, a gambler starts with $\$x$, where
$0\leq x \leq a\in\N$ and in each play wins a dollar (with probability
$p\in (0,1)$) and loses a dollar (with probability $q=1-p$). When the
gambler reaches either $0$ or $a$, the game stops. For mathematical
convenience, it is usually a good idea to keep the chain defined, even
after the modeled phenomenon stops. This is usually accomplished by 
simply assuming that the process "stays alive" but remains "frozen in place"
instead of disappearing. In our case, once the gambler reaches either of
the states $0$ and $a$, he/she simply stays there forever.

Therefore, the transition probabilities are similar to those of a random
walk, but differ from them at the boundaries $0$ and $a$. The state
space is finite $S=\set{0,1,\dots, a}$ and the matrix $\Pr$ is given by
$$\Pr=\begin{bmatrix}
  1 & 0 & 0 & 0 & \dots & 0 & 0 & 0 \\
  q & 0 & p & 0 & \dots & 0 & 0 & 0 \\
  0 & q & 0 & p & \dots & 0 & 0 & 0 \\
  0 & 0 & q & 0 & \dots & 0 & 0 & 0 \\
  \vdots & \vdots & \vdots & \vdots & \ddots & \vdots & \vdots & \vdots \\
  0 & 0 & 0 & 0 & \dots & 0 & p & 0 \\
  0 & 0 & 0 & 0 & \dots & q & 0 & p \\
  0 & 0 & 0 & 0 & \dots & 0 & 0 & 1 \\
\end{bmatrix}$$ 

In the picture below, green denotes the probability $p$ and orange probability $1-p$. As always, black is $1$. 

<center>
<img src="_main_files/figure-html/unnamed-chunk-194-1.png" width="720" style="margin-top:-20%; margin-bottom: -20%" style="display: block; margin: auto;" />
</center>

The initial distribution is deterministic: $$\az_i=
\begin{cases}
  1,& i=x,\\ 0,& i\not= x.
\end{cases}$$

### Regime Switching

Consider a system with two different states; think about a simple
weather forecast (rain/no rain), high/low water level in a reservoir,
high/low volatility regime in a financial market, high/low level of
economic growth, the political party in power, etc. Suppose that the
states are called $1$ and $2$ and the probabilities $p_{12}$ and
$p_{21}$ of switching states are given. The probabilities
$p_{11}=1-p_{12}$ and $p_{22}=1-p_{21}$ correspond to the system staying
in the same state. The transition matrix for this Markov chain with
$S=\set{1,2}$ is $$\Pr=
\begin{bmatrix}
  p_{11} & p_{12} \\ p_{21} & p_{22}.
\end{bmatrix}$$ When $p_{12}$ and $p_{21}$ are large (close to $1$) the
system nervously jumps between the two states. When they are small,
there are long periods of stability (staying in the same state).

<center>
<img src="_main_files/figure-html/unnamed-chunk-195-1.png" width="720" style="margin-top:-20%; margin-bottom: -20%" style="display: block; margin: auto;" />
</center>
One of the assumptions behind regime-switching models is that the
transitions (switches) can only happen in regular intervals (once a
minute, once a day, once a year, etc.). This is a feature of all
*discrete-time* Markov chains. One would need to use a *continuous-time*
model to allow for the transitions between states at any point in time.

### Deterministically monotone Markov chain

A stochastic process $\seqz{X}$ with state space $S=\N_0$ such that
$X_n=n$ for $n\in\N_0$ (no randomness here) is called Deterministically
monotone Markov chain (DMMC). The transition matrix looks like this
$$\Pr=
\begin{bmatrix}
  0 & 1 & 0 & 0 & \dots \\
  0 & 0 & 1 & 0 & \dots \\
  0 & 0 & 0 & 1 & \dots \\
  \vdots & \vdots & \vdots & \vdots & \ddots 
\end{bmatrix}$$ 

<center>
<img src="_main_files/figure-html/unnamed-chunk-196-1.png" width="720" style="margin-top:-20%; margin-bottom: -20%" style="display: block; margin: auto;" />
</center>

It is a pretty boring chain; its main use is as a counterexample.

### Not a Markov chain

Consider a frog jumping from a lily pad to a lily pad in a small forest
pond. Suppose that there are $N$ lily pads so that the state space can
be described as $S=\set{1,2,\dots, N}$. The frog starts on lily pad 1 at
time $n=0$, and jumps around in the following fashion: at time $0$ it
chooses any lily pad except for the one it is currently sitting on (with
equal probability) and then jumps to it. At time $n>0$, it chooses any
lily pad other than the one it is sitting on *and the one it visited
immediately before* (with equal probability) and jumps to it. The
position $\seqz{X}$ of the frog is not a Markov chain. Indeed, we have
$$\PP[X_3=1|X_2=2, X_1=3]= \frac{1}{N-2},$$ while
$$\PP[X_3=1|X_2=2, X_1=1]=0.$$

A more dramatic version of this example would be the one where the frog
remembers all the lily pads it had visited before, and only chooses
among the remaining ones for the next jump.

### Turning a non-Markov chain into a Markov chain

How can we turn the process the previous example into a Markov chain.
Obviously, the problem is that the frog has to remember the number of
the lily pad it came from in order to decide where to jump next. The way
out is to make this information a part of the state. In other words, we
need to change the state space. Instead of just $S=\set{1,2,\dots, N}$,
we set $S=\sets{(i_1,
  i_2)}{i_1,i_2 \in\set{1,2,\dots N}}$. In words, the state of the
process will now contain not only the number of the current lily pad
(i.e., $i_2$) but also the number of the lily pad we came from (i.e.,
$i_1$). This way, the frog will be in the state $(i_1,i_2)$ if it is
currently on the lily pad number $i_2$, and it arrived here from $i_1$.
There is a bit of freedom with the initial state, but we simply assume
that we start from $(1,1)$. Starting from the state $(i_1,i_2)$, the
frog can jump to any state of the form $(i_2, i_3)$, $i_3\not= i_1,i_2$
(with equal probabilities). Note that some states will never be visited
(like $(i,i)$ for $i\not = 1$), so we could have reduced the state space
a little bit right from the start.

It is important to stress that the passage to the new state space defines
a whole new stochastic process. It is therefore, not quite accurate, as the title suggests, 
to say that we
"turned" a non-Markov process into a Markov process. Rather, we replaced a non-Markovian
*model* of a given situation by a different, Markovian, one. 


### Deterministic functions of Markov chains do not need to be Markov chains

Let $\seqz{X}$ be a Markov chain on the state space $S$, and let
$f:S\to T$ be a function. The stochastic process $Y_n= f(X_n)$ takes
values in $T$; is it necessarily a Markov chain? 

We will see in this
example that the answer is *no*. Let $\seqz{X}$
be a simple symmetric random walk, with the usual state space $S = \bZ$. With
$r(m) = m\  (\text{mod } 3)$
denoting the remainder after the division by $3$, we first define the process $R_n = r(X_n)$ so that
$$R_n=\begin{cases} 
0, & \text{ if $X_n$ is divisible by 3,}\\
1, & \text{ if $X_n-1$ is divisible by 3,}\\
2, & \text{ if $X_n-2$ is divisible by 3.}
\end{cases}$$ 
Using $R_n$ we define $Y_n = (X_n-R_n)/3$ to be the corresponding quotient, so that $Y_n\in\bZ$ and
$$3 Y_n \leq X_n <3 (Y_n+1).$$ 
The process $Y$ is of the form $Y_n = f(X_n)$, where $f(i)= \lfloor i/3
\rfloor$, and $\lfloor x \rfloor$ is the largest integer not exceeding
$x$.

To show that $Y$ is not a Markov chain, let us consider the the event
$A=\set{Y_2=0, Y_1=0}$. The only way for this to happen is if $X_1=1$
and $X_2=2$ or $X_1=1$ and $X_2=0$, so that $A=\set{X_1=1}$. Also
$Y_3=1$ if and only if $X_3=3$. Therefore
$$\PP[ Y_3=1|Y_2=0, Y_1=0]=\PP[ X_3=3| X_1=1]= 1/4.$$ On the other hand,
$Y_2=0$ if and only if $X_2=0$ or $X_2=2$, so $\PP[Y_2=0]= 3/4$.
Finally, $Y_3=1$ and $Y_2=0$ if and only if $X_3=3$ and so
$\PP[Y_3=1, Y_2=0]= 1/8$. Hence,
$$\PP[ Y_3=1|Y_2=0]=\PP[Y_3=1, Y_2=0]/\PP[Y_2=0]= \frac{1/8}{3/4}=
\frac{1}{6}.$$ Therefore, $Y$ is not a Markov chain. If you want a more dramatic
example, try to modify this
example so that one of the probabilities above is positive, but the
other is zero.

The important property of the function $f$ we applied to $X$ is that it is *not one-to-one*. In other words, 
$f$ collapses several states of $X$ into a single state of $Y$. This way, the "present" may end up containing 
so little information that the past suddenly becomes relevant for the dynamics of the future evolution. 

### A game of tennis

In a game of tennis, the scoring system is as follows: both players start with the score of $0$. Each time
player 1 wins a point (a.k.a. *a rally*), her score moves a step up in the
following hierarchy $$0 \mapsto 15 \mapsto 30 \mapsto 40.$$ Once she
reaches $40$ and scores a point, three things can happen:

1.  if the score of player 2 is $30$ or less, player 1 wins the game.

2.  if the score of player 2 $40$, the score of player 1 moves up to "advantage",
    and

3.  if the score of player 2 is  "advantage", nothing happens to the score of player 1
     but the score of player 2 falls back to $40$.

Finally, if the score of player 1 is "advantage" and she wins a point, she
wins the game. The situation is entirely symmetric for player 2. We suppose
that the probability that player 1 wins each point is $p\in (0,1)$,
independently of the current score. A situation like this is a typical
example of a Markov chain in an applied setting. What are the states of
the process? We obviously need to know both players' scores and we also
need to know if one of the players has won the game. Therefore, a
possible state space is the following: 

\begin{align}
      S=
      \Big\{ &(0,0), (0,15), (0,30), (0,40), (15,0), (15,15), (15,30), (15,40), (30,0),
      (30,15),\\ &  (30,30),  (30,40), (40,0), (40,15), (40,30), (40,40), (40,A), (A,40), W_1, W_2 \Big\}
\end{align}

where $A$ stands for *"advantage"* and $W_1$
(resp., $W_2$) denotes the state where player 1 (resp., player 2) wins. It is not hard
to assign probabilities to transitions between states. Once we reach
either $W_1$ or $W_2$ the game stops. We can assume that the
chain remains in that state forever, i.e., the state is absorbing. 

<center>
<img src="_main_files/figure-html/unnamed-chunk-197-1.png" width="576" style="margin-top:-10%; margin-bottom: -10%" style="display: block; margin: auto;" />
</center>

The
initial distribution is quite simple - we always start from the same
state $(0,0)$, so that $\az_{(0,0)}=1$ and
$\az_i=0$ for all $i\in S\setminus\set{(0,0)}$.

How about the transition matrix? When the number of states is big
($\# S=20$ in this case), transition matrices are useful in computer
memory, but not so much on paper. Just for the fun of it, here is the
transition matrix for our game-of-tennis chain (I am going to leave it up to you 
to figure out how rows/columns of the matrix match to states) $$\tiny
\Pr=
\mat{
 1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
 0 & 1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
 0 & 0 & 0 & q & 0 & 0 & p & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
 0 & 0 & 0 & 0 & q & 0 & 0 & p & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
 0 & 0 & 0 & 0 & 0 & q & 0 & 0 & p & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
 0 & q & 0 & 0 & 0 & 0 & 0 & 0 & 0 & p & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
 0 & 0 & 0 & 0 & 0 & 0 & 0 & q & 0 & 0 & p & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & q & 0 & 0 & p & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & q & 0 & 0 & p & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
 0 & q & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & p & 0 & 0 & 0 & 0 & 0 & 0 \\
 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & q & 0 & 0 & p & 0 & 0 & 0 & 0 & 0 \\
 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & q & 0 & 0 & p & 0 & 0 & 0 & 0 \\
 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & q & 0 & 0 & p & 0 & 0 & 0 \\
 0 & q & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & p & 0 & 0 \\
 p & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & q & 0 & 0 & 0 & 0 \\
 p & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & q & 0 & 0 & 0 \\
 p & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & q & 0 & 0 \\
 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & q & p \\
 0 & q & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & p & 0 & 0 \\
 p & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & q & 0 & 0 \\
} $$

Does the structure of a game of tennis make is easier or harder for the better
player to win? In other words, if you had to play against the best tennis player
in the world (I am rudely assuming that he or she is better than you), would you
have a better chance of winning if you only played a point (rally), or if you
played the whole game? We will give a precise answer to this question in a little while. In the
meantime, try to guess.

## Chapman-Kolmogorov equations

The transition probabilities $p_{ij}$, $i,j\in S$ tell us how a Markov
chain jumps from one state to another in a single step. Think of it as a description of
the *local* behavior of the chain. This is the information one can usually obtain from observations and modeling assumptions. On the other hand, it is the *global* (long-time) behavior of the model that
provides the most interesting insights. In that spirit, we turn our attention 
to  probabilities like this:
$$\PP[X_{k+n}=j|X_k=i] \text{ for } n = 1,2,\dots.$$
Since we are assuming that all of our
chains are homogeneous (transition probabilities do not change with
time), this probability does not depend on the time $k$, so we can define the **multi-step transition probabilities** $\pn_{ij}$ as follows:
$$\pn_{ij}=\PP[X_{k+n}=j|X_{k}=i]=\PP[ X_{n}=j|X_0=i].$$ We allow $n=0$ under
the useful convention that 
$$p^{(0)}_{ij}=\begin{cases} 1, & i=j,\\ 0,&
  i\not = j.
\end{cases}$$
We note right away that the numbers $\pn_{ij}$, $i,j\in S$ naturally fit into an $N\times N$-matrix which we denote by $\Prn$. We note right away that
\begin{equation}
  \Prz = \Id\text{ and } \Pro = \Pr,
(\#eq:Przo)
\end{equation}
where $\Id$ denotes the $N\times N$ identity matrix. 

The central result of this section is the following sequence of equalities connecting $\Prn$ for different values of $n$, know as the **Chapman-Kolmogorov equations**:
\begin{equation}
  \Prup{m+n} = \Prup{m} \Prup{n}, \text{ for all } m,n \in \N_0.
(\#eq:CK)
\end{equation}
To see why this is true we start by computing 
$\PP[ X_{n+m} = j, X_0=i]$. Since each trajectory from $i$ to $j$ in $n+m$ steps has be somewhere at time $n$, we can write
\begin{equation}
  \PP[ X_{n+m}= j, X_0 = i] = \sum_{k\in S} \PP[X_{n+m} = j, X_{n} = k, X_0 = i].
(\#eq:one-CK)
\end{equation}
 By the multiplication rule, we have
\begin{multline}
\PP[X_{n+m} = j, X_{n} = k, X_0 = i] = \PP[ X_{n+m} = j | X_{n}=k, X_{0}=i] \PP[X_{n}=k, X_0 = i],
(\#eq:two-CK)
\end{multline}
and then, by the Markov property:
\begin{equation}
  \PP[ X_{n+m} = j | X_{n}=k, X_{0}=i] = \PP[ X_{n+m} = j | X_n = k].
(\#eq:three-CK)
\end{equation}
Combining \@ref(eq:one-CK), \@ref(eq:two-CK) and \@ref(eq:three-CK) we obtain the following
equality:
\begin{equation}
  \PP[ X_{n+m}= j, X_0 = i] = \sum_{k\in S} \PP[ X_{n+m} = j | X_n = k] \PP[X_{n}=k, X_0 = i].
\end{equation}
which is nothing but \@ref(eq:CK); to see that, just remember how matrices are multiplied.

The punchline is that \@ref(eq:CK), together with \@ref(eq:Przo) imply that
\begin{equation}
  \Prn = \Pr^n,
(\#eq:Prn-Pn)
\end{equation}
where the left-hand side is the matrix composed of the $n$-step transition
probabilities, and the right hand side is the $n$-th (matrix) power of the
($1$-step) transition matrix $\Pr$. Using \@ref(eq:Prn-Pn) allows us to 
write a simple expression for the
distribution of the random variable $X_n$, for $n\in\N_0$. Remember that
the initial distribution (the distribution of $X_0$) is denoted by
$\aaz=(\az_i)_{i\in S}$. Analogously, we define the vector
$\aaa{n}=(\aa{n}_i)_{i\in S}$ by $$\aa{n}_i=\PP[X_n=i],\ i\in S.$$ Using
the law of total probability, we have
$$\aa{n}_i=\PP[X_n=i]=\sum_{k\in S} \PP[ X_0=k] \PP[ X_n=i|X_0=k]=
\sum_{k\in S} \az_k \pn_{ki}.$$ We usually interpret $\aaz$ as a (row)
vector, so the above relationship can be expressed using vector-matrix
multiplication $$\aaa{n}=\aaz \Pr^n.$$

<div class="problem">
  Find an explicit expression for $\Prn$ in the case of the regime-switching 
  chain introduced above. Feel free to assume that $p_{ij}>0$ for all $i,j$.
</div>
<div class="solution">
It is often difficult to compute $\Pr^n$ for a general transition
matrix $\Pr$ and a large $n$. We will see later that it will be easier
to find the limiting values $\lim_{n\to\infty}\pn_{ij}$. The regime-switching
chain is one of the few examples where everything can be done by hand. 

By \@ref(eq:Prn-Pn), we need to compute the $n$-th matrix power of the transition
matrix $\Pr$. To make the notation a bit nicer, let us write $a$ for $p_{12}$ and
$b$ for $p_{21}$, so that we can write
$$\Pr=
\begin{bmatrix}
  1-a & a \\ b & 1-b
\end{bmatrix}$$ 

The winning idea is to use  diagonalization, and for that we start by writing down the
characteristic equation $\det (\ld I-\Pr)=0$ of the
matrix $\Pr$:
$$\label{equ:}
    \nonumber 
   \begin{split}
 0&=\det(\ld I-\Pr)=
\begin{vmatrix}
\ld -1+a & -a \\ -b & \ld -1+b
\end{vmatrix}\\ &
=((\ld-1)+a)((\ld-1)+b)-ab
=(\ld-1)(\ld-(1-a-b)). 
   \end{split}$$ The eigenvalues are, therefore, $\ld_1=1$ and
$\ld_2=1-a-b$, and the corresponding eigenvectors are $v_1=\binom{1}{1}$ and
$v_2=\binom{a}{-b}$. Therefore, 
if we define $$V=
\begin{bmatrix}
1 & a \\ 1 & -b
\end{bmatrix} 
\eand D=
\begin{bmatrix}
  \ld_1 & 0 \\ 0 & \ld_2
\end{bmatrix}=
\begin{bmatrix}
  1 & 0 \\ 0 & (1-a-b)
\end{bmatrix}$$ we have $$\Pr V =
V D,\text{ i.e., } \Pr= V D V^{-1}.$$ This representation is very useful
for taking (matrix) powers: $$\label{equ:60C4}
 \begin{split}
    \Pr^n &= (V D V^{-1})( V D V^{-1}) \dots (V D V^{-1})= V D^n V^{-1}
  \\ & =
   V
   \begin{bmatrix}
     1  & 0 \\ 0 & (1-a-b)^n
   \end{bmatrix} V^{-1}
 \end{split}$$ We assumed that all $p_{ij}$ are positive which means, in particular, that $a+b>0$ and 
 $$V^{-1} = \tfrac{1}{a+b}
\begin{bmatrix}
  b & a \\ 1 & -1
\end{bmatrix},$$ and so 
\begin{align}
 \Pr^n &= V D^n V^{-1}= 
\begin{bmatrix}
1 & a \\ 1 & -b
\end{bmatrix}
\ 
\begin{bmatrix}
1 & 0 \\ 0 & (1-a-b)^n
\end{bmatrix}
\ 
\tfrac{1}{a+b}
\begin{bmatrix}
  b & a \\ 1 & -1
\end{bmatrix}\\
&=
 \frac{1}{a+b} 
  \begin{bmatrix}
   b & a \\ b & a 
  \end{bmatrix}
+
 \frac{(1-a-b)^n}{a+b} 
  \begin{bmatrix}
    a & -a \\ b & -b
  \end{bmatrix}\\
&=
\begin{bmatrix}
  \frac{b}{a+b}+(1-a-b)^n \frac{a}{a+b} &   \frac{a}{a+b}-(1-a-b)^n \frac{a}{a+b}\\
  \frac{b}{a+b}+(1-a-b)^n \frac{b}{a+b} &   \frac{a}{a+b}-(1-a-b)^n \frac{b}{a+b}
\end{bmatrix}
\end{align}

The expression for $\Pr^n$ above tells us a lot about the structure of
the multi-step probabilities $\pn_{ij}$ for large $n$. Note that the
second matrix on the right-hand side above comes multiplied by
$(1-a-b)^n$ which tends to $0$ as $n\to\infty$ (under our assumptions that $p_{ij}>0$.)
We can, therefore, write
$$\Pr^n\sim \frac{1}{a+b}
\begin{bmatrix}
  b & a \\ b & a
\end{bmatrix}
\text{ for large } n.$$ The fact that the rows of the right-hand side
above are equal points to the fact that, for large $n$, $\pn_{ij}$ does
not depend (much) on the initial state $i$. In other words, this Markov
chain forgets its initial condition after a long period of time. This is
a rule more than an exception, and we will study such phenomena in the
following lectures.
</div>

## How to simulate Markov chains {#mc-sim}

One of the (many) reasons Markov chains are a popular modeling tool is the ease with which they can be simulated. When we simulated a random walk, we started at $0$ and built the process by adding independent coin-toss-distributed increments. We obtained the value of the next position of the walk by *adding* the present position and the value of an independent random variable. For general Markov chain, this procedure works almost verbatim, except that the function that combines the present position 
and a value of an independent random variable may be something other than addition. 
In general, we collapse the two parts of the process - a simulation of an independent random variable and its combination with the present position - into one. Given our position, we pick the row of the transition matrix that corresponds to it and then use its elements as the probabilities that govern our position tomorrow. It will all be clear once you read through the solution of the following problem.

<div class="problem">
  Simulate $1000$ trajectories of a gambler's ruin Markov chain with $a=3$, $p=2/3$ and $x=1$ (see subsection \@ref(gambler) above for the meaning of these constants). Use the Monte Carlo method to estimate the probability that the gambler will leave the casino with $\$3$ in her pocket in at most $T=100$ time periods.
</div>
<div class="solution">

```r
# state space
S = c(0, 1, 2, 3)

# transition matrix
P = matrix(c(1,   0,   0,   0,
             1/3, 0,   2/3, 0,
             0,   1/3, 0,   2/3,
             0,   0,   0,   1), 
           byrow=T, ncol=4)

T = 100 # number of time periods
nsim = 1000 # number of simulations

# simulate the next position of the chain
draw_next = function(s) {
  i = match(s, S) # the row number of the state s
  sample(S, prob = P[i, ], size = 1)
}

# simulate a single trajectory of length T
# from the initial state
single_trajectory = function(initial_state) {
  path = numeric(T)
  last = initial_state
  for (n in 1:T) {
    path[n] = draw_next(last)
    last = path[n]
  }
  return(path)
}

# simulate the entire chain
simulate_chain = function(initial_state) {
  data.frame(X0 = initial_state,
             t(replicate(
               nsim, single_trajectory(initial_state)
             )))
}

df = simulate_chain(1)
(p = mean(df$X100 == 3))
## [1] 0.591
```

*R.* The function `draw_next` is at the heart of the simulation. Given the current state `s`, it looks up the row of the transition matrix `P` which corresponds to `s`. This is where the function `match` comes in handy - `match(s,S)` gives you the position of th element `s` in the vector `S`. Of course, if $S = \{ 1,2,3, \dots, n\}$ then we don't need to use `match`, as each state is "its own position". In our case, `S` is a bit different, namely $S=\{0,1,2,3\}$, and so `match(s,S)` is nothing by `s+1`. This is clearly an overkill in this case, but we still do it for didactical purposes. 

Once the row corresponding to the state `s` is identified, we use its elements as the probabilities to be fed into the command `sample`, which, in turn, returns our next state and we repeat the procedure over and over (in this case $T=100$ times). 
</div>



## Additional problems for Chapter 5


<!--
  max-roll-so-far
  ------------------------------------------------
-->
<div class="problem">

Let $\seqz{Y}$ be a sequence
of die-rolls, i.e., a sequence of independent random variables which take values $1,2,\dots, 
6$, each with probability $1/6$. Let $\seqz{X}$ be a stochastic process defined by
$$X_n=\max (Y_0,Y_1,
\dots, Y_n), \ n\in\N_0.$$ In words, $X_n$ is the maximal value rolled
so far. Is $\seqz{X}$ a Markov chain? If it is, find its
transition matrix and the initial distribution. If it is not, give an example 
of how the Markov property is violated.
</div>
<div class="solution">

It turns out that $\seq{X}$ is, indeed, a Markov chain.
The value of $X_{n+1}$ is either going to be equal to $X_n$ if $Y_{n+1}$
happens to be less than or equal to it, or it moves up to $Y_{n+1}$,
otherwise, i.e., $X_{n+1}=\max(X_n,Y_{n+1})$. Therefore, the
distribution of $X_{n+1}$ depends on the previous values
$X_0,X_1,\dots, X_n$ only through $X_n$, and, so, $\seqz{X}$ is a Markov
chain on the state space $S=\set{1,2,3,4,5,6}$. The transition matrix
is given by $$P=\begin{bmatrix} 
1/6 & 1/6 & 1/6 & 1/6 & 1/6 & 1/6 \\
0   & 1/3 & 1/6 & 1/6 & 1/6 & 1/6 \\
0   & 0   & 1/2 & 1/6 & 1/6 & 1/6 \\
0   & 0   & 0   & 2/3 & 1/6 & 1/6 \\
0   & 0   & 0   & 0   & 5/6 & 1/6 \\
0   & 0   & 0   & 0   & 0   & 1 \\
\end{bmatrix}$$
</div>

<!-- 
  Y-Z-Markov-chains
  ------------------------------------------------
-->
<div class="problem">

Let $\seqz{X}$ be a simple symmetric random walk. For $n\in\N_0$, define
$Y_n = 2X_n+1$, and let $Z_n$ be the amount of time $X_n$ spent
strictly above $0$ up to (and including) time $n$, i.e.
$$Z_0=0, Z_{n+1} - Z_n = \begin{cases} 1, & X_{n+1}>0 \\ 0, & X_
    {n+1}\leq 0 \end{cases} , \efor n\in\N_0.$$
Is $Y$ a Markov chain? Is $Z$?
</div>
<div class="solution">

$Y$ is a Markov chain because it is just a
random walk started at $1$ with steps of size $2$ (a more rigorous proof
would follow the same line of reasoning as the proof that random walks are Markov chains).
$Z$ is not a Markov chain because the knowledge of far history (beyond
the present position) affects the likelihood of the next transition as the
 following example shows:
$$\begin{aligned}
    \PP[ Z_4=2| Z_0=0, Z_1=0, Z_2=0, Z_3=1]=1/2\end{aligned}$$ but
$$\begin{aligned}
    \PP[ Z_4=2| Z_0=0, Z_1=1, Z_2=1, Z_3=1]= 0.\end{aligned}$$
</div>

<!--
  number-of-consecutives
  ------------------------------------------------
-->
<div class="problem">

Let $\seq{\delta}$ be a sequence of independent coin tosses (i.e., random
variables with values $T$ or $H$ with equal probabilities). Let $X_0=0$,
and, for $n\in\N$, let $X_n$ be the number of times two consecutive
$\delta$s take the same value in the first $n+1$ tosses. For example, if
the outcome of the coin tosses is TTHHTTTH ..., we have $X_0=0$,
$X_1=1$, $X_2=1$, $X_3=2$, $X_4=2$, $X_5=3$, $X_6=4$, $X_7=4$, ...

Is $\seqz{X}$ a Markov chain?  If it is,
describe its state space, the transition probabilities and the initial
distribution. If it is not, show exactly how the Markov property is
violated.
</div>
<div class="solution">

Yes, the process $X$ is a Markov chain, on the state space $S=\N_0$.
To show that we make the following simple observation: we have
$X_{n}-X_{n-1}=1$ if $\delta_n=\delta_{n+1}$ and $X_n-X_{n-1}=0$, otherwise
(for $n\in\N$). Therefore,
$$\PP[ X_{n+1}=i_n+1 | X_{n}=i_n, \dots, X_1=i_1, X_0=0] =
\PP[ \delta_{n+2}=\delta_{n+1} | X_{n}=i_n, \dots, X_1=i_1,X_0=0].$$ Even if
we knew the exact values of all $\delta_1,\dots, \delta_n,\delta_{n+1}$, the
(conditional) probability that $\delta_{n+2}=\delta_{n+1}$ would still be
$1/2$, regardless of these values. Therefore,
$$\PP[ X_{n+1}=i_n+1| X_n=i_n,\dots, X_1=i_1, X_0=0] = \tot,$$ and,
similarly, $$\PP[ X_{n+1}=i_n| X_n=i_n,\dots, X_1=i_1, X_0=0] = \tot.$$
Therefore, the conditional probability given all the past depends on the
past only through the value of $X_n$ (the current position), and we
conclude that $X$ is, indeed, a Markov process. Its initial distribution
is deterministic $\PP[X_0=0]=1$, and the transition probabilities, as
computed above, are $$p_{ij}=\PP[ X_{n+1}=j| X_n=i] = \begin{cases}
  1/2, &\text{ if } j=i+1, \\
  1/2, &\text{ if } j=i, \\
  0, &\text{ otherwise.}
  \end{cases}$$ In fact, $2 X_n - n$ is a simple symmetric random walk.
</div>


<!--
  lazy-chain
  ------------------------------------------------
-->
<div class="problem">

Let $X$ be a Markov chain on $N$ states, with the $N\times N$ transition
matrix $P$. We construct a new Markov chain $Y$ from the transition mechanism of $X$ as 
follows: at
each point in time, we toss a biased coin (probability of *heads*
$p\in (0,1)$), independently of everything else. 
If it shows *heads* we  move according to the transition matrix of $X$.  If it shows *tails*, we remain in the same state. What is the transition matrix of $Y$? 
</div>
<div class="solution">

Let $Q=(q_{ij})$ denote the transition probability for the chain $Y$.
When $i\ne j$, the chain $Y$ will go from $i$ to $j$ in one step if and only if the
coin shows *heads* and the chain $X$ wants to jump from $i$ to $j$. Since the 
two events are independent, the
probability of the former is $p$, and of the later is $p_{ij}$, we have
$q_{ij} = p p_{ij}$.

In the case $i=j$, the chain $Y$ will transition from $i$ to $i$ (i.e.,
stay in $i$) if either the coin shows *heads*, or if the coin shows
*tails* and the chain $X$ decides to stay in $i$. Therefore,
$q_{ii} = p + (1-p) p_{ij}$, i.e., 
$$ Q = p \Id +(1-p) P,$$
where $\Id$ denotes $N\times N$ identity matrix.
</div>

<!--
  blue-red-100
  ------------------------------------------------
-->
<div class="problem">

The red container has 100 red balls, and
the blue container has 100 blue balls. In each step 

\- a container is selected (with equal probabilities), 

\- a ball is selected from it (all balls in the container are equally
likely to be selected), and 

\- the selected ball is  placed in the other container. If the
selected container is empty, no ball is transferred.

Once there are 100 blue balls in the red container and 100 red balls in
the blue container, the game stops.

We decide to model the situation as a Markov chain.

1.  What is the state space $S$ we can use? How large is it?

2.  What is the initial distribution?

3.  What are the transition probabilities between states? Don't write
    the matrix, it is way too large; just write a general expression for
    $p_{ij}$, $i,j\in S$.

(Note: this is a version of the famous Ehrenfest Chain from statistical physics.)
</div>
<div class="solution">

There are many ways in which one can solve this problem. Below is just
one of them.

<part> 1. </part>

In order to describe the situation being modeled, we need to keep
track of the number of balls of each color in each container.
Therefore, one possibility is to take the set of all quadruplets
$(r,b,R,B)$, $r,b,R,b\in \set{0,1,2,\dots, 100}$ and this state
space would have $101^4$ elements. We know, however, that the total
number of red balls, and the total number of blue balls is always
equal to 100, so the knowledge of the composition of the red (say)
container is enough to reconstruct the contents of the blue
container. In other words, we can use the number of balls of each
color in the red container only as our state, i.e.
$$S=\sets{(r,b)}{r,b=0,1,\dots, 100}.$$ This state space has
$101\times 101=10201$ elements.

<part> 2. </part>

The initial distribution is deterministic: $\PP[X_0=(100,0)]=1$
and $\PP[X_0=i]=0$, for $i\in
  S\setminus\set{(100,0)}$. In the vector notation,
$$\az=(0,0, \dots, 0, 1, 0, \dots,
0),$$ where $1$ is at the place corresponding to $(100,0)$.

<part> 3. </part>

Let us consider several separate cases, with the understanding that
$p_{ij}=0$, for all $i,j$ not mentioned explicitly below:

1.  *One of the containers is empty.* In that case, we are either in
    $(0,0)$ or in $(100,100)$. Let us describe the situation for
    $(0,0)$ first. If we choose the red container - and that happens
    with probability $\tot$ - we stay in $(0,0)$:
    $$p_{(0,0),(0,0)}=\tot.$$ If the blue container is chosen, a
    ball of either color will be chosen with probability
    $\tfrac{100}{200}=\tot$, so
    $$p_{(0,0),(1,0)}=p_{(0,0),(0,1)}=\tfrac{1}{4}.$$ By the same
    reasoning, $$p_{(100,100),(0,0)}=\tot \text{ and } 
    p_{(100,100),(99,100)}=p_{(100,100),(100,99)}=\tfrac{1}{4}.$$

2.  *We are in the state* $(0,100)$. By the description of the
    model, this is an absorbing state, so $p_{(0,100),(0,100)}=1.$

3.  *All other cases* Suppose we are in the state $(r,b)$ where
    $(r,b)\not\in\set{(0,100),(0,0),(100,100)}$. If the red
    container is chosen, then the probability of getting a red ball
    is $\tfrac{r}{r+b}$, so
    $$p_{(r,b),(r-1,b)}= \tot \tfrac{r}{r+b}.$$ Similarly,
    $$p_{(r,b),(r,b-1)}= \tot \tfrac{b}{r+b}.$$ In the blue
    container there are $100-r$ red and $100-b$ blue balls. Thus,
    $$p_{(r,b),(r+1,b)}= \tot \tfrac{100-r}{200-r-b},$$ and
    $$p_{(r,b),(r,b+1)}= \tot \tfrac{100-b}{200-r-b}.$$
</div>




<!--
  deck-2-2
  ------------------------------------------------
-->
<div class="problem">

A "deck" of cards starts with 2 red and 2 black cards. A "move" consists
of the following:

\- pick a random card from the deck (if the deck is empty, do nothing),

\- if the card is black *and* the card drawn on the previous move was also black, return it back to the deck,

\- otherwise, throw the card away (this, in particular, applies to any card drawn on the first move, since there is no "previous" move at that time).

  
1. Model the situation using a Markov chain: find an appropriate state
space, and sketch the transition graph with transition
probabilities. How small can you make the state space? 

2.  What is the probability that the deck will be empty after exactly
$4$ moves? What is the probability that the deck will be empty
eventually?
</div>
<div class="solution">

<part> 1. </part>

We need to keep track of the number of remaining cards of each color
in the deck, as well as the color of the last card we picked (except
at the beginning or when the deck is empty, when it does not
matter). Therefore, the initial state will be $(2,2)$, the
empty-deck state will be $(0,0)$ and the other states will be
triplets of the form $(\#r, \#b, c)$, where $\#r$ and $\#b$ denote
the number of cards (red and black) in the deck, and $c$ is the
color, $R$ or $B$, of the last card we picked. This way, the initial
guess for the state space would be $$\begin{aligned}
        S_0  = \{&(2,2), (0,0),\\
            & (2,1,B), (2,1,R), (1,2,B), (1,2,R),\\
            & (1,1,B), (1,1,R), 
            (0,2,B), (2,0,R), (2,0,B), (0,2,R),\\
            & (0,1,B), (0,1,R), (1,0,B), (1,0,R) 
          \}
      \end{aligned}$$ 

In order to decrease the size of the state space, we start the chain  at
$(2,2)$ and consider all trajectories it is possible to take from there. 
It turns out that states $(2,1,R), (1,2,B), (0,2,B), (2,0,R),
      (2,0,B)$ and $(1,0,R)$ can never be reached from $(2,2)$, so
we might as well leave them out of the state space. That reduces the
initial guess $S_0$ to a smaller $10$-state, version
\begin{equation}
S  = \{(2,2), (0,0),
             (2,1,B),  (1,2,R),
             (1,1,B),  (1,1,R), 
             (0,2,R),
             (0,1,B), (0,1,R), (1,0,B)  
         \}
\end{equation}
with the following transition graph:


You could further reduce the number of states to $9$ by removing the initial state $(2,2)$
and choosing a non-deterministic distribution over the states that 
can be reached from them. There is something unsatisfying about that, though. 

<part> 2. </part>

To get from $(2,2)$ to $(0,0)$ in exactly four steps, we need to
    follow one of the following three paths: $$\begin{aligned}
                & (2,2) \to (2,1,B) \to (1,1,R) \to (1,0,B) \to (0,0), \\
                & (2,2) \to (2,1,B) \to (1,1,R) \to (0,1,R) \to (0,0), \text{
                or }\\
                & (2,2) \to (1,2,R) \to (1,1,B) \to (0,1,R) \to (0,0). \\
             \end{aligned}$$ 
Their respective probabilities happen to be
the same, namely
$\tot \times \tfrac{2}{3} \times \tot \times 1 = \oo{6}$, so the
probability of hitting $(0,0)$ in exactly $4$ steps is 
$3 \times \oo{6} = \tot$.

To compute the probability of hitting $(0,0)$ eventually, we note
that this is guaranteed to happen sooner or later (see the graph
above) if the first card we draw is black. It is also guaranteed to
happen is the first card we draw is red, but the second one is
black. In fact, the only way for this not to happen is to draw two
red cards on the first two draws. This happens with probability
$\tot \times \oo{3} = \oo{6}$, so the required probability of ending up with an
empty deck is $1 - \tf{1}{6} = \tf{5}{6}$.
</div>

<!--
  train-m-cities
  ------------------------------------------------
-->
<div class="problemec">

A country has $m+1$ cities ($m\in\N$), one of which is the capital.
There is a direct railway connection between each city and the capital,
but there are no tracks between any two "non-capital" cities. A traveler
starts in the capital and takes a train to a randomly chosen non-capital
city (all cities are equally likely to be chosen), spends a night there
and returns the next morning and immediately boards the train to the
next city according to the same rule, spends the night there, ..., etc.
We assume that her choice of the city is independent of the cities
visited in the past. Let $\seqz{X}$ be the number of visited non-capital
cities up to (and including) day $n$, so that $X_0=1$, but $X_1$ could
be either $1$ or $2$, etc.

1.  Explain why $\seqz{X}$ is a Markov chain on the appropriate state
    space $\sS$ and the find the transition probabilities of $\seqz{X}$,
    i.e., write an expression for
    $$\PP[X_{n+1}=j|X_n=i], \text{ for $i,j\in S$.}$$

2.  Let $\tau_m$ be the first time the traveler has visited all $m$
    non-capital cities, i.e. $$\tau_m=\min\sets{n\in\N_0}{X_n=m}.$$ What
    is the distribution of $\tau_m$, for $m=1$ and $m=2$.

3.  Compute $\EE[\tau_m]$ for general $m\in\N$. What is the
    asymptotic behavior of $\EE[\tau_m]$ as $m\to\infty$? More
    precisely, find a simple function $f(m)$ of $m$ (like $m^2$ or
    $\log(m)$) such that $\EE[\tau_m] \sim f(m)$, i.e.,
    $\lim_{m\to\infty} \tf{\EE[\tau_m]}{f(m)} = 1$.
</div>
<div class="solution">

<part> 1. </part>

The natural state space for $\seqz{X}$ is $S=\set{1,2,\dots,
      m}$. It is clear that $\PP[X_{n+1}=j|X_n=i]=0,$ unless, $i=j$
or $i=j+1$. If we start from the state $i$, the process will remain
in $i$ if the traveler visits one of the already-visited cities, and
move to $i+1$ is the visited city has never been visited before.
Thanks to the uniform distribution in the choice of the next city,
the probability that a never-visited city will be selected is
$\tfrac{m-i}{m}$, and it does not depend on the (names of the)
cities already visited, or on the times of their first visits; it
only depends on their number. Consequently, the extra information
about $X_1,X_2,\dots, X_{n-1}$ will not change the probability of
visiting $j$ in any way, which is exactly what the Markov property
is all about. Therefore, $\seq{X}$ is Markov and its transition
probabilities are given by $$p_{ij}=\PP[X_{n+1}=j|X_{n}=i]=
\begin{cases}
  0, & j\not \in \set{i,i+1}\\
  \tfrac{m-i}{m}, & j=i+1\\
  \tfrac{i}{m}, & j=i.
\end{cases}$$ (*Note:* the situation would not be nearly as nice if
the distribution of the choice of the next city were non-uniform. In
that case, the list of the (names of the) already-visited cities
would matter, and it is not clear that the described process has the
Markov property (does it?). )

<part> 2. </part>

For $m=1$, $\tau_m=0$, so its distribution is deterministic and
concentrated on $0$. The case $m=2$ is only slightly more
complicated. After having visited his first city, the visitor has a
probability of $\tot$ of visiting it again, on each consecutive day.
After a geometrically distributed number of days, he will visit
another city and $\tau_2$ will be realized. Therefore the
distribution $\seqz{p}$ of $\tau_2$ is given by
$$p_0=0, p_1=\tot, p_2=(\tot)^2, p_3=(\tot)^3,\dots$$

<part> 3. </part>

For $m>1$, we can write $\tau_m$ as
$$\tau_m=\tau_1+(\tau_2-\tau_1)+\dots +(\tau_m-\tau_{m-1}),$$ so
that
$$\EE[\tau_m]=\EE[\tau_1]+\EE[\tau_2-\tau_1]+\dots+\EE[\tau_m-\tau_{m-1}].$$
We know that $\tau_1=0$ and for $k=1,2,\dots, m-1$, the difference
$\tau_{k+1}-\tau_{k}$ denotes the waiting time before a
never-before-visited city is visited, given that the number of
already-visited cities is $k$. This random variable is geometric
with success probability given by $\tfrac{m-k}{m}$, so its
expectation is given by
$$\EE[\tau_{k+1}-\tau_k]= \frac{1}{ \tfrac{m-k}{m}}=\frac{m}{m-k}.$$
Therefore, $$\EE[\tau_m]=\sum_{k=1}^{m-1} \frac{m}{m-k}= m
(1+\tot+\tfrac{1}{3}+\dots+\tfrac{1}{m-1}).$$ By comparing it with
the integral $\int_1^m \oo{x}\, dx$, it is possible to conclude that
$H_m=1+\tot+\dots+\tfrac{1}{m-1}$ behaves like $\log m$, i.e., that
$$\lim_{m\to\infty} \tf{H_m}{\log m} = 1.$$ Therefore
$\EE[\tau_m] \sim f(m)$, where $f(m) = m \log m$.
</div>


<!-- multi-step -->

<!--
  glass-milk
  ------------------------------------------------
-->
<div class="problem">

We start with two cups, call them $A$ and $B$. Cup $A$ contains $12$ oz of milk, and cup $B$ $12$ oz of water. The
following procedure is then performed *twice*: first, half of the
content of the glass $A$ is transferred into class $B$. Then, the
contents of glass $B$ are thoroughly mixed, and a third of its entire
content transferred back to $A$. Finally, the contents of the glass $A$
are thoroughly mixed. What is the final amount of milk in glass A? What
does this have to do with Markov chains?
</div>
<div class="solution">

If there are $a$ oz of milk and $b$ oz of water in the glass $A$ at time
$n$ (with $a+b=12$), then there are $b$ oz of milk and $a$ oz of water
in the glass $B$. After half of the content of glass $A$ is moved to
$B$, it will contain $b+\tot a$ oz of milk and $a+\tot b$ oz of water.
Transferring a third of that back to $a$ leaves $B$ with
$(2/3 b + 1/3 a)$ oz of milk and $(2/3 a + 1/3 b)$ oz of water.
Equivalently, $A$ contains $(2/3 a + 1/3 b)$ oz of milk and
$(1/3 a + 2/3 b)$ oz of water. This corresponds to the action of a
Markov chain with the transition matrix
$P = \mat{ 2/3 & 1/3 \\ 1/3 & 2/3 }$. We get the required amounts by
computing $$\begin{aligned}
    (12,0) P^2 = (12,0) \mat{ 5/9 & 4/9 \\ 4/9 & 5/9} = (20/3, 16/3).\end{aligned}$$
</div>

<!--
  manual-multi-step
  ------------------------------------------------
-->
<div class="problem">

The state space of a Markov chain is $S = \set{1,2,3,4,5}$, and the
non-zero transition probabilities are given by $p_{11} = 1/2$,
$p_{12}=1/2$, $p_{23}=p_{34}=p_{45}=p_{51}=1$. Compute
$p^{(6)}_{12}$ without using software.
</div>
<div class="solution">

As you can see from the transition graph below

<img src="_main_files/figure-html/unnamed-chunk-317-1.png" width="672" style="margin-top:-5%; margin-bottom: -10%" style="display: block; margin: auto;" />


You can go from $1$ to $2$ in $6$ steps in
exactly two ways: $$1 \to 2 \to 3 \to 4 \to 5 \to 1 \to 2$$ and
$$1 \to 1 \to 1 \to 1 \to 1 \to 1 \to 2$$ 
The probability of the first
path is $2^{-2}$ and the probability of the second path is $2^{-6}$ -
they add up to $\tfrac{17}{64}$.
</div>



<!--
  gambler-multi-step
  ------------------------------------------------
-->
<div class="problem">

In a *Gambler's ruin* problem with the state space $S=\set{0,1,2,3,4}$
and the probability $p=1/3$ of winning in a single game, compute the $4$-step
transition probabilities 
$$p^{(4)}_{2 2} = \PP[ X_{n+4}=2| X_n =2] \text{ and } p^{(4)}_{2 4} = \PP[ X_{n+4}=4| X_n =2].$$
</div>
<div class="solution">

There are four $4$-step trajectories that
start in $2$ and end in $2$, with positive probabilities (remember, once
you hit $0$ or $4$ you get stuck there), namely $$\begin{aligned}
    & 2 \to 1 \to 2 \to 1 \to 2, \quad 
    2 \to 1 \to 2 \to 3 \to 2, \quad  \\
    & 2 \to 3 \to 2 \to 1 \to 2, \quad
    2 \to 3 \to 2 \to 3 \to 2.\end{aligned}$$ Each has probability
$(1/3)\times(2/3)\times(1/3)\times(2/3) = 4/81$ so the total probability
is $16/81$.

The (possible) trajectories that go from $2$ to $4$ in exactly 4 steps
are $$\begin{aligned}
    2 \to 1 \to 2 \to 3 \to 4, \quad 
    2 \to 3 \to 2 \to 3 \to 4\   \eand \
    2 \to 3 \to 4 \to 4 \to 4.\end{aligned}$$ The first two have the
same probability, namely
$(2/3)\times(1/3)\times(2/3)\times(2/3) = 8/81$, and the third one
$(1/3)\times(2/3)\times(1)\times(1) = 18/81$ so $p^{(4)}_{24} =
26/81$.
</div>


<!--
  car-insurance
  ------------------------------------------------
-->
<div class="problem">

A car-insurance company classifies drivers in three categories: *bad*,
*neutral* and *good*. The reclassification is done in January of each
year and the probabilities for transitions between different categories
is given by
$$P= \mat{ 1/2 & 1/2 & 0 \\ 1/5 & 2/5 & 2/5 \\ 1/5 & 1/5 & 3/5},$$ where
the first row/column corresponds to the *bad* category, the second to
*neutral* and the third to *good*. The company started in January 1990
with 1400 drivers in each category. Estimate the number of drivers in
each category in 2090. Assume that the total number of drivers does not
change in time and use R for your computations.
</div>
<div class="solution">

Equal numbers of drivers in each category corresponds to the uniform
initial distribution, $a^{(0)}=(1/3,1/3,1/3)$. The
distribution of drivers in 2090 is given by the distribution 
$a^{(100)}$ of $X_{100}$ which is, in turn, given by
$$a^{(100)}= a^{(0)} P^{100}.$$ Finally, we need to compute the *number* of drivers in 
each category, so we multiply the result by the total number of drivers, i.e., $3 \times 1400 = 4200$:

```r
P = matrix(
  c(1/2 , 1/2 , 0,  
    1/5 , 2/5 , 2/5 , 
    1/5 , 1/5 , 3/5), 
  byrow=T, ncol=3)

# a0 needs to be a row matrix 
a0 = matrix(c(1/3, 1/3, 1/3), nrow=1) 

P100 = diag(3) # the 3x3 identity matrix
for (i in 1:100)
  P100 = P100 %*% P

(a0 %*% P100) * 4200
##      [,1] [,2] [,3]
## [1,] 1200 1500 1500
```

Note: if you think that computing matrix powers using for loops is in poor taste, there are several R packages you can use. Have a look at [this post](https://stats.stackexchange.com/questions/4320/compute-the-power-of-a-matrix-in-r/187477) if you are curious. 
</div>

<!--
  basil
  ------------------------------------------------
-->
<div class="problem">

A zoologist, Dr. Gurkensaft,
claims to have trained Basil the Rat so that it can avoid being shocked
and find food, even in highly confusing situations. Another scientist,
Dr. Hasenpfeffer does not agree. She says that Basil is stupid and
cannot tell the difference between food and an electrical shocker until
it gets very close to either of them.

The two decide to see who is right by performing the following
experiment. Basil is put in the compartment $3$ of a maze that looks
like this: 

<center>
<img src="./pics/basil-the-rat.png" width="40%" style="display: block; margin: auto;" />

</center>

Dr. Gurkensaft's hypothesis is that, once in a compartment with $k$ exits, Basil
will prefer the exits that lead him closer to the food. Dr. Hasenpfeffer's claim
is that every time there are $k$ exits from a compartment, Basil chooses each
one with probability $1/k$.

After repeating the experiment 100 times, Basil got shocked before getting to
food $52$ times and he reached food before being shocked $48$ times.

1. Create an Markov chain that models this situation (draw a transition graph and mark the edges with their probabilities).

2. Use Monte Carlo to estimate the probability of being 
shocked before
getting to food, under the assumption that Basil is stupid
(all exits are equally likely).


Btw, who do you think is right? Whose side is the evidence (48 vs. 52) on? If you know how to perform an appropriate statistical test here, do it. If you don't simply state what you think.
</div>
<div class="solution">

<part> 1. </part>
Basil's behavior can be modeled by a Markov Chain with states 
corresponding to  compartments, and transitions to their adjacency.
The graph of such a chain, on the state space $S=\{1,2,3,4,5,F,S\}$ 
would look like this (with black = $1$, orange = $1/2$ and green=$1/3$)

<center>

<img src="_main_files/figure-html/unnamed-chunk-320-1.png" width="672" style="margin-top:-10%; margin-bottom: -15%" style="display: block; margin: auto;" />

 </center>

<part> 2. </part>
To be able to do Monte Carlo, we need to construct its transition
matrix. Since there are far fewer transitions than pairs of states, it is a good idea to start with a matrix of $0$s and then fill in the non-zero values. We also decide that $F$ and $S$ will be given the last two rows/columns, i.e., numbers $6$ and $7$:


```r
P = matrix(0,nrow =7, ncol=7 )
P[1,2] = 1/2; P[1,3] = 1/2;
P[2,1] = 1/3; P[2,4] = 1/3; P[2,6] = 1/3;
P[3,1] = 1/3; P[3,4] = 1/3; P[3,7] = 1/3;
P[4,2] = 1/3; P[4,3] = 1/3; P[4,5] = 1/3;
P[5,4] = 1/2; P[5,6] = 1/2;
P[6,6] = 1
P[7,7] = 1
```

We continue by simulating `nsim = 1000` trajectories of this chain, starting from the state $3$. We compress and reuse the code from section \@ref(mc-sim) above:


```r
set.seed(1000)
T = 100  # number of time periods
nsim = 1000  # number of simulations
single_trajectory = function(i) {
    path = numeric(T)
    last = i
    for (n in 1:T) {
        path[n] = sample(1:7, prob = P[last, ], size = 1)
        last = path[n]
    }
    return(path)
}
df = data.frame(X0 = 3, t(replicate(nsim, single_trajectory(3))))

(p_shocked = mean(df$X100 == 7))
## [1] 0.581
```

So, the probability of being shocked first is about $0.58$. To be honest, what we computed up here is not $\PP[X_{\tau_{S,F}} = S]$, as the problem required, but the probability $\PP[ X_{100} = S]$. In general, these are not the same, but because both $S$ and $F$ are absorbing states, the events $X_{100}=S$ and $X_{\tau_{S,F}} = S$ differ only on the event where $\tau_{F,S}>100$, i.e., when Basil has not been either shocked or fed after $100$ steps. 

To see what kind of an error we are making, we can examine the empirical distribution of $X_{100}$   across our $1000$ samples:


```r
table(df$X100)
## 
##   6   7 
## 419 581
```

and conclude that, on this particular set of simulations, $\tau_{S,F}\leq 100$, so no error has been made at all. In general, approximations like this are very useful in cases where we can expect the probability of non-absorption within a given time interval to be negligible. On the other hand, if you examine a typical trajectory of `df`, you will see that most of the time it takes the value $6$ of $7$, so a lot of the computational effort goes to waste. But don't worry about such things in this course. 


<br>

So, is this enough evidence to conclude that Basil is, in fact, a smart rat? On one hand, 
the obtained probability $0.58$ is somewhat higher than Basil's observed shock rate of
$52\%$, but it is not clear just from those numbers are not due to
simple luck of the draw, and not Basil's alleged intelligence. It is hard to tell 
without doing any further statistical analysis.

For those of you who know a bit of statistics: one can apply the
  binomial test (or, more precisely,  its large-sample
  approximation) to test against the null hypothesis that Basil is
  stupid. Under the null, the number of times Basil will get shocked
  in 100 experiments is binomial, with parameters $n=100$ and
  $p=0.581$. Its normal approximation is
  $N(np, \sqrt{np(1-p)}) = N(58.1, 4.934)$, so the $z$-score of the observed value, i.e., $52$,
  is $z = \tfrac{ 52 - 58.1}{ 4.934}  = -1.236$. 
  The standard normal CDF at $z=-1.236$ is about $0.11$, i.e., the
  $p$-value is about $0.11$. That means
  that a truly stupid rat would appear at least as smart
  as Basil in about $11\%$ of experiments identical to the one described
  above by chance alone. 
  This kind of evidence is usually not considered sufficient to
make a robust conclusion about Basil's intelligence.
</div>


<!--
  professor
  ------------------------------------------------
-->
<div class="problem">

A math professor has $4$ umbrellas. He keeps some of them at home and some in
the office. Every morning, when he leaves home, he checks the weather and takes
an umbrella with him if it rains. In case all the umbrellas are in the office,
he gets wet. The same procedure is repeated in the afternoon when he leaves the
office to go home. The professor lives in a tropical region, so the chance of
rain in the afternoon is higher than in the morning; it is $1/5$ in the
afternoon and $1/20$ in the morning. Whether it rains of not is independent of
whether it rained the last time he checked.

On day $0$, there are $2$ umbrellas at home, and $2$ in the office. 

1. Construct a  Markov chain that models the situation.

2. Use Monte Carlo to give an approximate answer the following questions:

    a. What is the expected number of trips the professor will manage before he gets wet?
    b. What is the probability that the first time he gets wet it is on his way     home from the office?
</div>
<!-- <div class="solution"> -->
<!-- ```{r child="problems/02_Basic_Chains/professor_sol.Rmd"} -->
<!-- ``` -->
<!-- </div> -->



<!--chapter:end:05-Markov-chains.Rmd-->



\usepackage{mydefs_long}
\newcommand{\PP}{{\mathbb{P}}}
\newcommand{\N}{{\mathbb{N}}}
\newcommand{\bZ}{{\mathbb{Z}}}
\newcommand{\R}{{\mathbb{R}}}

\newcommand{\sS}{{\mathcal{S}}}
\newcommand{\EE}{{\mathbb{E}}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}
\newcommand{\corr}{\operatorname{corr}}
\newcommand{\Id}{\operatorname{Id}}

\newcommand{\ld}{\lambda}
\newcommand{\eand}{\text{ and }}
\newcommand{\efor}{\text{ for }}
\newcommand{\eforall}{\text{ forall }}

\newcommand{\tot}{\tfrac{1}{2}}
\newcommand{\seqz}[1]{\{#1_n\}_{n\in \N_0}}
\newcommand{\abs}[1]{|#1|}
\newcommand{\set}[1]{\{#1\}}
\newcommand{\tf}[2]{\frac{#1}{#2}}
\newcommand{\ot}{\frac{1}{2}}
\newcommand{\oo}[1]{\frac{1}{#1}}
\newcommand{\eps}{\varepsilon}
\newcommand{\inds}[1]{\mathbf{1}_{\{#1\}}}
\newcommand{\sets}[2]{ \{ #1\, : \, #2\}}
\newcommand{\ft}[2]{#1,\dots, #2}
\newcommand{\seq}[1]{\{#1_n\}_{n\in\N}}
\newcommand{\ewhere}{\text{ where }}

\renewcommand{\Pr}{{\mathbf P}}
\newcommand{\upn}[2]{#1^{(#2)}}
\newcommand{\Prup}[1]{\upn{\Pr}{#1}}
\newcommand{\Prz}{\Prup{0}}
\newcommand{\Pro}{\Prup{1}}
\newcommand{\Prn}{\Prup{n}}
\newcommand{\aaa}[1]{{a}^{(#1)}}
\renewcommand{\aa}[1]{{a}^{(#1)}}
\newcommand{\aaz}{\aaa{0}}
\newcommand{\az}{\aa{0}}
\renewcommand{\SS}{\sS}
\newcommand{\pnp}[1]{p^{(#1)}}
\newcommand{\pn}{\pnp{n}}
\newcommand{\tpnp}[1]{\tilde{p}^{(#1)}}
\newcommand{\tpn}{\tpnp{n}}
\newcommand{\fnf}[1]{f^{(#1)}}
\newcommand{\fn}{\fnf{n}}
\newcommand{\tofro}{\leftrightarrow}
\newcommand{\Vn}{V^{(n)}}

\newcommand{\mat}[1]{\begin{bmatrix}#1\end{bmatrix}}
          

# Classification of States
<div style="counter-reset: thechapter 6;"> </div>


There will be a lot of definitions and some theory before we get to
examples. You might want to peek ahead as notions are being introduced;
it will help your understanding.

## The Communication Relation

Let $\seqz{X}$ be a Markov chain on the state space $S$. For a given set
$B$ of states, define the **(first) hitting time $\tau_B$** (or $\tau(B)$ if subscripts are
impractical) **of the set $B$** as 
\begin{equation}
   \tau_B=\min\sets{n\in\N_0}{X_n\in B}.
\end{equation}
We know that $\tau_B$ is, in fact, a stopping time with
respect to $\seqz{X}$. When $B$ consists of only one element
, e.g. $B=\set{i}$, we simply write $\tau_{i}$ for $\tau_{\set{i}}$; $\tau_{i}$
is the first time the Markov chain $\seqz{X}$ "hits" the state $i$. As
always, we allow $\tau_{B}$ to take the value $\infty$; it means that
no state in $B$ is ever hit.

The hitting times are important both for applications, and for better
understanding of the structure of Markov chains in general.
For example, let $\seqz{X}$ be the chain which models a game of tennis (from the
previous lecture). The probability of winning for  Player 1 can be
phrased in terms of hitting times: $$\PP[ \text{Player 1 wins}]=\PP[ 
\tau_{i_{1}}<\tau_{i_{2}}],$$ where $i_{1}=$ "Player 1 wins" and $i_{2}=$"Player 2
wins" (the two absorbing states of the chain). We will learn how to
compute such probabilities in the subsequent lectures.


Having introduced the hitting times $\tau_B$, let us give a few more
definitions. It will be very convenient to consider the same Markov
chain with different initial distributions. Most often, these
distributions will correspond to starting from a fixed state (as opposed
to choosing the initial state at random). We use the notation $\PP_i[A]$
to mean $\PP[A|X_0=i]$ (for any event $A$), and $\EE_i[A]=\EE[A|X_0=i]$
(for any random variable $X$). In practice, we use $\PP_i$ and $\EE_i$
to signify that we are starting the chain from the state $i$, i.e.,
$\PP_i$ corresponds to a Markov chain whose transition matrix is the
same as the one of $\seqz{X}$, but the initial distribution is given by
$\PP_i[X_0=j]=0$ if $j\not = i$ and $\PP_i[X_0=i]=1$. Note also that
$\PP_i[X_1=j] = p_{ij}$ and that $\PP_i[X_n=j] =\pn_{ij}$, for any $n$.


A state $i\in S$ is said to **communicate** with the state $j\in S$,
denoted by $i\to j$ if $$\PP_i[\tau_{j}<\infty]>0.$$

Intuitively, $i$ communicates with $j$ if there is a non-zero chance
that the Markov chain $X$ will eventually visit $j$ if it starts from
$i$. Sometimes we also say that $j$ is **a consequent of** $i$, that $j$
**is accessible from** $i$, or that $j$ **follows** $i$.

In the "tennis" example of the previous chapter, 
every state is accessible from $(0,0)$ (the fact
that $p\in (0,1)$ is important here), but $(0,0)$ is not accessible from
any other state. The consequents of $(0,0)$ are not only $(15,0)$ and
$(0,15)$, but also $(30,15)$ or $(40,40)$. In fact, all states 
are consequents of $(0,0)$. The consequents of $(40,40)$ are $(40,40)$ itself, $(40,Adv)$,
$(Adv, 40)$, "P1 wins" and "P2 wins".

<div class="problem"> 
Explain why 
  $i \to j$ if and only if $\pn_{ij}>0$ for some $n\in\N_0$.
</div>
<div class="solution">
  Leaving a rigorous mathematical proof aside, we note that the statement
is intuitively easy to understand. If $i\to j$ then there must exist
some time $n$ such that $\PP_i[\tau_j = n]>0$. This, in turn, implies
that it is possible to go from $i$ to $j$ in exactly $n$ steps, where
"possible" means "with positive probability". In our notation, that is
exactly what $\pn_{ij}>0$ means.


Conversely, if $\pn_{ij}>0$ then
$\PP_i[ \tau_j <\infty] \geq \PP_i[\tau_j \leq n] \geq  \PP_i[ X_n = j]=\pn_{ij}>0.$
</div>

Two immediate properties of the relation $\to$ are listed in the problem below:

<div class="problem">
Explain why the following statements are true for all states $i,j,k$ of a Markov chain. 

1.  $i\to i$,

2.  $i\to j, j\to k$ implies $i \to k$.
</div>

<div class="solution">
  
1.  If we start from state $i\in S$ we are already there! More rigorously, note that $0$
    is allowed as a value for $\tau_{B}$ in its definition above, i.e., $\tau_i=0$ when $X_0=i$.

2.  Intuitively, if you can follow a path (sequence of arrows) from $i$ to $j$, and then another path $j$ to $k$, 
    you can do the same from $i$ to $k$ by concatenating two paths. More rigorously, by the previous problem, 
    it will be enough to show that $\pn_{ik}>0$ for some $n\in\N$. By the same
    Proposition, we know that $\pnp{n_1}_{ij}>0$ and $\pnp{n_2}_{jk}>0$
    for some $n_1,n_2\in\N_0$. By the Chapman-Kolmogorov relations, with
    $n=n_1+n_2$, we have
    \begin{equation}
      \pn_{ik} =\sum_{l\in S} \pnp{n_1}_{il} \pnp{n_2}_{lk}\geq  
      \pnp{n_1}_{ij} \pnp{n_2}_{jk}>0.
    \end{equation}
    Note that the inequality $\pn_{ik}\geq \pnp{n_1}_{il}\pnp{n_2}_{lk}$ is valid for
    all $i,l,k\in S$, as long as $n_1+n_2=n$. It will come in handy later.

</div>

Remember that the **greatest common divisor (gcd)** of a set $A$ of
natural numbers if the largest number $d\in\N$ such that $d$ divides
each $k\in A$, i.e., such that each $k\in A$ is of the form $k=l d$ for
some $l\in\N$.

A **period** $d(i)$ of a state $i\in S$ is the greatest common
divisor of the **return set** $$R(i)=\sets{n\in\N}{ \pn_{ii}>0}$$
of the state $i$. When $R(i)=\emptyset$, we set $d(i)=1$. A state
$i\in S$ is called **aperiodic** if $d(i)=1$.

<div class="problem">
  
Consider two  Markov chains with three states and the transition matrices
$$P_1=\begin{bmatrix}
 0 & 1 & 0 \\
 0 & 0 & 1 \\
 1 & 0 & 0 
\end{bmatrix}, \quad
P_2=\begin{bmatrix}
 0 & 1 & 0 \\
 0 & 0 & 1 \\
 \tfrac{1}{2} & 0 & \tfrac{1}{2} 
\end{bmatrix}$$


Find return sets and periods of each state $i$ of each chain.
</div>
<div class="solution">
For the first chain, with transition graph

<img src="_main_files/figure-html/unnamed-chunk-226-1.png" width="672" style="margin-top:-10%; margin-bottom: -10%" style="display: block; margin: auto;" />

the return set for each state $i\in\set{1,2,3}$ is
given by $R(i)= \set{3,6,9,12,\dots}$, so $d(i)=3$ for all
$i\in\set{1,2,3}$. 

Even though the transition graph of the second chain looks very similar to the first one

<img src="_main_files/figure-html/unnamed-chunk-227-1.png" width="672" style="margin-top:-10%; margin-bottom: -10%" style="display: block; margin: auto;" />


the situation changes drastically:
\begin{align}
  R(1) & =\{ 3,4,5,6, \dots \},\\
  R(2) & =\{ 2,3,4,5,6, \dots \},\\
  R(3) & =\{ 1,2,3,4,5,6, \dots \},
\end{align}
so that $d(i)=1$ for $i\in\set{1,2,3}$.
</div>

## Classes

We say that the states $i$ and $j$ in $S$ **intercommunicate**, denoted
by $i\tofro j$ if $i\to
  j$ *and* $j\to i$. A set $B\subseteq S$ of states is called
**irreducible** if $i\tofro j$ for all $i,j\in S$.

Unlike the relation of communication, the relation of intercommunication
is symmetric. Moreover, we have the following  immediate property:
the relation $\tofro$ is an *equivalence relation* on $S$, i.e., for all
$i,j,k\in S$, we have

1.  $i\tofro i$ (*reflexivity*) ,

2.  $i\tofro j$ implies $j\tofro i$ (*symmetry*), and

3.  $i\tofro j, j\tofro k$ implies $i\tofro k$ (*transitivity*).

The fact that $\tofro$ is an equivalence relation allows us to split the
state-space $S$ into equivalence classes with respect to $\tofro$. In
other words, we can write $$S=S_1\cup S_2\cup S_3\cup \dots,$$ where
$S_1, S_2, \dots$ are mutually exclusive (disjoint) and all states in a
particular $S_n$ intercommunicate, while no two states from different
equivalence classes $S_n$ and $S_m$ do. The sets $S_1, S_2, \dots$ are
called **classes** of the chain $\seqz{X}$. Equivalently, one can say
that classes are *maximal irreducible sets*, in the sense that they are
irreducible and no class is a subset of a (strictly larger) irreducible
set. A cookbook algorithm for class identification would involve the
following steps:

1.  Start from an arbitrary state (call it $1$).

2.  Identify *all* states $j$ that intercommunicate with it ($1$,
    itself, always does).

3.  That is your first class, call it $C_1$. If there are no elements
    left, then there is only one class $C_1=S$. If there is an element
    in $S\setminus C_1$, repeat the procedure above starting from that
    element.

The notion of a class is especially useful in relation to another
natural concept: A set $B\subseteq S$ of states is said to be **closed** if $i
  \not\to j$ for all $i\in B$ and all $j\in S\setminus B$. In words, $B$ is closed if it is
  impossible to get out of. A state
$i\in S$ such that the set $\set{i}$ is closed is called **absorbing**.

<div class="problem">
Show that a set $B$ of
states is closed if and only if $p_{ij}=0$ for all $i\in B$ and all
$j\in B^c=S\setminus B$.
</div> 
<div class="solution">
 Suppose, first, that $B$ is closed. Then for $i\in B$ and $j\in
  B^c$, we have $i\not\to j$, i.e., $\pn_{ij}=0$ for all $n\in\N$. In
particular, $p_{ij}=0$.

Conversely, suppose that $p_{ij}=0$ for all $i\in B$, $j\in B^c$. We
need to show that $k\not\to l$ (i.e. $\pn_{kl}=0$ for all $n\in\N$) for
all $k\in B$, $l\in B^c$. Suppose, to the contrary, that there exist
$k\in B$ and $l\in B^c$ such that $\pn_{kl}>0$ for some $n\in
\N$. That means that we can find a sequence of states
$$k=i_0, i_1, \dots, i_n=l \text{ such that } p_{i_{m-1} i_{m}}>0
\eforall m = \ft{1}{n}.$$ The first state, $k=i_0$ is in $B$ and the
last one, $l=i_n$, is in $B^c$. Therefore there must exist an index $m$
such that $i_{m-1}\in B$ but $i_{m}\in B^c$. We also know that
$p_{i_m i_{m+1}}>0$, which is in contradiction with out assumption that
$p_{ij}=0$ for all $i\in B$ and $j\in B^c$.
</div>

Intuitively, a set of states is closed if it has the property that the
chain $\seqz{X}$ stays in it forever, once it enters it. In general, if
$B$ is closed, it does not have to follow that $S\setminus B$ is closed.
Also, a class does not have to be closed, and a closed set does not have
to be a class. Here is an example -   consider
the following three sets of states in 
the *tennis* chain of the previous lecture and:

1.  $B=\set{\text{``P1 wins''}}$: closed and a class, but
    $S\setminus B$ is not closed

2.  $B=S\setminus \set{(0,0)}$: closed, but not a class, and

3.  $B=\set{(0,0)}$: class, but not closed.

Not everything is lost as the following relationship always holds:

<div class="problem">
  Show that every closed set $B$ is a union of one or more classes.
</div>
<div class="solution">
Let $\hat{B}$ be the union of all classes $C$ such that $C\cap
  B\not=\emptyset$. In other words, take all the elements of $B$ and
throw in all the states which intercommunicate with at least one of them. I claim that
$\hat{B}=B$. Clearly, $B\subset \hat{B}$, so we need to show that
$\hat{B}\subseteq B$. Suppose, to the contrary, that there exists
$j\in \hat{B}\setminus B$. By construction, $j$ intercommunicates with
some $i\in B$. In particular $i\to j$. By the closedness of $B$, we must
have $j\in B$. This is a contradiction with the assumptions that
$j\in \hat{B}\setminus B$.

Note that the converse is not true: ust take the set
$B=\set{ (0,0), (0,15)}$ in the "tennis" example. It is a union of two
classes, but it is not closed.
</div>  

  

## Transience and recurrence

It is often important to know whether a Markov chain will ever return to
its initial state, and if so, how often. The notions of transience and
recurrence are used to address this questions.

We start by introducing a cousin $T_j(1)$ of the first hitting time $\tau_1$. 
The **(first) visit time** to state $j$, denoted by $T_j(1)$ is defined
as $$T_j(1) = \min\sets{n\in\N}{X_n=j}.$$ As usual $T_j(1)=\infty$ if
$X_n\not = j$ for all $n\in\N$.
Similarly,  second, third, etc., visit times are defined as follows:
$$\begin{aligned}
  T_j(2) &= \min\sets{n>T_j(1)}{X_n=j}, \\
  T_j(3) &= \min\sets{n>T_j(2)}{X_n=j}, \text{ etc., }\end{aligned}$$
with the understanding that if $T_j(n)=\infty$, then also
$T_j(m)=\infty$ for all $m>n$.

Note that the definition of the random variable $T_j(1)$ differs from
the definition of $\tau_j$ in that the minimum here is taken over the
set $\N$ of natural numbers, while the set of non-negative integers
$\N_0$ is used for $\tau_j$. When $X_0\not = j$, the hitting time
$\tau_j$ and the first visit time $T_j(1)$ coincide. The important
difference occurs only when $X_0=j$. In that case $\tau_j=0$ (we are
already there), but it is always true that $T_j(1)\geq 1$. It can even
happen that $\PP_j[T_j(1)=\infty]=1$. If you want an example, take any state in the
deterministically monotone chain. 

A state $i\in S$ is said to be

1.  **recurrent** if $\PP_i[T_i(1)<\infty]=1$,

2.  **positive recurrent** if $\EE_i[T_i(1)]<\infty$

3.  **null recurrent** if it is recurrent, but not positive recurrent,

4.  **transient** if it is not recurrent.

A state is recurrent if we are sure we will come back to it eventually
(with probability 1). It is positive recurrent if it is recurrent and
the time between two consecutive visits has finite expectation. Null
recurrence means the we will return, but the waiting time may be very
long. A state is transient if there is a positive chance (however small)
that the chain will never return to it.

### The Return Theorem

The definition of recurrence from above is conceptually simple, but it
gives us no clue about how to actually go about deciding whether a
particular state in a specific Markov chain is recurrent. A criterion
stated entirely in terms of the transition matrix $P$ would be nice.
Before we give it, we need to introduce some notation. and prove an important theorem.
Given a state
$i$, let $f_i$ denote the probability that the chain will visit $i$
again, if it starts there, i.e., $$f_i = \PP_i[ T_i(1) < \infty].$$
Clearly, $i$ is recurrent if and only if $f_i=1$.

The interesting thing is that every time our chain visits the state $i$,
its future evolution is independent from the past (except for the name
of the current state) and it behaves exactly like a new and independent
chain started from $i$ would. This is a special case of so-called
**strong Markov property** which states that the (usual) Markov property
also holds at stopping times (and not only fixed times $n$). We will not
prove this property it these notes, but we will gladly use it to prove
the following dichotomy:

\BeginKnitrBlock{theorem}<div class="theorem"><span class="theorem" id="thm:unnamed-chunk-228"><strong>(\#thm:unnamed-chunk-228) </strong></span>(The "Return" Theorem)
Let
$\seqz{X}$ be a Markov chain on a countable state space $S$, with the
(deterministic) initial state $X_0=i$. Then exactly one of the following
two statements hold:

1.  either the chain will return to $i$ infinitely many times, or

2.  the chain will return to $i$ a finite number $N_i$ of times, where
    $N_i$ is geometrically distributed random variable with parameter $f_i$, where
    $f_i=\PP_i[T_i(1)<\infty]$.

In the first case, $i$ is recurrent and, in the second, it is transient.</div>\EndKnitrBlock{theorem}

\medskip

\BeginKnitrBlock{proof}<div class="proof">\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}If $f_i=1$, then $X$ is guaranteed to return to $i$ at least once. When
that happens, however, the strong Markov property "deletes" the past,
and the process "renews" itself. This puts us back in the original
situation where we are looking at a chain which starts at $i$ and is
guaranteed to return there at least once. Continuing like that, we get a
whole infinite sequence of stopping times $$T_i(1) < T_i(2) < \dots$$ at
which $X$ finds itself at $i$.

\medskip
If $f_i<1$, a similar story can be told, but with a significant
difference. Every time $X$ returns to $i$, there is a probability
$1-f_i$ that it will never come back to $i$, and, this is independent of
the past behavior. If we think of the return to $i$ as a success, the
number of successes before the first failure, i.e., the number of return
visits to $i$, is nothing but a geometrically distributed random
variable with parameter $f_i$. Q.E.D.</div>\EndKnitrBlock{proof}
  
<br>

The following interesting fact follows (almost) directly from the Return Theorem:

<div class="problem">
Suppose that the state space $S$ is finite. Show that there exists at least
one recurrent state.
</div>

<div class="solution">
We argue by contradiction and assume that all the states are transient. 
We claim that, in that case,  the total number of visits $N_i$ to each
state $i$ is always finite, no matter what state $i_0$  we start from. 
Indeed, if $i=i_0$ that is precisely the
conclusion the Return Theorem above. For a state $i\ne i_0$, the number of
visits is either $0$ - if we never even get to $i$, or $1+N_{i}$ if we
do. In either case, it is a finite number (not $\infty$).

Therefore the sum $\sum_{i\in S} N_i$ is also finite - a contradiction
with the fact that there are infinitely many time instances $n\in\N_0$,
and that the chain must be in some state in each one of them.
</div>

If $S$ is not finite, it is not true that recurrent states must exist.
Just think of  the Deterministically-Monotone Chain or
the random walk with $p\not=\tot$. All states are transitive there.

### A recurrence criterion

Perhaps the most important consequence of the Return Theorem is the following 
criterion for recurrence of Markov chains on finite or countable state spaces:

\BeginKnitrBlock{theorem}<div class="theorem"><span class="theorem" id="thm:unnamed-chunk-230"><strong>(\#thm:unnamed-chunk-230) </strong></span>(The Recurrence Criterion)
A state $i\in S$
is recurrent if and only if $$\sum_{n\in\N} \pn_{ii}=\infty.$$</div>\EndKnitrBlock{theorem}

\BeginKnitrBlock{proof}<div class="proof">\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}Let $N_i$ denote the total number (finite or $\infty$) of visits to the state $i$, with the initial visit at time $0$ not counted. 
We can write $N_i$ as an infinite sum as follows
$$N_i = \sum_{n=1}^{\infty} \inds{X_n = i}.$$ 
  Taking the
expectation yields
$$\EE[N_i] = \EE_i[ \sum_{n=1}^{\infty} \inds{X_n=i}] = \sum_{n=1}^{\infty} \EE_i[ \inds{X_n=i}] = \sum_{n=1}^{\infty} \PP_i[
 X_n=i] = \sum_{n=1}^{\infty} p^{(n)}_{ii},$$ where we used the intuitively acceptable (but not rigorously proven)
fact that $\EE_i$ and an *infinite* sum can be switched.  

If $i$ is transient, i.e., if
$f_i<1$, the Return Theorem and the formula for the expected value of a geometric distribution imply that 
$$\EE_i[N_i] = \tf{f_i}{1-f_i}<\infty, \text{ and so }
 \sum_{n=1}^{\infty} p^{(n)}_{ii} = \EE_i[N_i]<\infty.$$ On the other
hand, if $i$ is recurrent, the Return Theorem states that $N_i=\infty$.  Hence,
$$\sum_{n=1}^{\infty} p^{(n)}_{ii}=\EE_i[N_i]=\infty. \text{ Q.E.D. }$$</div>\EndKnitrBlock{proof}

*Remark.* The central idea behind the proof of the recurrence criterion is the following: we managed tell 
whether or not $N_i = \infty$ by checking whether $\EE[N_i]=\infty$ or not. 
This is, however, not something that can be done for any old random  variable taking values in $\N_0 \cup \set{\infty}$.
If $\EE[N]<\infty$, then, clearly $\PP[N=\infty]=0$ so that $N$ only
takes values in $\N_0$. On the other hand, it is not true that
$\PP[N=\infty]=0$ implies that $\EE[N]<\infty$. It suffices to take a
random variable with the following distribution
$$\PP[ N = n] = c/n^2 \efor n\in\N,$$ where the constant $c$ is chosen
so that $\sum_n c/n^2 =1$ (in fact, we can compute that $c=6/\pi^2$
explicitly in this case). The expected value of $N$ is given by
$$\EE[N] = \sum_{n=1}^{\infty} n \PP[N=n] = c \sum_{n=1}^{\infty} \oo{n}
  = \infty.$$ The message is that, in general, you cannot detect
whether something happened infinitely many times or not based only on
its expectation. 

Such a detection, however, becomes possible in the
special case when $N=N_i$ denotes the total number of returns to the
state $i$ of a Markov chain. This is exactly the content of proof of
the Return Theorem above: each time the chain leaves $i$, it
comes back to it (or does not) with the same probability, independently
of the past. This gives us extra information about the random variable
$N$ (namely that it is either infinite with probability $1$ or
geometrically distributed) and allows us to test its finiteness by using
the expected value only.

### Polya's theorem
Here is an application of our recurrence criterion - a beautiful and
unexpected result of George Pólya from 1921.

In addition to the simple symmetric random walk on the line ($d=1$) we
studied before, one can consider random walks whose values are in the
plane ($d=2$), the space ($d=3$), etc. These are usually defined as
follows: the random walk in $d$ dimensions is the Markov chain with the
state space $S=\bZ^d$ and the following transitions:  
starting from the state $(x_1,\dots, x_d)$, it
picks one of its $2d$ neighbors $(x_1+1,\dots, x_d)$,
$(x_1-1,\dots, x_d)$, $(x_1, x_2+1,\dots, x_d)$,
$(x_1, x_2-1,\dots, x_d)$, ..., $(x_1,\dots,
x_d+1)$, $(x_1,\dots, x_d-1)$ randomly and uniformly and moves there. For 
illustration, here is a picture of a path of a two-dimensional random walk; as time progresses, the color of the edges goes from black to orange, edges traversed
multiple times are darker, dots mark the position of the walk at time $n=0$ (the black round dot) and at time $n=1000$ (orange square dot):

<center>

<img src="_main_files/figure-html/unnamed-chunk-232-1.png" width="130%" style="display: block; margin: auto;" />
</center>

Polya's (and our) goal was to study the  recurrence properties of the
$d$-dimensional random walk. We already
know that the simple symmetric random walk on $\bZ$ is recurrent (i.e.,
every $i\in \bZ$ is a recurrent state). The easiest way to proceed when
$d\geq 2$ is to use the recurrence criterion we proved above.
We start by estimating the values $\pn_{ii}$, for
$n\in\N$. By symmetry, we can focus on the origin, i.e., it is enough to
estimate, for each $n\in\N$, the magnitude of 
$$\pn = \pn_{00}= \PP_{0}[ X_n=(0,0,\dots, 0)].$$ As we learned some time ago, 
this probability can be computed by counting all "trajectories" from $(0,\dots, 0)$ 
that return to $(0,\dots, 0)$ in $n$ steps. First of all, it is clear that $n$ needs to
be even, i.e., $n=2m$, for some $m\in\N$. It helps if we think of any
trajectory as a sequence of "increments" $\xi_1,\dots, \xi_n$, where
each $\xi_i$ takes its value in the set $\set{1,-1,2,-2,\dots, d, -d}$.
In words, $\xi_i= +k$ if the $k$-th coordinate increases by $1$ on the
$i$-th step, and $\xi_i=-k$, if the $k$-th coordinate decreases^[For $d=2$ we could have used the values "up", "down", "left" and
    "'right", for $1,-1,2$ or $-2$, respectively. In dimension $3$, we
    could have added "forward" and "backward", but we run out of words
    for directions for larger $d$.]

This way, the problem becomes combinatorial:

*In how many ways can we put one element of the set
$\set{1,-1,2,-2, \dots, d,-d}$ into each of $n=2m$ boxes so that the
number of boxes with $k$ in them equals to the number of boxes with $-k$
in them?*

To get the answer, we start by fixing a possible "count" $(i_1,\dots,
        i_d)$, satisfying $i_1+\dots+i_d=m$ of the number of times each
of the values in $\set{1,2,\dots, d}$ occurs. These values have to be
placed in $m$ of the $2m$ slots and their negatives (possibly in a
different order) in the remaining $m$ slots. So, first, we choose the
"positive" slots (in $\binom{2m}{m}$ ways), and then distribute $i_1$
"ones", $i_2$ "twos", etc., in those slots; this can be done in^[ $\binom{m}{i_1
            \dots i_d}$ is called the *multinomial coefficient*. It
    counts the number of ways we can color $m$ objects into one of $d$
    colors such that there are $i_1$ objects of color $1$, $i_2$ of
    color $2$, etc. It is a generalization of the binomial coefficient
    and its value is given by
    $$\binom{ m }{ i_1 i_2 \dots i_d} = \frac{m!}{i_1! i_2!\dots
            i_d!}.$$]
$$\binom{ m }{ i_1 i_2 \dots i_d}$$ ways. This is also the number of
ways we can distribute the negative "ones", "twos", etc., in the
remaining slots. All in all, for fixed $i_1,i_2,\dots, i_d$, all of this
can be done in $$\binom{2m}{m} \binom{ m }{ i_1 i_2 \dots i_d}^2$$ ways.
Remembering that each path has the probability $(2d)^{-2m}$, and summing
over all $i_1,\dots, i_d$ with $i_1+\dots+i_d=m$, we get
\begin{equation}
  p^{(2m)} = \frac{1}{(2d)^{2m}} \binom{2m}{m} \sum_{i_1+\dots+i_d=m}
        \binom{ m }{ i_1 i_2 \dots i_d}^2.
(\#eq:p2m)
\end{equation}
This expression looks so complicated that we better start examining is for
particular values of $d$:

1. For $d=1$, the expression above simplifies to  $p^{(2m)} = \frac{1}{4^{m}} \binom{2m}{m}$. It is
still too complicated sum over all $m\in\N$, but we can simplify it
further by using Stirling's formula
$$n! \sim \sqrt{2\pi n} \big(\tfrac{n}{e}\big)^n,$$ where $a_n \sim b_n$
means $\lim_{n\to\infty} a_n/b_n=1$. Indeed, from there,
$$\label{equ:binom}
 \begin{split}
   \binom{2m}{m} \sim \frac{4^m}{ \sqrt{\pi m}},
 \end{split} \text{ and so } p^{(2m)} \sim  \frac{1}{\sqrt{m\pi}}.$$ That means that $p^{(m)}$ behaves
 li a $p$-series with $p=1/2$ which we know is divergent. Therefore, 
 $$\sum_{m=1}^{\infty} p^{(2m)} = \infty,$$
and we recover our previous conclusion that the simple symmetric random
walk is, indeed, recurrent.

2. Moving on to the case $d= 2$, we notice that the sum of the multinomial
coefficients in \@ref(eq:p2m) no longer equals $1$; in fact it is given 
by^[Why is this identity true? Can you give a counting argument?]
$$\label{equ:Van}
 \begin{split}
   \sum_{i=0}^{m} \binom{m}{i}^2 = \binom{2m}{m},
 \end{split}$$ and, so,
$$p^{(2m)} = \frac{1}{16^m} \Big( \frac{4^m}{\sqrt{\pi m}} \Big)^2 \sim
\frac{1}{\pi m}  \text{ implying that  } \sum_{m=1}^{\infty} p^{(2m)}=\infty,$$ which
which, in turn, implies that the two-dimensional random walk is also recurrent.

3. How about $d\geq 3$? Things are even more complicated now. The
multinomial sum  in \@ref(eq:p2m) above does not admit a nice closed-form expression as in
the case $d=2$, so
we need to do some estimates; these are a bit tedious so we skip them,
but report the punchline, which is that $$p^{(2m)} 
\sim C \Big(
\tfrac{3}{m} \Big)^{3/2},$$ for some constant $C$. This is where it gets
interesting: this is a $p$-series which **converges**:
$$\sum_{m=1}^{\infty} p^{(2m)}<\infty,$$ and, so, the random walk is
transient for $d=3$. This is enough to conclude that the random walk is
transient for all $d\geq 3$, too (why?).

To summarize  

\BeginKnitrBlock{theorem}<div class="theorem"><span class="theorem" id="thm:unnamed-chunk-233"><strong>(\#thm:unnamed-chunk-233) </strong></span>(Polya)
The simple symmetric random walk is recurrent for $d=1,2$, but transient
for $d\geq 3$.</div>\EndKnitrBlock{theorem}

<br> 
In the words of Shizuo Kakutani

> *A drunk man will find his way home, but a drunk bird may get lost
> forever.*

## Class properties

COMING SOON

## A few Examples

COMING SOON

## Additional problems for Chapter 6


qqq cl-stat-09
<!--
  cl-stat-09
  ------------------------------------------------
-->
<div class="problem">

Let $C_1$ and $C_2$ be two (different) classes. For each of the following statements either explain
why it is true, or give an example showing that it is false.

1.   $i\to j$ or $j\to i$, for all $i\in C_1$, and $j\in C_2$,

2.  $C_1\cup C_2$ is not a class,

3.   If $i\to j$ for some $i\in C_1$ and $j\in C_2$, then $k\not\to l$
    for all $k\in C_2$ and $l\in C_1$,

4.   If $i\to j$ for some $i\in C_1$ and $j\in C_2$, then $k\to l$ for
    some $k\in C_2$ and $l\in C_1$,
</div>
<!-- <div class="solution"> -->
<!-- ```{r child="problems/03_Classification_of_States/cl-stat-09_sol.Rmd"} -->
<!-- ``` -->
<!-- </div> -->



<!--
  cl-stat-02
  ------------------------------------------------
-->
<div class="problem">

Consider a Markov Chain whose transition graph is given below (with orange edges having probability $1/2$, black $1$, blue $3/4$ and green $1/4$)
<center>
<img src="_main_files/figure-html/unnamed-chunk-324-1.png" width="672" style="margin-top:-10%; margin-bottom: -20%" style="display: block; margin: auto;" />
 </center>
      
1.  Identify the classes.

2.  Find transient and recurrent states.

3.  Find periods of all states.
      
4.  Compute $\fn_{13}$, for all $n\in\N$, where
    $\fn_{ij} =\PP_i[T_j(1) = n]$.
      
5.  Using software,  we can get that, approximately, 
\[ P^{20}=\left[
\begin{array}{llllllll}
 0 & 0 & 0.15 & 0.14 & 0.07 & 0.14 & 0.21 & 0.29 \\
 0 & 0 & 0.13 & 0.15 & 0.07 & 0.15 & 0.21 & 0.29 \\
 0 & 0 & 0.3 & 0.27 & 0.15 & 0.28 & 0 & 0 \\
 0 & 0 & 0.27 & 0.3 & 0.13 & 0.29 & 0 & 0 \\
 0 & 0 & 0.29 & 0.28 & 0.15 & 0.28 & 0 & 0 \\
 0 & 0 & 0.28 & 0.29 & 0.14 & 0.29 & 0 & 0 \\
 0 & 0 & 0 & 0 & 0 & 0 & 0.43 & 0.57 \\
 0 & 0 & 0 & 0 & 0 & 0 & 0.43 & 0.57
\end{array}
\right],\]
where $P$ is the transition matrix of the chain.  Compute the
probability $\PP[X_{20}=3]$, if the initial distribution (the
distribution of $X_0$) is given by $\PP[X_0=1]=1/2$ and $\PP[X_0=3]=1/2$.
</div>
<!-- <div class="solution"> -->
<!-- ```{r child="problems/03_Classification_of_States/cl-stat-02_sol.Rmd"} -->
<!-- ``` -->
<!-- </div> -->


<!--
  cl-stat-04
  ------------------------------------------------
-->
<div class="problem">

A fair 6-sided die is rolled repeatedly, and for $n\in\N$, the outcome
of the $n$-th roll is denoted by $Y_n$ (it is assumed that $\seq{Y}$ are
independent of each other). For $n\in\N_0$, let $X_n$ be the remainder
(taken in the set $\set{0,1,2,3,4}$) left after the sum
$\sum_{k=1}^n Y_k$ is divided by $5$, i.e. $X_0=0$, and $$%\label{}
    \nonumber 
    \begin{split}
X_n= \sum_{k=1}^n Y_k \ (\,\mathrm{mod}\, 5\,),\text{ for } n\in\N, 
    \end{split}$$ making $\seqz{X}$ a Markov chain on the state space
$\set{0,1,2,3,4}$ (no need to prove this fact).

Write down the transition matrix of the chain, classify the states,
separate recurrent from transient ones, and compute the period of each
state.
</div>
<div class="solution">

The outcomes $1,2,3,4,5,6$ leave remainders $1,2,3,4,0,1$, when divided
by $5$, so the transition matrix $P$ of the chain is given by
$$P=\begin{bmatrix}
  \tfrac{1}{6} &   \tfrac{1}{3} &   \tfrac{1}{6} &   \tfrac{1}{6} &   \tfrac{1}{6} \\
  \tfrac{1}{6} &   \tfrac{1}{6} &   \tfrac{1}{3} &   \tfrac{1}{6} &   \tfrac{1}{6} \\
  \tfrac{1}{6} &   \tfrac{1}{6} &   \tfrac{1}{6} &   \tfrac{1}{3} &   \tfrac{1}{6} \\
  \tfrac{1}{6} &   \tfrac{1}{6} &   \tfrac{1}{6} &   \tfrac{1}{6} &   \tfrac{1}{3} \\
  \tfrac{1}{3} &   \tfrac{1}{6} &   \tfrac{1}{6} &   \tfrac{1}{6} &   \tfrac{1}{6} \\
\end{bmatrix}$$ Since $p_{ij}>0$ for all $i,j\in S$, all the states
belong to the same class, and, because there is at least one recurrent
state in a finite-state-space Markov chain and because recurrence is a
class property, all states are recurrent. Finally, $1$ is in the return
set of every state, so the period of each state is $1$.
</div>


<!--
  cl-stat-06
  ------------------------------------------------
-->
<div class="problem">

Which of the following
statements is true? Give a short explanation (or a counterexample where
appropriate) for your choice. $\seqz{X}$ is a Markov chain with state
space $S$.

1.  If states $i$ and $j$ intercommunicate, then there exists $n\in\N$
    such that $\pn_{ij}>0$ and $\pn_{ji}>0$.

2.  If all rows of the transition matrix are equal, then all states
    belong to the same class.

3.  If $P^n\to I$, then all states are recurrent. (*Note:* We say that a
    sequence $\seq{A}$ of matrices converges to the matrix $A$, and we
    denote it by $A_n\to A$, if $(A_n)_{ij}\to A_{ij}$, as $n\to\infty$,
    for all $i,j$.)
</div>
<div class="solution">

1.  **FALSE**. Consider a Markov chain with the transition matrix
\begin{equation}
    P = \begin{bmatrix}
    0 & 1 & 0 \\
    0 & 0 & 1 \\
    1 & 0 & 0
    \end{bmatrix}
\end{equation}
    All states intercommunicate, but $\pn_{12}>0$ if and
    only if $n$ is of the form $n=3k+1$, for $k\in\N_0$. On the other hand
    $\pn_{21}>0$ if and only if $n=3k+2$ , for some $k\in\N_0$. Thus,
    $\pn_{12}$ and $\pn_{21}$ are never simultaneously positive.

2.  **FALSE**. Consider a Markov chain with the following transition
    matrix: $$P=
    \begin{bmatrix}
    1 & 0 \\ 1 & 0
    \end{bmatrix}.$$ Then $1$ is an absorbing state and it is in a class
    of its own, so it is not true that all states belong to the same
    class.

3.  **TRUE.** Suppose that there exists a transient state $i\in S$. Then
    $\sum_{n} \pn_{ii}<\infty$, and, in particular, $\pn_{ii}\to 0$, as
    $n\to\infty$. This is a contradiction with the assumption that
    $\pn_{ii}\to 1$, for all $i\in S$.
</div>

qqq cl-stat-07
<!--
  cl-stat-07
  ------------------------------------------------
-->
<div class="problem">

Let $C$ be a class in a
Markov chain. For each of the following statements either explain why it
is true, or give an example showing that it is false.

1.  $C$ is closed,

2.  $C^c$ is closed,

3.  At least one state in $C$ is recurrent,

4.  For all states $i,j\in C$, $p_{ij}>0$,
</div>
<div class="solution">

1.   False. Take $C=\set{(0,0)}$ in the "Tennis example".

2.   False. Take $C=\set{\text{Player 1 wins}}$ in the "Tennis example".

3.   False. It is enough to take any transient class in a finite-state
    Markov chain as a counterexample. For instance, the class
    $\set{ (0,0) }$ consisting of a single element $(0,0)$ in the Tennis
    chain.

4.   False. This would be true if it read "for each pair of states
    $i,j\in C$, *there exists* $n\in\N$ such that $\pn_{ij}>0$".
    Otherwise, we can use the "Tennis chain" and the states $i=(40,Adv)$
    and $j=(Adv,40)$. They belong to the same class, but $p_{ij}=0$ (you
    need to pass through $(40,40)$ to go from one to another).
</div>

qqq cl-stat-08
<!--
  cl-stat-08
  ------------------------------------------------
-->
<div class="problem">

Consider a Markov chain whose
state space has $n$ elements ($n\in\N$). For each of the following
statements either explain why it is true, or give an example showing
that it is false.

1.   all classes are closed

2.  at least one state is transient,

3.   not more than half of all states are transient,

4.  there are at most $n$ classes,
</div>
<div class="solution">

-   False. In the "Tennis" example, there are classes that are not
    closed.

-   False. Just take the Regime Switching with $0<p_{01},
    p_{10} <1$. Both of the states are recurrent there. Or, simply take
    a Markov chain with only one state ($n=1$).

-   False. In the "Tennis" example, 18 states are transient, but $n=20$.

-   True. Classes form a partition of the state space, and each class
    has at least one element. Therefore, there are at most $n$ classes.
</div>


qqq cl-stat-10
<!--
  cl-stat-10
  ------------------------------------------------
-->
<div class="problem">

Let $i$ be a recurrent state
with period 5, and let $j$ be another state. For each of the following
statements either explain why it is true, or give an example showing
that it is false.

1.   if $j\to i$, then $j$ is recurrent,

2.   if $j\to i$, then $j$ has period $5$,

3.   if $i\to j$, then $j$ has period $5$,

4.   if $j\not\to i$ then $j$ is transient,
</div>
<div class="solution">

We will use the following chain for all the counterexamples (green edges have probability $1/2$ and black edges $1$)
<center>
<img src="_main_files/figure-html/unnamed-chunk-325-1.png" width="672" style="margin-top:-15%; margin-bottom: -15%" style="display: block; margin: auto;" />
 </center>


1.  False. Take $j=0$ and $i=1$ in the chain in the picture.

2.   False. Take the same counterexample as above.

3.   True. We know that $i$ is recurrent, and since all recurrent classes
    are closed, and $i\to j$, $h$ must belong to the same class as $i$.
    Period is a class property, so the period of $j$ is also $5$.

4.   False. Take $j=6$, $i=0$ in the chain in the picture.
</div>


 <!--
  cl-stat-11
  ------------------------------------------------
-->
<div class="problem">

Let $i$ and $j$ be two states
such that $i$ is transient and $i\tofro j$. For each of the following
statements either explain why it is true, or give an example showing
that it is false.

1.   if $i\to k$, then $k$ is transient,

2.   if $k\to i$, then $k$ is transient,

3.   period of $i$ must be $1$,

4.   (extra credit) $\sum_{n=1}^{\infty} \pn_{jj} = \sum_{n=1}^{\infty} \pn_{ii}$,

</div>
<!-- <div class="solution"> -->
<!-- ```{r child="problems/03_Classification_of_States/cl-stat-11_sol.Rmd"} -->
<!-- ``` -->
<!-- </div> -->

qqq cl-stat-12
<!--
  cl-stat-12
  ------------------------------------------------
-->
<div class="problem">

Suppose there exists $n\in\N$
such that $P^n=I$, where $I$ is the identity matrix and $P$ is the
transition matrix of a finite-state-space Markov chain. For each of the
following statements either explain why it is true, or give an example
showing that it is false.

1.   $P=I$.

2.   All states belong to the same class.

3.   All states are recurrent.

4.   The period of each state is $n$.
</div>
<div class="solution">

1.  False. Take the Regime-switching chain with $$P=
    \begin{bmatrix}
    0 & 1 \\ 1 & 0
    \end{bmatrix}$$ Then $P^2=I$, but $P\not= I$.

2.   False. If $P=I$, all states are absorbing, and, therefore, each is
    in a class of its own.

3.   True. By the assumption $P^{kn}=(P^n)^k=I^k=I$, for all $k\in\N$.
    Therefore, $\pnp{kn}_{ii}=1$ for all $k\in\N$, and so
    $\lim_{m\to\infty} \pnp{m}_{ii}\not= 0$ (maybe it doesn't even
    exist). In any case, the series $\sum_{m=1}^{\infty} \pnp{m}_{ii}$
    cannot be convergent, and so, $i$ is recurrent, for all $i\in S$.
    Alternatively, the condition $P^n=I$ means that the chain will be
    coming back to where it started - with certainty - every $n$ steps,
    and so, all states must be recurrent.

4.   False. Any chain satisfying $P^n=I$, but with the property that the
    $n$ above is not unique is a counterexample. For example, if $P=I$,
    then $P^n=I$ for any $n\in\N$.
</div>

qqq cl-stat-13
<!--
  cl-stat-13
  ------------------------------------------------
-->
<div class="problem">

Let $i$ be a recurrent state
with period 3, and let $j$ be another state. For each of the following
statements either explain why it is true, or give an example showing
that it is false.

1. If $j\to i$, then $j$ is recurrent.

2. If $j\to i$, then $j$ has period $3$.

3. If $i\to j$, then $j$ has period $3$.

4. If $j\not\to i$ then $j$ is transient.
</div>
<div class="solution">

The only true statement is (c). Since $i$ is recurrent and $i\to j$, we
have $j\to i$, and so, $i$ and $j$ belong to the same class. Periodicity
is a class property so the period of $i$ and $j$ are the same, namely
$3$.
</div>

qqq cl-stat-14
<!--
  cl-stat-14
  ------------------------------------------------
-->
<div class="problem">

Let $C_1$ and $C_2$ be two
(different) communication classes of a Markov chain. Exactly one of the
statements below is necessarily true. Which one?

1. $i\to j$ or $j\to i$, for all $i\in C_1$, and $j\in C_2$

2. $C_1\cup C_2$ is a class

3. if $i\to j$ for some $i\in C_1$ and $j\in C_2$, then $k\not\to l$ for
    all $k\in C_2$ and $l\in C_1$

4. if $i\to j$ for some $i\in C_1$ and $j\in C_2$, then $k\to l$ for
    some $k\in C_2$ and $l\in C_1$,

5. Statements 1. - 4. are all false.
</div>
<div class="solution">

The correct statement is 3. Suppose that $i\to j$ and $k\to l$ for some
$k\in C_2$ and some $l\in C_1$. Since both $j$ and $k$ are in the same
class (and so are $i$ and $l$), we have $j\to k$ (and $l\to i$), and
then, by transitivity $$i \to j \to k \to l \to i$$ which implies that
$j\tofro k$. Therefore, $j$ and $k$ are in the same class, which is in
contradiction with the assumption that $C_1$ and $C_2$ are *different*
classes.
</div>

<!--
  four-stmts
  ------------------------------------------------
-->
<div class="problem">

Suppose that all classes of a Markov chain are recurrent, and let $i,j$
be two states such that $i\to j$. For each of the 4 statements before,
either explain why it is true, or give an example of a Markov chain in
which it fails.

a. for each state $k$, either $i\to k$ or $j\to k$

b. $j\to i$

c. $p_{ji}>0$ or $p_{ij}>0$

d. $\sum_{n=1}^{\infty} p^{(n)}_{jj}<\infty$
</div>
<div class="solution">

a. False. Take a chain with two states $1,2$ where $p_{11}=p_{22}=1$,
  and set $i=j=1$, $k=2$.

b. True. Recurrent classes are closed, so $i$ and $j$ belong to the same class. Therefore $j\to i$.

c. False. Take a chain with $4$ states $1,2,3,4$ where
  $p_{12}=p_{23}=p_{34}=p_{41}=1$, and set $i=1$, $j=3$.

d. False. That would mean that $j$ is transient.
</div>




⬇︎ In case you were wondering, the text below belongs to footnotes from somewhere high above.⬇︎




<!--chapter:end:06-Classification.Rmd-->


\newcommand{\PP}{{\mathbb{P}}}
\newcommand{\RR}{{\mathbb{R}}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\N}{{\mathbb{N}}}
\newcommand{\sS}{{\mathcal{S}}}
\newcommand{\EE}{{\mathbb{E}}}
\newcommand{\ld}{\lambda}
\newcommand{\eand}{\text{ and }}

# (APPENDIX) Appendix {-}

# Probability Distributions {#dist}

Here are the basic facts about the probability distributions we will need in these lecture notes. For a much longer list of important distributions, check  this [wikipedia page](https://en.wikipedia.org/wiki/List_of_probability_distributions). 


## Discrete distributions:

Note: $(q=1-p)$
<table>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;font-style: italic;">  </td>
   <td style="text-align:left;font-style: italic;"> Parameters </td>
   <td style="text-align:left;font-style: italic;"> Notation </td>
   <td style="text-align:left;font-style: italic;"> Support </td>
   <td style="text-align:left;font-style: italic;"> pmf </td>
   <td style="text-align:left;font-style: italic;"> $\EE[X]$ </td>
   <td style="text-align:left;font-style: italic;"> $\Var[X]$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> Bernoulli </td>
   <td style="text-align:left;"> $p\in (0,1)$ </td>
   <td style="text-align:left;"> $B(p)$ </td>
   <td style="text-align:left;"> $\{0,1\}$ </td>
   <td style="text-align:left;"> $(q,p,0,0,\dots)$ </td>
   <td style="text-align:left;"> $p$ </td>
   <td style="text-align:left;"> $pq$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> Binomial </td>
   <td style="text-align:left;"> $n\in\N , p\in (0,1)$ </td>
   <td style="text-align:left;"> $b(n,p)$ </td>
   <td style="text-align:left;"> $\{0,1,\dots, n\}$ </td>
   <td style="text-align:left;"> $\binom{n}{k} p^k q^{n-k}$ </td>
   <td style="text-align:left;"> $np$ </td>
   <td style="text-align:left;"> $npq$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> Geometric </td>
   <td style="text-align:left;"> $p\in (0,1)$ </td>
   <td style="text-align:left;"> $g(p)$ </td>
   <td style="text-align:left;"> $\{0,1,\dots\}$ </td>
   <td style="text-align:left;"> $p q^k$ </td>
   <td style="text-align:left;"> $q/p$ </td>
   <td style="text-align:left;"> $q/p^2$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> Poisson </td>
   <td style="text-align:left;"> $\lambda\in(0,\infty)$ </td>
   <td style="text-align:left;"> $P(\lambda)$ </td>
   <td style="text-align:left;"> $\{0,1,\dots\}$ </td>
   <td style="text-align:left;"> $e^{-\lambda} \tfrac{\lambda^k}{k!}$ </td>
   <td style="text-align:left;"> $\lambda$ </td>
   <td style="text-align:left;"> $\lambda$ </td>
  </tr>
</tbody>
</table>

## Continuous distributions:
Note: the pdf is given by the formula in the table only on its support. It is equal to $0$ outside of it. 
<table>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;font-style: italic;">  </td>
   <td style="text-align:left;font-style: italic;"> Parameters </td>
   <td style="text-align:left;font-style: italic;"> Notation </td>
   <td style="text-align:left;font-style: italic;"> Support </td>
   <td style="text-align:left;font-style: italic;"> pdf </td>
   <td style="text-align:left;font-style: italic;"> $\EE[X]$ </td>
   <td style="text-align:left;font-style: italic;"> $\Var[X]$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> Uniform </td>
   <td style="text-align:left;"> $a\lt b$ </td>
   <td style="text-align:left;"> $U(a,b)$ </td>
   <td style="text-align:left;"> $(a,b)$ </td>
   <td style="text-align:left;"> $\frac{1}{b-a}$ </td>
   <td style="text-align:left;"> $\frac{a+b}{2}$ </td>
   <td style="text-align:left;"> $\frac{(b-a)^2}{12}$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> Normal </td>
   <td style="text-align:left;"> $\mu\in{\mathbb R},\sigma \gt 0$ </td>
   <td style="text-align:left;"> $N(\mu,\sigma)$ </td>
   <td style="text-align:left;"> ${\mathbb R}$ </td>
   <td style="text-align:left;"> $\frac{1}{\sigma \sqrt{2\pi}} e^{-\tfrac{(x-\mu)^2}{2 \sigma^2}}$ </td>
   <td style="text-align:left;"> $\mu$ </td>
   <td style="text-align:left;"> $\sigma^2$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> Exponential </td>
   <td style="text-align:left;"> $\lambda\gt 0$ </td>
   <td style="text-align:left;"> $\operatorname{Exp}(\lambda)$ </td>
   <td style="text-align:left;"> $(0,\infty)$ </td>
   <td style="text-align:left;"> $\lambda e^{-\lambda x}$ </td>
   <td style="text-align:left;"> $\tfrac{1}{\lambda}$ </td>
   <td style="text-align:left;"> $\frac{1}{\lambda^2}$ </td>
  </tr>
</tbody>
</table>



<!-- \mypar{Discrete Random variables:} -->

<!--  \begin{description} -->
<!--  \item[pmf:] $p_X(x) = \PP[ X=x]$, for $x\in \sS_X$ (the support). -->
<!--  \item[expectation:] $\EE[X] = \sum_{x\in\sS_X} x\, p_X(x)$. -->
<!--  \item[variance:] $\Var[X] = \EE[ (X-\EE[X])^2] = \EE[X^2] - -->
<!--  \EE[X]^2$. -->
<!--  \item[expectation of a function:] if $\EE[g(X)]$ exists then -->
<!--    \[ \EE[ g(X)] = \tsum_{x\in \sS_X} g(x) p_X(x).\] -->
<!--  \item[expectation of a linear combination: ] \[ \EE[ \alpha X+\beta Y] = -->
<!--    \alpha \EE[X] + \beta \EE[Y].\] -->
<!--  \item[variance of a linear combination:] if $X,Y$ are independent, -->
<!--    \[ \Var[\alpha X+\beta Y] = \alpha^2 \Var[X] + \beta^2 \Var[Y].\] -->
<!--  \item[expectation of a product:] if $X,Y$ are independent and both -->
<!--    expectations $\EE[X]$ and $\EE[Y]$ exist: -->
<!--    \[ \EE[X Y] = \EE[X]\times \EE[Y].\] -->
<!--  \end{description} -->

<!--  \bigskip -->

<!-- \mypar{Random walks} -->
<!--  \begin{description} -->
<!--    \item[definition:] -->
<!--      $\seqk{\delta}$ are independent with\\ $\PP[ \delta_k = 1]=p$ and -->
<!--      $\PP[\delta_k=-1]=q:=1-p$, \\[1ex] -->
<!-- $X_0=0$,\  $X_n = \delta_1 + \delta_2 + \dots + \delta_n$, -->
<!--    \item[distribution:] $\PP[ X_n = k ] = -->
<!--      \binom{n}{\tf{n+k}{2}} p^{\tf{n+k}{2}} q^{\tf{n-k}{2}}$,\\ if $n$ and $k$ have -->
<!--      the same parity and $-n \leq k \leq n$. -->
<!--    \item[maximum:] $M_n = \max(X_0,X_1,\dots, X_n)$. If -->
<!--      $p=\tot$ then \\ -->
<!--      $\PP[ M_n = k] = \PP[ X_n=k] + \PP[ X_n = k+1]$. -->
<!--  \end{description} -->
<!-- \columnbreak -->
<!--    \mypar{Generating functions ($X$ must be $\Nz$-valued)} -->
<!--  \begin{description} -->
<!--    \item[definition:] $P_X(s) = \sum_{k=0}^{\infty} p_k s^k = \EE[ s^X]$. -->
<!--    \item[probabilities:] $p_k = \PP[X=k] = \oo{k!} P^{(k)}(0)$\\ (where -->
<!--      $P^{(k)}$ is the $k$-th derivative) -->
<!--    \item[moments:] -->
<!--      $\EE[X] = P_X'(1)$, \ $\EE[X(X-1)] = P_X''(1)$,\\[1ex] $\Var[X] = P_X''(1) -->
<!--      + P_X'(1) - (P'_X(1))^2$\\[1ex] -->
<!--      $\EE\left[ \prod_{k=0}^{n-1} (X-k)\right] = P_X^{(k)}(1)$. -->
<!--    \item[convolutions:] the convolution $r=p \ast q$ of $\seqkz{p}$ and $\seqkz{q}$ is -->
<!--      $r_n = \tsum_{k=0}^n p_k q_{n-k}, n\in\Nz$. -->
<!--    \item[sums of independent variables:] if $X$ and $Y$ are $\Nz$-valued and -->
<!--      independent, with pmfs $P_X$ and $P_Y$, and $Z=X+Y$, then -->
<!--      the pmf of $Z$ is the convolution of the pmfs of $X$ and $Y$ and -->
<!--      $P_Z(s) = P_X(s) P_Y(s)$. -->
<!--    \item[random sums:] If $\seq{\xi}$ are iid and independent of $N$, and -->
<!--      all are $\Nz$-valued then $P_Y(s) = P_N(P_{\xi_1}(s))$, where -->
<!--      $Y = \sum_{k=0}^N \xi_k$. Also $\EE[Y] = \EE[N] \times \EE[\xi_1]$. -->
<!--  \end{description} -->
<!--  \mypar{Advanced Random Walks} -->
<!--  \begin{description} -->
<!--    \item[Walambda's formulas:] Let $\seq{\xi}$ be an iid sequence. Then $\EE[ -->
<!--      \sum_{k=1}^T \xi_k] = \EE[T]\, \EE[\xi_1]$, when $\EE[T]<\infty$ and -->
<!--      $\EE[\xi_1]<\infty$ in the following two cases -->
<!--      I) $T$ is independent of $\seq{\xi}$, or -->
<!--      II) $T$ is a stopping time w.r.to $\seq{\xi}$. -->
<!--    \item[Distribution of $T_1$:] The generating function $P_{T_1}$ of $T_1$ (the -->
<!--       first hitting time of the level $1$ for the random walk with -->
<!--       $p=\PP[X_1=1]$) is -->
<!--       $P_{T_1}(s) = \oo{2 q s}(1 - \sqrt{1 - 4 p q s^2} )$ -->
<!--       and it satisfies the equation $P_{T_1}(s) = p s + q s P_{T_1}(s)^2$. -->
<!--  \end{description} -->
<!--  \end{multicols} -->
<!-- \pagebreak -->
<!-- \begin{multicols}{2} -->
<!-- \mypar{Branching processes} -->
<!--  \begin{description} -->
<!--    \item[Distribution of $Z_n$:] The generating function of $Z_n$ is -->
<!--      \[ P_{Z_n}(s) = P(P(\dots P(s))) \text{ ($n$ Ps), }\] -->
<!--      where $P$ is the generating function of -->
<!--      the offspring distribution. -->
<!--    \item[Moments of $Z_n$:] If $\mu = \EE[Z_1]$ and $\sigma^2 = -->
<!--      \Var[Z_1]$, then -->
<!--      \[ \EE[ Z_n ] = \mu^n \eand \Var[Z_n] = \sigma^2 -->
<!--      \mu^n(1+\mu+\dots+\mu^n) .\] -->
<!--    \item[Extinction:] The extinction probability $p_E$ is the smallest -->
<!--      solution of the extinction equation $x=P(x)$ in $[0,1]$. -->
<!--  \end{description} -->
<!-- \columnbreak -->

<!-- \vspace{5ex} -->

<!--  \mypar{Markov Chains} -->
<!--  \begin{description} -->
<!--    \item[Markov property:] $\seqz{X}$ is a Markov chain if -->
<!--      \begin{align*} -->
<!--        \PP[ X_{n+1} = i_{n+1}| , X_n = i_n, \dots, X_0=i_0]  = \\ , = -->
<!--         \PP[ X_{n+1} = i_{n+1} | X_n = i_n], -->
<!--      \end{align*} -->
<!--      for all (possible) $i_{n+1}, i_n,\dots, i_0$. -->
<!--    \item[Transition probabilities:] $p_{ij} = \PP[ X_{k+1} = j| X_k=i]$, -->
<!--      $p^{(n)}_{ij} = \PP[ X_{k+n}=j| X_k=i]$, -->
<!--      $P=(p_{ij})$ is the transition matrix. -->
<!--      \[ P^n = (p^{(n)}_{ij})\] -->
<!--      If is $a^{(n)}$ the (row) vector corresponding to the distribution of $X_n$, then -->
<!--      \[ a^{(n)} = a^{(0)} P^n .\] -->
<!--     \item[Recurrence and transience:] A state $i$ is recurrent if and only -->
<!--       if $\sum_{n\in\N} p^{(n)}_{ii} = \infty$. -->
<!--     \item[Canonical decomposition:] -->
<!--       \[ P = \pmat{ P_C , 0 \\ R , Q},\] -->
<!--       where recurrent states go before transient states. The fundamental -->
<!--       matrix $F$ is given by $F = (I-Q)^{-1}$. -->
<!--     \item[Absorption and reward:] $u_{ij} = (F R)_{ij}$, where $u_{ij}$ is -->
<!--       the probability that the first recurrent state we hit is $j$, given -->
<!--       that we start from the transient state $i$. -->

<!--       Also, $v_i = (F g)_i$, where $g$ is the -->
<!--       reward (column) vector and $v_i$ is the expected reward before -->
<!--       absorption, if we start from the transient state $i$. -->
<!--     \item[Stationary distributions:] The (row) vector $\pi$ is a -->
<!--       stationary distribution if $\pi = \pi P$. -->
<!--       If $X$ is finite and irreducible, a unique stationary distribution -->
<!--       $\pi$ exists and we have -->
<!--       \[ \nu_{ij} = \tf{\pi_j}{\pi_i} \eand m_i = \oo{\pi_i}\] -->
<!--       where $\nu_{ij}$ is the expected number of visits to $j$ between two -->
<!--       consecutive visits to $i$, and $m_i$ is the mean return time to $i$. -->
<!--     \item[Limiting distributions:] -->
<!--       $\pi$ is a limiting -->
<!--       distribution if $\pi_j = \lim_n p^{(n)}_{ij}$ for all $i,j$. Limiting -->
<!--       distributions exist for finite, irreducible and aperiodic chains. -->
<!--     \item[Ergodic theorem:] If $X$ is finite and irreducible and -->
<!--       $f:S\to\R$, we have -->
<!--       \[ \lim_{n\to\infty} \tf{f(X_1)+\dots+f(X_n)}{n} = \EE_{\pi}[f(X_1)] -->
<!--       = \sum_{i\in S} \pi_i f(i).\] -->
<!-- \end{description} -->
<!-- \end{multicols} -->

<!--chapter:end:distributions.Rmd-->

