/-
Qspace.Memory.SIMA

Semantic-Invariant Memory Architecture (SIMA).

A memory architecture where meaning is defined
solely by observable recall behavior.
-/

set_option autoImplicit false

import Qspace.Memory.ObservationalEquiv

namespace Qspace

/--
SIMA: semantic meaning of memory is entirely determined
by its observable recall behavior.
-/
def SIMA (M₁ M₂ : QMemory) : Prop :=
  observationally_equiv M₁ M₂

end Qspace
