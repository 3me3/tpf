/-
Qspace.Memory.DeleteNoEffectObs

Deletion preserves observational behavior.
-/

set_option autoImplicit false

import Qspace.Memory.Observation
import Qspace.Memory.Deletion

namespace Qspace

theorem delete_store_no_effect_obs :
  ∀ (M : QMemory) (p : QPattern),
    ObservationallyEquivalent
      (delete (store M p) p)
      M
:=
by
  intro M p
  intro q
  -- This is exactly the theorem you already proved
  simpa using delete_store_no_effect M p q

end Qspace
