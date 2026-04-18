/-
Qspace.Carrier.Morphism

Explicit carrier morphisms.
All alignment must be declared.
No implicit base or shell collapsing.
Cancellation is NOT primitive.

This file defines:
• CarrierMorphism
• transport of QVal
• derived equivalence (≃) via morphisms
-/

set_option autoImplicit false

import Qspace.Shell.Basic
import Qspace.Carrier.Basic
import Qspace.Carrier.QVal

namespace Qspace

/--
A carrier morphism is an explicit alignment
between two carriers.

This is the ONLY way values may be compared
or transported across carriers.
-/
structure CarrierMorphism where
  src : Carrier
  tgt : Carrier

  /--
  Explicit base alignment.
  Think: denominator reconciliation.
  -/
  baseAlign : src.base → tgt.base

  /--
  Explicit shell alignment.
  Shells must be related deliberately.
  -/
  shellAlign : src.shell → tgt.shell

/--
Transport a QVal along a carrier morphism.

NOTE:
• value does NOT change
• only context changes
• this is NOT arithmetic
-/
def transport (m : CarrierMorphism) (v : QVal) : QVal :=
  { carrier :=
      { shell := m.shellAlign v.carrier.shell
        base  := m.baseAlign  v.carrier.base },
    num := v.num }

/--
Derived equivalence of QVals.

Two values are equivalent if and only if
there exists a morphism aligning their carriers
such that transport makes them definitionally equal.
-/
def QEquiv (v₁ v₂ : QVal) : Prop :=
  ∃ m : CarrierMorphism,
    m.src = v₁.carrier ∧
    m.tgt = v₂.carrier ∧
    transport m v₁ = v₂

notation v₁ " ≃ " v₂ => QEquiv v₁ v₂

/--
Reflexivity holds via identity morphism.
-/
theorem QEquiv.refl (v : QVal) : v ≃ v :=
by
  refine ⟨
    { src := v.carrier
      tgt := v.carrier
      baseAlign := fun b => b
      shellAlign := fun s => s },
    rfl, rfl, rfl
  ⟩

/--
IMPORTANT THEOREM (informal here, proven later):

There exists NO global cancellation rule.
All equivalences must factor through explicit
CarrierMorphisms.
-/
-- theorem no_global_cancellation : ...

end Qspace

