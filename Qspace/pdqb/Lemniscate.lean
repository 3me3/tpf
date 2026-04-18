/-
Qspace.pdqb.Lemniscate

Discrete lemniscate monodromy kernel.

No ℝ.
No angles.
No metrics.
Pure finite torsion + chirality.
-/

set_option autoImplicit false

namespace Qspace
namespace pdqb

/-- Phase space: 8 discrete lemniscate states -/
inductive Φ
| s0 | s1 | s2 | s3 | s4 | s5 | s6 | s7
deriving DecidableEq, Repr

open Φ

/-- Traversal operator σ (cyclic successor) -/
def σ : Φ → Φ
| s0 => s1
| s1 => s2
| s2 => s3
| s3 => s4
| s4 => s5
| s5 => s6
| s6 => s7
| s7 => s0

/-- Seam involution χ (branch swap) -/
def χ : Φ → Φ
| s0 => s0
| s1 => s7
| s2 => s6
| s3 => s5
| s4 => s4
| s5 => s3
| s6 => s2
| s7 => s1

/-- Function iteration -/
def iterate (f : Φ → Φ) : Nat → Φ → Φ
| 0,     x => x
| Nat.succ n, x => f (iterate f n x)

/-- σ has order 8 -/
theorem σ_order_eight (x : Φ) :
  iterate σ 8 x = x := by
  cases x <;> rfl

/-- χ is involutive -/
theorem χ_involutive (x : Φ) :
  χ (χ x) = x := by
  cases x <;> rfl

/-- Explicit inverse of σ -/
def σ_inv : Φ → Φ
| s0 => s7
| s1 => s0
| s2 => s1
| s3 => s2
| s4 => s3
| s5 => s4
| s6 => s5
| s7 => s6

/-- Chirality reversal law: χ σ χ = σ⁻¹ -/
theorem χ_reverses (x : Φ) :
  χ (σ (χ x)) = σ_inv x := by
  cases x <;> rfl

/-- Dihedral relations packaged together -/
theorem dihedral_relations :
  (∀ x, iterate σ 8 x = x) ∧
  (∀ x, χ (χ x) = x) ∧
  (∀ x, χ (σ (χ x)) = σ_inv x) := by
  exact ⟨σ_order_eight, χ_involutive, χ_reverses⟩

end pdqb
end Qspace
