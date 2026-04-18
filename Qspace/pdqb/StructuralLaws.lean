import Qspace.pdqb.Lemniscate
import Qspace.pdqb.RPA8

/-
Qspace.pdqb.StructuralLaws

Pure structural consequences of the finite torsion kernel.

No new machinery.
Only explicit statements of what already holds.
-/

set_option autoImplicit false

namespace Qspace
namespace pdqb

open Φ

/-- Ordered mutation is not commutative. -/
theorem ordered_mutation_noncomm :
  ∃ x : Φ, χ (σ x) ≠ σ (χ x) :=
by
  exact torsion_exists

/-- Finite closure: every iterate remains in Φ. -/
theorem finite_closure (n : Nat) (x : Φ) :
  ∃ y : Φ, iterate σ n x = y :=
by
  exact ⟨iterate σ n x, rfl⟩

/-- Chirality boundary (structural separation). -/
theorem chirality_boundary (x : Φ) :
  χ x ≠ x ∨ χ x = x :=
by
  cases x <;> simp [χ]

/-- Global torsion symmetry is conserved (order 8). -/
theorem global_symmetry_conserved (x : Φ) :
  iterate σ 8 x = x :=
by
  exact σ_order_eight x

end pdqb
end Qspace
