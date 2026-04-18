/-
Qspace.Memory.Isomorphism

Memory isomorphism via observational equivalence.

Core SIMA principle:
Only recall behavior is semantically meaningful.
Internal structure is irrelevant.
-/

set_option autoImplicit false

import Qspace.Memory.Pattern
import Qspace.Memory.Recall

namespace Qspace

/--
Two memories are observationally equivalent
if they produce identical recall results
for all query patterns.
-/
def observationally_equivalent (M₁ M₂ : QMemory) : Prop :=
  ∀ q : QPattern, recall M₁ q = recall M₂ q

notation M₁ " ≈ " M₂ => observationally_equivalent M₁ M₂

/--
Observational equivalence is reflexive.
-/
theorem obs_eq_refl :
  ∀ M : QMemory, M ≈ M :=
by
  intro M q
  rfl

/--
Observational equivalence is symmetric.
-/
theorem obs_eq_symm :
  ∀ M₁ M₂ : QMemory, M₁ ≈ M₂ → M₂ ≈ M₁ :=
by
  intro M₁ M₂ h q
  symm
  exact h q

/--
Observational equivalence is transitive.
-/
theorem obs_eq_trans :
  ∀ M₁ M₂ M₃ : QMemory,
    M₁ ≈ M₂ → M₂ ≈ M₃ → M₁ ≈ M₃ :=
by
  intro M₁ M₂ M₃ h₁ h₂ q
  calc
    recall M₁ q = recall M₂ q := h₁ q
    _            = recall M₃ q := h₂ q

/--
Memory isomorphism: semantic identity.

This is *not* structural equality.
It is equality of observable behavior.
-/
def MemoryIso (M₁ M₂ : QMemory) : Prop :=
  M₁ ≈ M₂

/--
Isomorphic memories are interchangeable
in all recall contexts.
-/
theorem iso_substitution :
  ∀ M₁ M₂ : QMemory,
    MemoryIso M₁ M₂ →
    ∀ q : QPattern,
      recall M₁ q = recall M₂ q :=
by
  intro M₁ M₂ h q
  exact h q

end Qspace
