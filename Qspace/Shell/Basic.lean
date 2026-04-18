/-
Qspace.Shell.Basic

Discrete square shells.
No metrics.
No arithmetic evaluation.
No ordering.
Pure inductive structure.
-/

set_option autoImplicit false

namespace Qspace

/--
A shell index.
Shell 0 is the origin shell (boundary / phase horizon).
Shell (k+1) wraps Shell k.
-/
inductive Shell where
  | zero : Shell
  | succ : Shell → Shell
deriving DecidableEq, Repr

/--
Successor notation for shells.
-/
def next : Shell → Shell
  | s => Shell.succ s

/-
────────────────────────────────────────────
Phase structure (discrete, non-metric)
────────────────────────────────────────────
-/

/--
Phase is 1..8 only.
Zero is not a phase; it is the chiral boundary.
-/
inductive Phase where
  | φ1 | φ2 | φ3 | φ4 | φ5 | φ6 | φ7 | φ8
deriving DecidableEq

end Qspace
