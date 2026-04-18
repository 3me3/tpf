set_option autoImplicit false

namespace Qspace
namespace pdqb

abbrev Φ := Fin 8

def step (x : Φ) : Φ :=
  ⟨(x.val + 1) % 8,
    by
      have h : 0 < 8 := by decide
      exact Nat.mod_lt _ h⟩

def stepPow : Nat → Φ → Φ
| 0,     x => x
| n + 1, x => step (stepPow n x)

/-
Key arithmetic lemma:
If k < 8 then (k + 8) % 8 = k
-/
theorem add_eight_mod_self (k : Nat) (h : k < 8) :
  (k + 8) % 8 = k := by
  have : (k + 8) % 8 = (k % 8) := by
    simp [Nat.add_mod]
  simpa [Nat.mod_eq_of_lt h] using this

/-
Compute value of stepPow 8 on underlying Nat
-/
theorem stepPow_eight_val (x : Φ) :
  (stepPow 8 x).val = (x.val + 8) % 8 := by
  cases x with
  | mk v hv =>
      have h := add_eight_mod_self v hv
      simp [stepPow, step, h]


end pdqb
end Qspace
