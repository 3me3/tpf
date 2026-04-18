import Qspace.pdqb.Lemniscate

/-
Qspace.pdqb.RPA8

RPA8 structural certification layer.
No Std library.
No external algebra.
Pure finite structure.
-/

set_option autoImplicit false

namespace Qspace
namespace pdqb

open Φ

/-- σ has a two-sided inverse -/
theorem σ_left_inverse (x : Φ) :
  σ_inv (σ x) = x := by
  cases x <;> rfl

theorem σ_right_inverse (x : Φ) :
  σ (σ_inv x) = x := by
  cases x <;> rfl

/-- χ is involutive (already proven but restated locally) -/
theorem χ_two_sided (x : Φ) :
  χ (χ x) = x :=
  χ_involutive x

/-- Non-commutativity (torsion exists) -/
theorem torsion_exists :
  ∃ x, χ (σ x) ≠ σ (χ x) := by
  refine ⟨s1, ?_⟩
  decide

/-- Recursive closure (iterate defined for all n) -/
theorem recursive_closure (n : Nat) (x : Φ) :
  ∃ y : Φ, iterate σ n x = y := by
  exact ⟨iterate σ n x, rfl⟩

/-- Separation property -/
theorem separation (x : Φ) :
  χ x = x ∨ χ x ≠ x := by
  cases x <;> simp [χ]

/--
RPA8 kernel certification:

• σ has inverse
• χ is involutive
• torsion exists
• σ^8 = identity
-/
theorem RPA8_certified :
  (∀ x, iterate σ 8 x = x) ∧
  (∀ x, χ (χ x) = x) ∧
  (∀ x, σ_inv (σ x) = x) ∧
  (∀ x, σ (σ_inv x) = x) ∧
  (∃ x, χ (σ x) ≠ σ (χ x)) := by
  exact ⟨σ_order_eight,
         χ_involutive,
         σ_left_inverse,
         σ_right_inverse,
         torsion_exists⟩

end pdqb
end Qspace
