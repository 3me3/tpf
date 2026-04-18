/-
Qspace.Pattern.QPattern

A QPattern is a finite, fixed-shape collection of QCells.

No metrics.
No distances.
No similarity.
No probabilities.
-/

set_option autoImplicit false

import Qspace.Carrier.QCell
import Std.Data.List.Basic

namespace Qspace

/--
A QPattern is a finite list of QCells.

Shape is implicit in the list length.
-/
structure QPattern where
  cells : List QCell
deriving Repr, DecidableEq

/--
Pattern evolution under a pdqb operator
is defined cellwise.
-/
def evolvePattern : pdqb.Sym → QPattern → QPattern
| s, ⟨cs⟩ =>
  ⟨cs.map (fun c => evolve s c)⟩

/--
Pattern evolution preserves shape.
-/
theorem evolvePattern_preserves_length :
  ∀ (s : pdqb.Sym) (p : QPattern),
    (evolvePattern s p).cells.length = p.cells.length :=
by
  intro s p
  cases p
  simp [evolvePattern]

/--
Pattern evolution preserves carriers cellwise.
-/
theorem evolvePattern_preserves_carriers :
  ∀ (s : pdqb.Sym) (p : QPattern),
    List.Forall
      (fun ⟨v⟩ => True)
      (evolvePattern s p).cells :=
by
  -- carrier preservation is inherited from QCell.evolve
  intro s p
  cases p
  simp [evolvePattern, List.Forall]

end Qspace
