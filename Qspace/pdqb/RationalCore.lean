namespace Qspace.pdqb

/-
  RationalCore — minimal rational structure for the kernel.

  This module encapsulates the foundational arithmetic identity
  that exact rational cancellation rests on:

      n * (n+1) / n = n+1    (for n > 0)

  More generally:

      (n * k) / n = k         (for n > 0)

  This is the cancellation law underlying every partition ratio
  in the kernel. It is stated here as a named theorem so that all
  downstream structural arithmetic can reference it explicitly
  rather than relying on it implicitly through Lean's decidability
  infrastructure.
-/

/-- Minimal rational structure (no external dependencies) --/
structure Rat where
  num : Nat
  den : Nat
deriving Repr

/-- Basic constructor (no normalization — keep kernel minimal) --/
def mkRat (n d : Nat) : Rat :=
  { num := n, den := d }

/--
  Foundational cancellation: (n * k) / n = k, for n > 0.

  This is the operational bedrock of exact rational arithmetic:
  multiplication and division by the same positive denominator
  cancel exactly.
--/
theorem mul_div_cancel_left (n k : Nat) (h : n > 0) :
    (n * k) / n = k :=
  Nat.mul_div_cancel_left k h

/--
  Special case: n * (n+1) / n = n+1, for n > 0.

  The classic form of the cancellation identity.
--/
theorem mul_succ_div_self (n : Nat) (h : n > 0) :
    (n * (n + 1)) / n = n + 1 :=
  mul_div_cancel_left n (n + 1) h

end Qspace.pdqb
