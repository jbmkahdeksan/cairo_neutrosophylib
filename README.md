# NeutrosophyLib in Cairo

Welcome to the **NeutrosophyLib** project written in the Cairo programming language. This library is a reimplementation of the original [NeutrosophyLib](https://github.com/SatisfiedVagabonds/NeutrosophyLib/tree/master) by **Ranulfo**. I want to give a huge shout out to Ranulfo for his foundational work, which has been pivotal in the development of this library. 

Neutrosophy is a branch of philosophy that extends the concept of truth beyond traditional binary values, exploring the interaction between truth, falsehood, and neutrality. This library provides tools to manipulate and analyze neutrosophic numbers and perform operations based on neutrosophic logic.

---

## Features

- **Single Valued Neutrosophic Numbers**: A new data type that includes the concepts of truth, indeterminacy, and falsehood _(T, I, F)_.
- **Operations for SVNNs**
    1. **Unary Operations** 
    Given a SVNN _x_, unary operations are:
        - **Complement** $x^c$ of $x$ is another SVNN given by the formula:
                $$x^c = (x.F, 1 - x.I, x.T)$$

        - **Score** $x^s$ of $x$ is a real number given by the formula:
                $$x^s = \frac{2 + x.T - x.I - x.F}{3}$$

        - **Accuracy** $x^a$ of $x$ is a real number given by the formula:
                $$x^a = x.T - x.I$$

        - **Deneutrosophy** $x^d$ of $x$ is a real number given by the formula:
                $$x^d = 1 - \sqrt{\frac{(1-x.T)^2 + x.I^2 + x.F^2}{3}}$$

    2. **Binary Operations**
        - Addition
        - Multiplication
        - isContained
        - isEqual
        - Difference
        - Intersection
        - Union
        
---

## Installation

To install and use this library, you'll need to have Cairo installed. You can install Cairo from [here](https://www.cairo-lang.org/docs/quickstart.html).
