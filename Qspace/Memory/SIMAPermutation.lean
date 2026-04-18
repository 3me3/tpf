/-
Qspace.Memory.SIMAPermutation

Reordering memory state has no semantic effect.
-/

set_option autoImplicit false

import Qspace.Memory.SIMA
import Qspace.Memory.Permutation

namespace Qspace

/--
State permutation preserves SIMA semantics.
-/
theorem permutation_preserves_SIMA :
  ∀ (M : QMemory) (σ : M → M),
    SIMA (permute σ M) M :=
by
  intro M σ
  unfold SIMA
  exact permutation_invariant_recall M σ

end Qspace
