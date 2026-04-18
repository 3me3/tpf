/-
Qspace.Memory.ObservationalEquiv

Defines semantic equivalence of memories purely by observables.
No metrics.
No internal structure inspected.
-/

set_option autoImplicit false

import Qspace.Memory.Recall

namespace Qspace

/--
Two memories are observationally equivalent
if they exhibit identical recall behavior
for all input patterns.
-/
def ObsEq (M₁ M₂ : QMemory) : Prop :=
  recall_behavior M₁ = recall_behavior M₂

notation:50 M₁ " ≈ₒ " M₂ => ObsEq M₁ M₂

/--
Observational equivalence is reflexive.
-/
theorem ObsEq.refl (M : QMemory) : M ≈ₒ M :=
by
  rfl

/--
Observational equivalence is symmetric.
-/
theorem ObsEq.symm {M₁ M₂ : QMemory} :
  M₁ ≈ₒ M₂ → M₂ ≈ₒ M₁ :=
by
  intro h
  symm
  exact h

/--
Observational equivalence is transitive.
-/
theorem ObsEq.trans {M₁ M₂ M₃ : QMemory} :
  M₁ ≈ₒ M₂ → M₂ ≈ₒ M₃ → M₁ ≈ₒ M₃ :=
by
  intro h₁ h₂
  simpa [ObsEq] using Eq.trans h₁ h₂

end Qspace
