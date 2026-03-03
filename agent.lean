/-
Population Protocol Mini Model in Lean 4

This file models a very small population protocol with:

• A finite set of agent states
• A pairwise interaction rule
• A configuration (population snapshot)
• A deterministic single interaction step

This mirrors the structure of population protocols
from Angluin et al., but in simplified form.
-/

------------------------------------------------------------
-- 1. Define the finite state space Q
------------------------------------------------------------

/-
`State` represents the finite set of agent states.

In population protocol terminology:
Q = {x, y, b}

• x and y represent competing states
• b represents a blank/neutral state

`deriving Repr` allows states to print with `#eval`
`deriving DecidableEq` allows equality comparison
-/
inductive State where
| x
| y
| b
deriving Repr, DecidableEq


------------------------------------------------------------
-- 2. Define the interaction rule δ
------------------------------------------------------------

/-
`interact` models the protocol's transition rule.

Type:
State → State → State × State

Meaning:
Given two interacting agents,
return their updated states.

This directly corresponds to δ(q₁, q₂) in
population protocol definitions.
-/
def interact : State → State → State × State
| State.x, State.y => (State.x, State.b)
| State.y, State.x => (State.y, State.b)

-- Propagation rules:
-- A non-blank interacting with blank
-- converts the blank into its own state.
| State.x, State.b => (State.x, State.x)
| State.b, State.x => (State.x, State.x)
| State.y, State.b => (State.y, State.y)
| State.b, State.y => (State.y, State.y)

-- Default case: no change
| s1, s2 => (s1, s2)


------------------------------------------------------------
-- 3. Testing the interaction rule
------------------------------------------------------------

/-
`#eval` executes the function and prints the result.

This is computation, not proof.
Useful for verifying transition behavior.
-/
#eval interact State.x State.y
#eval interact State.x State.b
#eval interact State.b State.y


------------------------------------------------------------
-- 4. Define a configuration (population snapshot)
------------------------------------------------------------

/-
A configuration represents the entire population
at a single moment in time.

In theory, this is a multiset of states.
Here, we use a List for simplicity.

Example:
[x, y, b] means:
Agent 0 = x
Agent 1 = y
Agent 2 = b
-/
def Config := List State

def c1 : Config := [State.x, State.y, State.b]

#eval c1


------------------------------------------------------------
-- 5. Define a deterministic single interaction step
------------------------------------------------------------

/-
`stepOnce` performs one interaction step.

Scheduler assumption:
Always select the first two agents in the list.

If the population has at least two agents:
  • Extract s1 and s2
  • Apply interact
  • Replace them with updated states
  • Leave the rest unchanged

If fewer than two agents exist,
the configuration remains unchanged.

This models:
Configuration → Interaction → New Configuration
-/
def stepOnce (c : Config) : Config :=
  match c with
  | s1 :: s2 :: rest =>
      let (t1, t2) := interact s1 s2
      t1 :: t2 :: rest
  | _ => c


#eval stepOnce c1
