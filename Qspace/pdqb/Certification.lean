import Qspace.pdqb.Lemniscate

set_option autoImplicit false

namespace Qspace
namespace pdqb

open Φ

/-- σ has a left inverse -/
theorem σ_left_inverse (x : Φ) :
  σ_inv (σ x) = x := by
  cases x <;> rfl

/-- σ has a right inverse -/
theorem σ_right_inverse (x : Φ) :
  σ (σ_inv x) = x := by
  cases x <;> rfl

/--
RPA8 structural certification.

This theorem states only structural facts:

• σ is invertible
• χ is involutive
• σ has finite order 8

No new machinery is introduced.
-/
theorem RPA8_reversible_and_contained :
  (∀ x, σ_inv (σ x) = x) ∧
  (∀ x, σ (σ_inv x) = x) ∧
  (∀ x, χ (χ x) = x) ∧
  (∀ x, iterate σ 8 x = x) := by
  exact
    ⟨σ_left_inverse,
     σ_right_inverse,
     χ_involutive,
     σ_order_eight⟩

end pdqb
end Qspace
