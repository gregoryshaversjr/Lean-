# Lean + Population Protocol Preparation Schedule

## Goal
Build the necessary Lean and formal reasoning foundations before exclusively formalizing the Angluin population protocol paper.

---

## Week 1 — Lean Foundations

Focus:
- Understanding `:` (types everywhere)
- `def` vs `theorem`
- Pattern matching (`match`)
- `cases`
- `rfl`
- `simp`
- Equality reasoning

Exercises:
- Prove properties of small functions
- Write and prove Boolean logic properties
- Practice small arithmetic proofs

Outcome:
Lean syntax and proof structure feel natural.

---

## Week 2 — Lists and Recursion (Critical)

Focus:
- `List` type
- Pattern matching on lists
- Recursive functions on lists
- Counting elements in a configuration
- Induction over lists

Exercises:
- Define `countX : Config → Nat`
- Prove simple properties about list transformations

Outcome:
Comfortable reasoning about populations as lists.

---

## Week 3 — Invariants

Focus:
- Define properties like:
  - "There exists an x"
  - "All states are equal"
- Prove properties preserved under `stepOnce`

Example Target:
If a configuration contains at least one `x`, then after one step it still contains at least one `x`.

Outcome:
Understand safety properties and invariant preservation.

---

## Week 4 — Iteration and Reachability

Focus:
- Define repeated steps:

```
def iterate (n : Nat) (c : Config) : Config
```

- Reason about multi-step behavior
- Understand stabilization ideas

Outcome:
Able to reason about system behavior over time.

---

## Week 5 — Induction Over Time

Focus:
- Induction on natural numbers
- Prove properties for all `n`
- Combine time induction with configuration invariants

Outcome:
Comfortable proving properties across arbitrary numbers of steps.

---

## Week 6 — Simplified Population Protocol Formalization

Focus:
- Finite state set Q
- Transition function δ
- Configurations as lists
- Define stabilization
- Prove a small majority-style property

Outcome:
Ready to begin structured formalization of the Angluin paper.

---

## Strategic Positioning

This preparation builds a strong foundation in:
- Distributed systems modeling
- Formal verification
- Theorem proving
- Theoretical computer science reasoning


