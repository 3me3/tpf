/-
Qspace.pdqb.Action

Total executable semantics for pdqb operators.

This file introduces:
- a closed operator alphabet
- a total action on Q-space cells
- NO group theory
- NO metrics
- NO proofs yet

This is the behavioral kernel entry point for v0.3.
-/

set_option autoImplicit false

import Qspace.Carrier.QVal
import Qspace.Phase

namespace Qspace
namespace pdqb

/--
Primitive pdqb operator alphabet.

This is intentionally finite and closed.
-/
inductive Sym where
  | p | d | q | b
  | pd | db | pb | qb
deriving DecidableEq, Repr

/--
Total action of pdqb operators on Q-values.

Rules:
- carrier is preserved
- phase evolves deterministically
- payload is untouched (structure > magnitude)
-/
def act : Sym → QVal → QVal
| Sym.p,  ⟨c, ph, v⟩ => ⟨c, ph, v⟩
| Sym.q,  ⟨c, ph, v⟩ => ⟨c, ph, v⟩
| Sym.b,  ⟨c, ph, v⟩ => ⟨c, ph, v⟩
| Sym.d,  ⟨c, ph, v⟩ => ⟨c, Phase.next ph, v⟩

| Sym.pd, ⟨c, ph, v⟩ => ⟨c, Phase.next ph, v⟩
| Sym.db, ⟨c, ph, v⟩ => ⟨c, Phase.next ph, v⟩
| Sym.pb, ⟨c, ph, v⟩ => ⟨c, ph, v⟩
| Sym.qb, ⟨c, ph, v⟩ => ⟨c, ph, v⟩

/--
Carrier preservation is definitional, not a theorem.
-/
theorem act_preserves_carrier :
  ∀ (s : Sym) (x : QVal),
    (act s x).carrier = x.carrier :=
by
  intro s x
  cases s <;> rfl

end pdqb
end Qspace
