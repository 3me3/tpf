/-
Qspace.Algebra.C8

Canonical cyclic group of order 8, internal to Q-space.

This file does NOT touch `pdqb` or any geometric meaning.
It simply constructs a finite 8-element type with:

- total multiplication
- identity
- inverses
- a generator whose 8 powers exhaust the set

This is the abstract C8 object that pdqb is conceptually
meant to represent.
-/

set_option autoImplicit false

namespace Qspace

/--
Canonical 8-element carrier for C8.

Elements are purely symbolic:
  c0, c1, ..., c7

No geometry, no metrics.
-/
inductive C8 where
  | c0
  | c1
  | c2
  | c3
  | c4
  | c5
  | c6
  | c7
deriving DecidableEq, Repr

namespace C8

/--
Index view: C8 → ℕ, 0..7.

Purely structural; used to define the group law.
-/
def idx : C8 → Nat
  | c0 => 0
  | c1 => 1
  | c2 => 2
  | c3 => 3
  | c4 => 4
  | c5 => 5
  | c6 => 6
  | c7 => 7

/--
Canonical representative: ℕ → C8

We quotient ℕ by 8 via `n % 8`.
-/
def ofIdx (n : Nat) : C8 :=
  match n % 8 with
  | 0 => c0
  | 1 => c1
  | 2 => c2
  | 3 => c3
  | 4 => c4
  | 5 => c5
  | 6 => c6
  | _ => c7

/--
Canonical multiplication: addition mod 8 on indices.
-/
def mul (a b : C8) : C8 :=
  ofIdx (idx a + idx b)

/--
Identity element (0 in ℤ/8ℤ).
-/
def one : C8 := c0

/--
Inverse element: negation in ℤ/8ℤ represented via 8 - idx.

Note: we reduce via `% 8` inside `ofIdx`, so this is well-defined.
-/
def inv (a : C8) : C8 :=
  ofIdx ((8 - idx a) % 8)

/--
Distinguished generator: the “+1 mod 8” element.
-/
def gen : C8 := c1

/--
Power of an element (repeated multiplication).
-/
def pow (g : C8) : Nat → C8
  | 0       => one
  | Nat.succ n => mul (pow g n) g

/-
  Group structure
  ---------------

  We now show:

  1. mul is associative
  2. one is a left and right identity
  3. inv is a left inverse

  All proofs are purely symbolic and finitary;
  they use only case analysis and decidability.
-/

/--
Associativity of multiplication on C8.
-/
theorem mul_assoc (a b c : C8) :
  mul (mul a b) c = mul a (mul b c) := by
  -- Finite case bashing: 8 × 8 × 8 = 512 cases.
  -- Each case reduces to equality of closed terms; `decide` handles it.
  cases a <;> cases b <;> cases c <;> decide

/--
Left identity: 1 * a = a.
-/
theorem one_mul (a : C8) :
  mul one a = a := by
  cases a <;> decide

/--
Right identity: a * 1 = a.
-/
theorem mul_one (a : C8) :
  mul a one = a := by
  cases a <;> decide

/--
Left inverse: inv a * a = 1.
-/
theorem mul_left_inv (a : C8) :
  mul (inv a) a = one := by
  cases a <;> decide

/-
  Cyclicity
  ---------

  We now show that `gen : C8` generates all 8 elements
  via its powers `pow gen n` for 0 ≤ n < 8.
-/

/--
Explicit evaluations of powers of `gen`.
-/
theorem pow_gen_0 : pow gen 0 = c0 := by
  rfl

theorem pow_gen_1 : pow gen 1 = c1 := by
  -- pow gen 1 = mul (pow gen 0) gen
  --           = mul one gen
  --           = gen
  --           = c1
  simp [pow, gen, one, mul, idx, ofIdx]

theorem pow_gen_2 : pow gen 2 = c2 := by
  -- pow gen 2 = (c1 * c1) = c2
  simp [pow, gen, one, mul, idx, ofIdx, pow_gen_1]

theorem pow_gen_3 : pow gen 3 = c3 := by
  simp [pow, gen, one, mul, idx, ofIdx, pow_gen_2]

theorem pow_gen_4 : pow gen 4 = c4 := by
  simp [pow, gen, one, mul, idx, ofIdx, pow_gen_3]

theorem pow_gen_5 : pow gen 5 = c5 := by
  simp [pow, gen, one, mul, idx, ofIdx, pow_gen_4]

theorem pow_gen_6 : pow gen 6 = c6 := by
  simp [pow, gen, one, mul, idx, ofIdx, pow_gen_5]

theorem pow_gen_7 : pow gen 7 = c7 := by
  simp [pow, gen, one, mul, idx, ofIdx, pow_gen_6]

/--
Compact “generator” predicate:
`g` is a generator if its powers 0..7 hit every element.
-/
def isGenerator (g : C8) : Prop :=
  ∀ x : C8, ∃ n : Nat, n < 8 ∧ pow g n = x

/--
The distinguished element `gen` = c1 is a generator:
its first 8 powers exhaust all 8 elements.
-/
theorem gen_isGenerator : isGenerator gen := by
  intro x
  -- Prove surjectivity by explicit cases.
  cases x with
  | c0 =>
      refine ⟨0, ?_, ?_⟩
      · decide
      · exact pow_gen_0
  | c1 =>
      refine ⟨1, ?_, ?_⟩
      · decide
      · exact pow_gen_1
  | c2 =>
      refine ⟨2, ?_, ?_⟩
      · decide
      · exact pow_gen_2
  | c3 =>
      refine ⟨3, ?_, ?_⟩
      · decide
      · exact pow_gen_3
  | c4 =>
      refine ⟨4, ?_, ?_⟩
      · decide
      · exact pow_gen_4
  | c5 =>
      refine ⟨5, ?_, ?_⟩
      · decide
      · exact pow_gen_5
  | c6 =>
      refine ⟨6, ?_, ?_⟩
      · decide
      · exact pow_gen_6
  | c7 =>
      refine ⟨7, ?_, ?_⟩
      · decide
      · exact pow_gen_7

/--
Summary:

- (C8, mul, one, inv) is a finite group.
- gen : C8 is a generator.
- Therefore C8 is (by definition) a cyclic group of order 8.

This is the canonical C8 object inside Q-space.
-/
theorem is_cyclic_of_order_8 :
  ∃ g : C8, isGenerator g := by
  exact ⟨gen, gen_isGenerator⟩

end C8

end Qspace
