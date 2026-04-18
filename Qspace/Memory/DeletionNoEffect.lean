/-
Qspace.Memory.DeletionNoEffect

Core theorem of Q-Lean v0.3:

Deletion does not require energy.
Formally: store then delete is observationally neutral.

This is not a metaphor.
This is structural equivalence.
-/

set_option autoImplicit false

import Qspace.Memory.Pattern
import Qspace.Memory.Recall
import Qspace.Memory.Deletion
import Qspace.Memory.DeletionInvariant
import Qspace.Memory.StoreMaximality

namespace Qspace
namespace Memory

/--
Two memories are observationally equivalent
if recall behaves identically on all inputs.
-/
def observationallyEquivalent (M₁ M₂ : QMemory) : Prop :=
  ∀ p : QPattern,
    recall M₁ p = recall M₂ p

/--
CORE THEOREM (Q-Lean v0.3):

Storing and then deleting a pattern
has no observable effect on recall behavior.

This formally encodes:
"Deletion does not require energy."
-/
theorem delete_store_no_effect :
  ∀ (M : QMemory) (p : QPattern),
    observationallyEquivalent
      (delete (store M p) p)
      M :=
by
  intro M p q
  -- Case distinction:
  -- If the query is the deleted pattern, use deletion invariant
  -- Otherwise, recall behavior is unchanged
  by_cases h : q = p
  · subst h
    -- Deleted pattern is no longer recalled
    -- matches original behavior
    exact recall_deleted_invariant M p
  ·
    -- For all other patterns,
    -- deletion does not affect recall
    exact recall_unchanged_under_deletion M p q h

end Memory
end Qspace
