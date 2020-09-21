+++
title = "Lecture 4"
template = "page-math.html"
+++

# Elementary properties of regular languages
If L₁, L₂, L are regular languages, then so are: L₁ ∪ L₂, L₁ ∩ L₂, L₁L₂, $\bar{L}$, L₁\L₂, $L<sup>*$, $L</sup>R$

Membership is decidable (i.e. if word u is member of regular language L):
1. Represent L as a DFA M. Here you might run into practical issues with potentially exponential number of states, so only generate those states visited when reading u (on-the-fly).
2. Check if u is accepted by M.

Emptyness is decidable (i.e. if a regular language L is empty):
1. construct DFA/NFA M with L(M) = L
2. Check if M has path from starting to final state
3. If yes, then L ≠ ∅. Else, L = ∅.

Subsets are decidable (i.e. if for regular languages L₁ ⊆ L₂)
1. L₁ ⊆ L₂ ↔ L₁ \ L₂ = ∅
2. So, language (L₁ \ L₂) is regular.
3. So, emptyness is decidable.

Equivalence is decidable (i.e. if two regular languages are equal):
1. L₁ = L₂ ↔ (L₁ ⊆ L₂) ∧ (L₂ ⊆ L₁)
2. The RHS of the bi-implication is decidable.

# Word (string) matching
"For input word u and regex r, does u contain a subword in L(r)?"

Algorithm (used in Unix's `grep`):
1. Transform regex Σ^*⋅𝑟 into an NFA
2. Compute on-the-fly path of u in the corresponding DFA.
3. Terminate as soon as final state is reached.

Worst-case time complexity of O(|r|⋅|u|)

# Minimising DFAs
Joerg's explanation is too abstract for me, [I recommend this video](https://www.youtube.com/watch?v=1GZOzTJOBuM).
It's also a nicer algorithm imo, not as much guess-and-check. But sadly it's not accepted on iSubmit.

The one Joerg wants us to use, in English:
1. Split up the states of the DFA into two sets: final, and nonfinal. Also, making a transition table for the DFA might be useful.
2. Split the sets repeatedly:
  1. Take two of the sets of states (at the start, you can only choose final and nonfinal). One is the source, the other the target; which one is up to you.
  2. Pick a symbol in Σ.
  3. Split the source set into two sets of states:
        * those that can reach a state in the target set via a transition on the chosen symbol, and
        * those that cannot.
3. Once no more splitting is possible, you have a minimal DFA.
4. Convert the sets into a DFA diagram:
    * each set of states becomes one state on the minimal DFA,
    * if a state was final on the original DFA, any set containing that state becomes final on the minimal DFA
    * remember to mark the initial state - the set containing the set that was initial on the original DFA
5. Enjoy your free points

# Lexical analysis
Converts sequence of characters into sequence of tokens.

How?
* regular expressions - every regex corresponds to a token
* lexical analysis searches the longest prefix of input that matches one of the regexes, and that's transformed into a token
  * when no prefix matches, you get an error
  * when there are multiple longest, one is chosen

# Non-regular languages
L = { aⁿbⁿ | n ≥ 0 } is not regular; proof by contradiction.

You can also use pumping lemma:
  * Let L be regular language
  * there exists m > 0 st every w ∈ L with |w| ≥ m
  * can be written as w = xyz
  * with |xy| ≤ m and |y| ≥ 1 and $xy^i z \in L$ for every i ≥ 0

In English: all words that are long enough can have a middle section of the word repeated an arbitrary number of times, to produce a new word, which is also part of the language.

If a language is regular, it _always_ satisfies pumping lemma. By contradiction, you can prove a language is not regular.