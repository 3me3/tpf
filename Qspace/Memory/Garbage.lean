/-
Qspace.Memory.Garbage

Garbage collection theorem.

Removing unreachable patterns does not change
observable recall behavior.

This is the formal SIMA "forgetting is free" result.
-/

set_option autoImplicit false

import Qspace.Memory.Pattern
import Qspace.Memory.Recall
import Qspace.Memory.Deletion
import Qspace.Memory.Isomorphism
import Qspace.Memory.RecallOrder

namespace Qspace

/--
A pattern is unreachable in memory M
if it is never recalled for any query.
-/
def unreachable (M : QMemory) (p : QPattern) : Prop :=
  ∀ q : QPattern, recall M q ≠ p

/--
Erasing an unreachable pattern yields
an observationally equivalent memory.
-/
theorem erase_unreachable_no_effect :
  ∀ (M : QMemory) (p : QPattern),
    unreachable M p →
    delete M p ≈ M :=
by
  intro M p hunreach q
  unfold observationally_equivalent
  -- deletion does nothing because p is never maximal
  apply recall_erase_nonmax
  exact hunreach q

end Qspace
