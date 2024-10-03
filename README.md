# NeutrosophyLib in Cairo

Welcome to the **NeutrosophyLib** project written in the Cairo programming language. This library is a reimplementation of the original [NeutrosophyLib](https://github.com/SatisfiedVagabonds/NeutrosophyLib/tree/master) by **Ranulfo**. I want to give a huge shout out to Ranulfo for his foundational work, which has been pivotal in the development of this library. 

Neutrosophy is a branch of philosophy that extends the concept of truth beyond traditional binary values, exploring the interaction between truth, falsehood, and neutrality. This library provides tools to manipulate and analyze neutrosophic numbers and perform operations based on neutrosophic logic.

---

## Features

- **Single Valued Neutrosophic Numbers**: A new data type that includes the concepts of truth, indeterminacy, and falsehood $(T, I, F)$.
- **Operations for SVNNs**
    1. **Unary Operations** 
    Given a SVNN _x_, unary operations are:
        - **Complement** $x^c$ of $x$ is another SVNN given by the formula:\
        $$x^c = (x.F, 1 - x.I, x.T)$$

        - **Score** $x^s$ of $x$ is a real number given by the formula:\
        $$x^s = \frac{2 + x.T - x.I - x.F}{3}$$

        - **Accuracy** $x^a$ of $x$ is a real number given by the formula:\
        $$x^a = x.T - x.I$$

        - **Deneutrosophy** $x^d$ of $x$ is a real number given by the formula:\
        $$x^d = 1 - \sqrt{\frac{(1-x.T)^2 + x.I^2 + x.F^2}{3}}$$

    2. **Binary Operations**
    Given two SVNNs $x$ and $y$, the following operations are currently supported:
        - **isContained** $x$ is contained in $y$ if the following holds:\
            $$x.T <= y.T$$ \
            $$x.I >= y.I$$ \
            $$x.F >= y.F$$
        - **isEqual** $x$ and $y$ are equal everytime:\
            $$isContained(x, y) = true$$ \
            $$isContained(y, x) = true$$
            
        - The result of the **addition**, given by $z$ is reflected by the formula:\
            $$z.T = (x.T + y.T) - (x.T * y.T)$$\
            $$z.I = x.I * y.I$$\
            $$z.F = x.F * y.F$$

        - **Multiplication** given by SVNN $z$ follows:\
            $$z.T = x.T * y.T$$\
            $$z.I = (x.I + y.I) - (x.I * y.I)$$\
            $$z.F = (x.F + y.F) - (x.F * y.F)$$
        - **Difference** is another SVNN $z$ folllowing:\
            $$z.T = min(x.T, y.F)$$\
            $$z.I = min(x.I, 1 - y.I)$$\
            $$z.F = max(x.F, y.T)$$
        - **Intersection** is a SVNN $z$ given by:\
            $$z.T = min(x.T, y.T)$$\
            $$z.I = min(x.I, y.I)$$\
            $$z.F = max(x.F, y.F)$$

        - **Union** of $x$ and $y$ is given by $z$ where:\
            $$z.T = max(x.T, y.T)$$\
            $$z.I = max(x.I, y.I)$$\
            $$z.F = min(x.F, y.F)$$
        

