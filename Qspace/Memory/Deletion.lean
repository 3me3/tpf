/-
Qspace.Memory.Deletion

Core theorem skeleton:

"Deletion does not require energy" is encoded as:
  recall behavior after store+delete
  is observationally equivalent to the original memory.
-/

set_option autoImplicit false

import Qspace.Memory.Pattern
import Qspace.Memory.Recall

namespace Qspace
namespace Memory

/--
Store a pattern in memory.

Pure, total, effect encoded in the new Memory value.
-/
constant store  : Memory → QPattern → Memory

/--
Delete a pattern from memory.

Again: pure, total.
-/
constant delete : Memory → QPattern → Memory

/--
Observational behavior of a memory:

Given a memory, we see how it responds to any input pattern.
Two memories are observationally equivalent if these
functions coincide.
-/
def recallBehavior (M : Memory) : QPattern → QPattern :=
  fun p => recall M p

/--
CORE THEOREM (to be proved in v0.3+):

Deleting a stored pattern has no observable side effects
on recall behavior.

This is the formal expression of:
"Deletion does not require energy."
-/
theorem delete_store_no_effect :
  ∀ (M : Memory) (p : QPattern),
    recallBehavior (delete (store M p) p)
      = recallBehavior M :=
by
  -- Proof will be supplied once:
  --  * recall is defined via invariant-maximization
  --  * determinism lemmas are available.
  admit

end Memory
end Qspace
