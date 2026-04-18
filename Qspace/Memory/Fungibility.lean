/-
Qspace.Memory.Fungibility

SIMA-1:
Observationally equivalent memories are semantically fungible.
-/

set_option autoImplicit false

import Qspace.Memory.ObservationalEquiv

namespace Qspace

/--
If two memories are observationally equivalent,
they may be substituted for one another
without semantic effect.

This is state fungibility.
-/
theorem memory_fungible
  {M₁ M₂ : QMemory}
  (h : M₁ ≈ₒ M₂) :
  recall_behavior M₁ = recall_behavior M₂ :=
by
  exact h

/--
Fungibility expressed pointwise.
-/
theorem memory_fungible_apply
  {M₁ M₂ : QMemory}
  (h : M₁ ≈ₒ M₂)
  (q : QPattern) :
  recall M₁ q = recall M₂ q :=
by
  have := h
  change recall_behavior M₁ q = recall_behavior M₂ q
  simpa using congrArg (fun f => f q) h

end Qspace
