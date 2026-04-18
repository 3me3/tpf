import Qspace.pdqb.Lemniscate
import Qspace.pdqb.RPA8   -- needed for torsion_exists

/-
Qspace.pdqb.Mutation

Minimal ordered mutation structure for RPA8.

• Primitive operators
• Closure under composition
• Reversibility
• Containment
• Non-commutativity witness
-/

set_option autoImplicit false

namespace Qspace
namespace pdqb

open Φ

/-- Primitive mutations. -/
inductive Prim where
  | sigma
  | sigma_inv
  | chi

/-- Interpret primitive as endomorphism of Φ. -/
def interp : Prim → Φ → Φ
  | Prim.sigma     => σ
  | Prim.sigma_inv => σ_inv
  | Prim.chi       => χ

/-- Admissible mutations: finite compositions of primitives. -/
inductive Admissible : (Φ → Φ) → Prop
  | id :
      Admissible (fun x => x)
  | prim (p : Prim) :
      Admissible (interp p)
  | comp {f g : Φ → Φ} :
      Admissible f →
      Admissible g →
      Admissible (fun x => f (g x))

/-- Primitive reversibility. -/
theorem prim_reversible (p : Prim) :
  ∃ q : Prim,
    ∀ x, interp q (interp p x) = x := by
  cases p with
  | sigma =>
      exact ⟨Prim.sigma_inv, by intro x; cases x <;> rfl⟩
  | sigma_inv =>
      exact ⟨Prim.sigma, by intro x; cases x <;> rfl⟩
  | chi =>
      exact ⟨Prim.chi, by intro x; cases x <;> rfl⟩

/-- Admissible mutations preserve Φ (typed closure). -/
theorem admissible_closed
  (f : Φ → Φ) ( _ : Admissible f) :
  ∀ x : Φ, ∃ y : Φ, f x = y := by
  intro x
  exact ⟨f x, rfl⟩

/-- Ordered non-commutativity witness. -/
theorem mutation_noncomm :
  ∃ x, χ (σ x) ≠ σ (χ x) :=
  torsion_exists

end pdqb
end Qspace
