  
<style>
.reveal h1, .reveal h2, .reveal h3 {
  word-wrap: normal;
  -moz-hyphens: none;
  padding-bottom: 50px;
  
}
.small-code pre code {
  font-size: 1em;
}
.midcenter {
    position: fixed;
    top: 50%;
    left: 50%;
}
.footer {
    color: black; background: #E8E8E8;
    position: fixed; top: 90%;
    text-align:center; width:100%;
}
.pinky .reveal .state-background {
  background: #FF69B4;
} 
.pinky .reveal h1,
.pinky .reveal h2,
.pinky .reveal p {
  color: black;
}

h4 {
  padding-bottom: 100px
}
</style>

Welcome to M362M
========================================================
date: August, 27


What are Stochastic Processes
===============


**Question 1** In a simplistic model, the price of a  share of a stock goes either up or down by 1 each day, with probability 1/2. 

You own a single share whose value today is `$`100, so that its tomorrow's price will be 101 or 99 with probability 1/2, etc. 

Your strategy is to hold onto your share until one of the following two things happen: 

- you go bankrupt (the stock price hits `$`0 ), or 
- you make a `$`50  profit (the stock price hits `$`150.) 

===

1. How likely is it that you will make a profit before you go bankrupt?
2. How long will it take? 
3. Is it possible that it takes forever, i.e., that the stock price hovers between `$`1 and `$`f149 forever? 

===

**Question 2.** A person carying a certain disease infects a random number of people in a week, and then stops being infectious. Each of the infected people transmits the disease in the same way, etc. Suppose that the number of people each (infectious) individual infects is either 0, 1 or 2 or 3, each with probability 1/4  and that different infectious individuals may infect different number of people and behave independently of each other.

1. What is the probability that the disease will ever be eradicated?
2. What is the probability that every single individual in the  population of 300,000,000 will eventually be infected?


===


**Question 3.** In a game of tennis, Player 1 wins against Player 2 in each rally (the smallest chunk of the match that leads to point, i.e., to a score change from 15-30 to 30-30, for example) with probability p. 
What is the probability that Player 1 wins 

1. a game (the chunk of the match that leads to a score change such as 5-3 to 6-3 within a set)?
2. a set? the entire match?
4. Is the game of tennis set up in such a way that is *amplifies* or *reduces* the difference in skill between players?

===

**Question 4.** 
A knight starts in the lower left corner of the chess board and starts moving ``randomly''. 

<img src="../pics/knight1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" width="50%" />

That means that from any position, it chooses one of the possible (legal) moves and takes it, with all legal moves having the same probability. It keeps doing the same thing until it comes back to the square it started from. 

===

1. What is the expected number of moves the knight will make before it returns to "square one"?
2. How about the same problem, but using a different chess piece? Which one do you think will come back is the smallest (expected) number of steps?
3. (\*) How about the same problem, but until *all* squares have been visited at least once?


===

**Question 5.** How does Google search work?


Etiquette
===

- Mute yourself unless you are speaking.
- Keep your camera on, unless you have a good reason not to (bandwidth problems, exceptional living situation, etc.)
- Use your real name
- Be on time
- Keep chat messages relevant to the lesson

Basic info
===============

- **Course number.** M362M (53875)

- **Course meets.** online, TTh 12:30am - 2:00pm

- **Flags.** QR (quantitative reasoning)

- **Instructor.** Gordan Žitković

- **Email.** Use Canvas to email

- **Office Hours.** Please contact me for an appointment.


Prerequisites
===============

- probability  at the level of M362K
- linear algebra and some calculus

- understanding of basic programming concepts, but no R experience necessary; 

R-code
======



```r
1+1
## [1] 2
```

 $$ \int_0^t \sin(x)\, dx $$



