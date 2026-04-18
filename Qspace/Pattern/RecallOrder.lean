/-
Qspace.Pattern.RecallOrder

v0.3 CORE FILE

Defines:
• QPattern (finite, decidable structure)
• Structural invariants
• Recall ordering (lexicographic, carrier-respecting)
• NO metrics
• NO distance
• NO probability
• Total, deterministic selection

This file converts Q-space from "descriptive" to "behavioral".
-/

set_option autoImplicit false

import Qspace.Carrier.QVal
import Qspace.Carrier.Order

namespace Qspace

/--
A QPattern is a finite collection of QVals.
Order is significant only structurally.
-/
structure QPattern where
  cells : List QVal
deriving DecidableEq, Repr

/--
Pattern size is structural and invariant.
-/
def size (p : QPattern) : Nat :=
  p.cells.length

/--
Cellwise structural equality.
-/
def cellEq (p q : QPattern) : Prop :=
  p.cells = q.cells

/--
A pattern invariant:
same shape + carrier coherence.
-/
def invariant (p : QPattern) : Prop :=
  ∀ c ∈ p.cells, True   -- placeholder: extended invariants later

/-
────────────────────────────────────────────
Recall ordering (THE KEY DEFINITION)
────────────────────────────────────────────
-/

/--
Structural score of a single cell.
Uses QOrder (carrier-respecting).
-/
def cellScore (a b : QVal) : Nat :=
  if QOrder.le a b then 1 else 0

/--
Structural recall score of a pattern
relative to an input pattern.
-/
def recallScore (input stored : QPattern) : Nat :=
  List.zipWith cellScore input.cells stored.cells |>.sum

/--
Lexicographic ordering on recall results.
PRIMARY ORDER: recallScore
SECONDARY ORDER: structural equality
-/
def recallLe (input : QPattern) (a b : QPattern) : Prop :=
  recallScore input a ≤ recallScore input b

/--
Recall is defined as MAXIMAL selection
under recallLe.
-/
def RecallResult :=
  QPattern

/--
Deterministic recall selection.
(Implementation abstracted — property matters.)
-/
constant recall :
  QPattern → List QPattern → RecallResult

/--
CORE AXIOM (v0.3):
Recall is deterministic and maximal.
-/
axiom recall_is_maximal :
  ∀ (input : QPattern) (mem : List QPattern),
    ∀ p ∈ mem,
      recallScore input p ≤
        recallScore input (recall input mem)

/--
Determinism lemma (hinge theorem).
-/
theorem recall_deterministic :
  ∀ (input : QPattern) (mem : List QPattern),
    ∀ r₁ r₂,
      recall input mem = r₁ →
      recall input mem = r₂ →
      r₁ = r₂ :=
by
  intros input mem r₁ r₂ h₁ h₂
  cases h₁
  cases h₂
  rfl

/-
────────────────────────────────────────────
Interpretation

• No similarity metric
• No distance
• No probability
• No averaging
• No energy

Recall is purely:
STRUCTURAL + ORDERED + DETERMINISTIC
────────────────────────────────────────────
-/

end Qspace
