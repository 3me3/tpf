/-
Qspace.Carrier.QCell

A QCell is the atomic executable state unit of Q-space.

Key properties:
- contains a QVal
- evolution is operator-driven
- no metrics
- no arithmetic
- no collapse
-/

set_option autoImplicit false

import Qspace.Carrier.QVal
import Qspace.pdqb.Action

namespace Qspace

/--
Atomic Q-space cell.

This is the smallest unit that evolves under pdqb action.
-/
structure QCell where
  val : QVal
deriving Repr, DecidableEq

/--
Total evolution of a QCell under a pdqb operator.
-/
def evolve : pdqb.Sym → QCell → QCell
| s, ⟨v⟩ => ⟨pdqb.act s v⟩

/--
Cell evolution preserves carrier by construction.
-/
theorem evolve_preserves_carrier :
  ∀ (s : pdqb.Sym) (c : QCell),
    (evolve s c).val.carrier = c.val.carrier :=
by
  intro s c
  cases c
  simp [evolve, pdqb.act_preserves_carrier]

end Qspace
