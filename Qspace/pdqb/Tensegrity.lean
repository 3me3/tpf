import Qspace.pdqb.Lemniscate

namespace Qspace.pdqb.Tensegrity

open Qspace.pdqb

/-
  Tensegrity as relational counterbalance.

  All admissibility arises from internal relational structure.
-/

/-- Support is the immediate torsional relation. -/
def Supports (x y : Φ) : Prop :=
  y = σ x

/-- Opposition is a distinct chirality-led second-order relation. -/
def Opposes (x y : Φ) : Prop :=
  ∃ z : Φ, z = χ x ∧ y = σ z

/-- Local tensegrity: support and opposition both exist. -/
def locallyTensegral (x : Φ) : Prop :=
  ∃ y z : Φ, Supports x y ∧ Opposes x z

/-- Global tensegrity: every phase state is locally tensegral. -/
def globallyTensegral : Prop :=
  ∀ x : Φ, locallyTensegral x

theorem local_exists (x : Φ) :
    locallyTensegral x := by
  refine ⟨σ x, σ (χ x), ?_, ?_⟩
  · rfl
  · refine ⟨χ x, rfl, rfl⟩

theorem global_tensegrity :
    globallyTensegral := by
  intro x
  exact local_exists x

end Qspace.pdqb.Tensegrity
