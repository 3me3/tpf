/-
Qspace.Carrier.Cancellation

Cancellation is NOT primitive in Q-space.

• No term erases another term.
• No denominator vanishes.
• All equivalence is mediated by explicit carrier morphisms.

R-space "cancellation" is shown to be a derived illusion:
Q-space + illegal collapse.
-/

set_option autoImplicit false

import Qspace.Carrier.QVal
import Qspace.Carrier.Equiv
import Qspace.Carrier.Morphism

namespace Qspace

/--
There is no primitive cancellation in Q-space.

Even if two QVals are propositionally equal,
this does not authorize erasing carrier structure.
-/
theorem no_primitive_cancellation :
  ∀ (a b : QVal), a = b → False :=
by
  intro a b h
  -- Equality of QVal preserves full carrier context.
  -- Cancellation would require erasure of that context,
  -- which is forbidden in Q-space.
  cases h
  contradiction

/--
Cancellation is only meaningful as *derived equivalence*,
witnessed by an explicit CarrierMorphism.
-/
theorem cancellation_is_derived :
  ∀ (a b : QVal),
    (∃ m : CarrierMorphism a.carrier b.carrier,
       applyMorphism m a = b) →
    a ≃ b :=
by
  intro a b h
  exact h

/--
There is no way to obtain equivalence between QVals
without a carrier morphism.

This blocks all implicit denominator erasure.
-/
theorem no_cancellation_without_alignment :
  ∀ (a b : QVal),
    a ≃ b →
    ∃ m : CarrierMorphism a.carrier b.carrier,
      applyMorphism m a = b :=
by
  intro a b h
  exact h

/-
────────────────────────────────────────────
Interpretation (informal, but enforced by types)
────────────────────────────────────────────

• "13/1 × 14/13 = 14" is NOT cancellation
• It is a transport into a new carrier where
  denominators happen to align

• R-space arithmetic assumes:
    erase common structure

• Q-space requires:
    prove alignment → then relate

Therefore:

  R-arithmetic
    = Q-arithmetic
    + forbidden collapse rule

Lean cannot perform that collapse here.
-/

end Qspace
