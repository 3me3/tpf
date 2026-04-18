/-
Qspace.Carrier.QVal

A value-with-context.
No naked numbers.
No implicit cancellation.
No metric meaning.
-/

set_option autoImplicit false

import Qspace.Shell.Carrier

namespace Qspace

/--
A Q-value is a numerator bound to an explicit Carrier.

Interpretation:
  value = num / base   within shell
but division is NOT a primitive here.
-/
structure QVal where
  carrier : Carrier
  num     : Int

deriving DecidableEq, Repr

/--
Two QVals are comparable *only* if their carriers match.
-/
def QVal.sameCarrier (v₁ v₂ : QVal) : Prop :=
  v₁.carrier = v₂.carrier

/--
Addition is defined only within a carrier.
This is structural, not numerical arithmetic.
-/
def QVal.add (v₁ v₂ : QVal) (h : QVal.sameCarrier v₁ v₂) : QVal :=
  ⟨ v₁.carrier, v₁.num + v₂.num ⟩

/--
Negation preserves carrier.
-/
def QVal.neg (v : QVal) : QVal :=
  ⟨ v.carrier, -v.num ⟩

end Qspace
