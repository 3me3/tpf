/-
Qspace.Memory.Observation

Observational semantics for Q-space memory.
-/

set_option autoImplicit false

import Qspace.Memory.Recall

namespace Qspace

def ObservationallyEquivalent (M₁ M₂ : QMemory) : Prop :=
  ∀ q, recall M₁ q = recall M₂ q

end Qspace
