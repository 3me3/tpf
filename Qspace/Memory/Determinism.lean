/-
Qspace.Memory.Determinism

Recall determinism is the hinge property of Q-space memory.

If recall is defined by invariant maximization over a
carrier-respecting order, then the result is unique.

No metrics.
No probability.
No energy.
-/

set_option autoImplicit false

import Qspace.Memory.Pattern
import Qspace.Memory.Recall

namespace Qspace
namespace Memory

/--
Recall is deterministic.

Given a fixed memory and input pattern,
recall produces a unique result.
-/
axiom recall_deterministic :
  ∀ (M : Memory) (p : Pattern),
    ∃! r, recall M p = r

/-
Interpretation:

This axiom captures the core fact needed for all higher theorems:
• deletion safety
• non-interference
• no ghost states
• energy-free deletion

We do NOT prove this yet.
We only freeze the target.
-/

end Memory
end Qspace
