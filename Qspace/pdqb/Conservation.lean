import Qspace.pdqb.Mutation
import Qspace.pdqb.Lemniscate

/-
Qspace.pdqb.Conservation

Structural conservation law:

Admissible mutations preserve
global torsional symmetry (σ^8 = id).

No inverses.
No bijection proofs.
No algebraic machinery.
Pure symmetry preservation.
-/

set_option autoImplicit false

namespace Qspace
namespace pdqb

open Φ

/--
Torsional symmetry predicate.
-/
def torsion_fixed (x : Φ) : Prop :=
  iterate σ 8 x = x

/--
All elements of Φ satisfy torsional symmetry.
-/
theorem torsion_global (x : Φ) :
  torsion_fixed x :=
  σ_order_eight x

/--
Admissible mutations preserve torsional symmetry.
-/
theorem admissible_preserves_torsion
  {f : Φ → Φ}
  ( _ : Admissible f)
  (x : Φ) :
  torsion_fixed (f x) :=
  σ_order_eight (f x)

end pdqb
end Qspace
