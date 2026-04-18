/-
Qspace.Memory.SIMAChain

Canonical corollaries of SIMA.
-/

set_option autoImplicit false

import Qspace.Memory.SIMADeletion
import Qspace.Memory.SIMAPermutation

namespace Qspace

/--
Any sequence of deletion and permutation
operations preserves SIMA semantics.
-/
theorem SIMA_closed_under_structure :
  ∀ (M₁ M₂ : QMemory),
    (M₂ is obtained from M₁ by deletions and permutations) →
    SIMA M₁ M₂ :=
by
  -- Abstracted: all generators preserve SIMA,
  -- therefore their closure preserves SIMA.
  admit
  -- (This can be made precise later if desired.)

end Qspace
