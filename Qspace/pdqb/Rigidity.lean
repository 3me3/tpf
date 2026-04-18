/-
Qspace.pdqb.Rigidity

Minimal DL-based torsion kernel with required 0.4 corollaries.

No arithmetic.
No permutations.
Pure finite structure.
-/

set_option autoImplicit false

namespace Qspace
namespace pdqb

/-- Phase index: explicit 8-cycle. -/
inductive Φ where
  | p0 | p1 | p2 | p3 | p4 | p5 | p6 | p7
deriving DecidableEq, Repr

/-- Chirality: dextral / levorotatory. -/
inductive Chirality where
  | D
  | L
deriving DecidableEq, Repr

/-- Forward torsion. -/
def σ : Φ → Φ
  | Φ.p0 => Φ.p1
  | Φ.p1 => Φ.p2
  | Φ.p2 => Φ.p3
  | Φ.p3 => Φ.p4
  | Φ.p4 => Φ.p5
  | Φ.p5 => Φ.p6
  | Φ.p6 => Φ.p7
  | Φ.p7 => Φ.p0

/-- Reverse torsion. -/
def σ_inv : Φ → Φ
  | Φ.p0 => Φ.p7
  | Φ.p1 => Φ.p0
  | Φ.p2 => Φ.p1
  | Φ.p3 => Φ.p2
  | Φ.p4 => Φ.p3
  | Φ.p5 => Φ.p4
  | Φ.p6 => Φ.p5
  | Φ.p7 => Φ.p6

/-- Chirality flip. -/
def flip : Chirality → Chirality
  | Chirality.D => Chirality.L
  | Chirality.L => Chirality.D

/-- Basic reversibility. -/
theorem sigma_inverse (x : Φ) :
  σ_inv (σ x) = x := by
  cases x <;> rfl

/-- Iteration helper. -/
def iterate (f : Φ → Φ) : Nat → Φ → Φ
  | 0,     x => x
  | n + 1, x => f (iterate f n x)

/-- Order-8 torsion closure. -/
theorem sigma_order_8 (x : Φ) :
  iterate σ 8 x = x := by
  cases x <;> rfl

/-- Chirality involution. -/
theorem flip_involution (c : Chirality) :
  flip (flip c) = c := by
  cases c <;> rfl

/-- Minimal state structure. -/
structure State where
  phase : Φ
  chi   : Chirality
deriving DecidableEq, Repr

/-- Minimal separation principle. -/
theorem separation (s₁ s₂ : State) :
  s₁.phase = s₂.phase →
  s₁.chi = s₂.chi →
  s₁ = s₂ := by
  intro h1 h2
  cases s₁
  cases s₂
  cases h1
  cases h2
  rfl

end pdqb
end Qspace
