set_option autoImplicit false

import Qspace.Carrier.Morphism

namespace Qspace

/--
Two QVals are equivalent iff they are numerically equal
*and* their carriers are aligned by a morphism.

This is NOT definitional equality.
This is STRUCTURAL equivalence.
-/
structure QEquiv (v₁ v₂ : QVal) : Prop where
  morphism : CarrierMorphism
  src_ok   : v₁.carrier = morphism.src
  dst_ok   : v₂.carrier = morphism.dst
  num_eq   : v₁.num = v₂.num

notation v₁ " ≃ " v₂ => QEquiv v₁ v₂

end Qspace
