/-
Qspace.Phase
Discrete 8-phase torsion structure.
No zero phase. No metrics. No arithmetic.
-/

set_option autoImplicit false

namespace Qspace

/--
8 discrete Q-space phases.
Phase 0 is intentionally excluded:
zero is a boundary, not a state.
-/
inductive QPhase where
  | φ1
  | φ2
  | φ3
  | φ4
  | φ5
  | φ6
  | φ7
  | φ8
deriving DecidableEq, Repr

end Qspace
