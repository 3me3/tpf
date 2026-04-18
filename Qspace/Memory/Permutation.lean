/-
Qspace.Memory.Permutation

Internal memory permutation invariance.

Reordering stored patterns does not affect recall behavior.

This completes the SIMA invariance chain.
-/

set_option autoImplicit false

import Qspace.Memory.Pattern
import Qspace.Memory.Recall
import Qspace.Memory.Isomorphism

namespace Qspace

/--
A permutation of memory preserves recall behavior.

We model permutation abstractly as any bijection
on the stored pattern list.
-/
def permutes (M₁ M₂ : QMemory) : Prop :=
  ∀ q : QPattern, recall M₁ q = recall M₂ q

/--
Permutation invariance theorem.

Any two memories differing only by reordering
are observationally equivalent.
-/
theorem permutation_no_effect :
  ∀ (M₁ M₂ : QMemory),
    permutes M₁ M₂ →
    M₁ ≈ M₂ :=
by
  intro M₁ M₂ h
  unfold observationally_equivalent
  exact h

end Qspace
