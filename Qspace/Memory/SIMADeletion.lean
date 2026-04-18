/-
Qspace.Memory.SIMADeletion

Deletion preserves SIMA semantics.
-/

set_option autoImplicit false

import Qspace.Memory.SIMA
import Qspace.Memory.DeleteNoEffectObs

namespace Qspace

/--
Deleting a stored pattern preserves SIMA semantics.
-/
theorem delete_preserves_SIMA :
  ∀ (M : QMemory) (p : QPattern),
    SIMA (delete (store M p) p) M :=
by
  intro M p
  -- expands to observational equivalence
  unfold SIMA
  exact delete_store_no_effect_obs M p

end Qspace
