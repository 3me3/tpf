/-
Qspace.Memory.Recall

Recall is deterministic selection.
No distance.
No similarity.
No metric notions.

Recall chooses a maximal pattern under RecallOrder.
-/

set_option autoImplicit false

import Qspace.Pattern.RecallOrder
import Qspace.Memory.Pattern

namespace Qspace

namespace Memory

/--
Recall selects a stored pattern.

This is intentionally abstract at v0.3:
• total
• deterministic
• order-based
-/
def recall
  (store : List Pattern)
  (input : Pattern)
  : Option Pattern :=
  RecallOrder.maximal store

/-
Interpretation:

• recall does NOT compare input to store
• recall does NOT minimize distance
• recall does NOT average or interpolate

Recall is selection, not computation.

Determinism comes from:
• finite store
• decidable order
• maximal selection
-/

end Memory

end Qspace
