/-
Qspace.Memory.DeleteNoEffect

Core theorem:
Deleting a stored pattern has no observable effect.
-/

set_option autoImplicit false

import Qspace.Memory.Pattern
import Qspace.Memory.Recall
import Qspace.Memory.Deletion
import Qspace.Memory.DeletionLemmas

namespace Qspace

/--
Observable recall behavior of a memory.
-/
def recall_behavior (M : QMemory) : QPattern → QPattern :=
  fun q => recall M q

/--
CORE THEOREM:
Storing then deleting a pattern has no observable effect.
-/
theorem delete_store_no_effect :
  ∀ (M : QMemory) (p : QPattern),
    recall_behavior (delete (store M p)) =
    recall_behavior M
:= by
  intro M p
  funext q

  -- Goal is now:
  -- recall (delete (store M p)) q = recall M q

  by_cases h : recall (store M p) q = p

  · -- Case 1: p was the recalled pattern
    -- Deleting it restores the previous maximal recall
    simp [recall_behavior, h, delete, store]

  · -- Case 2: p was NOT recalled
    -- Use proven lemma: erasing non-max element has no effect
    apply recall_erase_nonmax
    exact h

end Qspace
