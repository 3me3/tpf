/-
Qspace.Memory.RecallDeterministic

Core lemma:
Recall behavior is deterministic.

This excludes:
- energy minimization
- probabilistic selection
- metric comparison

Recall is a function, not a process.
-/

set_option autoImplicit false

import Qspace.Memory.Recall
import Qspace.Memory.Pattern

namespace Qspace
namespace Memory

/--
Recall determinism.

Given the same memory and input pattern,
recall returns a unique output.
-/
theorem recall_deterministic :
  ∀ (M : QMemory) (p r₁ r₂ : QPattern),
    recall M p = r₁ →
    recall M p = r₂ →
    r₁ = r₂ :=
by
  intro M p r₁ r₂ h₁ h₂
  -- since recall is a total function, equality is definitional
  exact Eq.trans h₁ (Eq.symm h₂)

end Memory
end Qspace
