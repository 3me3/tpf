import Qspace.pdqb.FundamentalChiralStates

namespace Qspace.pdqb

/-- Underlying torsional substrate: linear progression by natural number accumulation. -/
def substrateProgression (start : Nat) (deltas : List Nat) : List Nat :=
  let rec go : Nat → List Nat → List Nat
  | _, [] => []
  | n, d :: ds =>
      let n' := n + d
      n' :: go n' ds
  go start deltas

/-- Apparent projection into the finite chiral state space. -/
def projectedChirality (start : Nat) (deltas : List Nat) : List FundamentalState :=
  (substrateProgression start deltas).map projectFundamental

/-- The apparent oscillatory state is the projection modulo 8 of the underlying linear torsional substrate. -/
def ProjectionLaw (start : Nat) (deltas : List Nat) : Prop :=
  projectedChirality start deltas =
    (substrateProgression start deltas).map projectFundamental

/-- This holds definitionally. -/
theorem projection_law (start : Nat) (deltas : List Nat) :
  ProjectionLaw start deltas := by
  rfl

/-- A chiral trace is always a projection of an underlying substrate progression. -/
def IsProjectedTrace (start : Nat) (deltas : List Nat) (trace : List FundamentalState) : Prop :=
  trace = projectedChirality start deltas

/-- Canonical projected trace theorem. -/
theorem projected_trace_exists (start : Nat) (deltas : List Nat) :
  ∃ trace : List FundamentalState, IsProjectedTrace start deltas trace := by
  refine ⟨projectedChirality start deltas, ?_⟩
  rfl

/-- Display mapping: 0 is interpreted as 8 (cycle completion). -/
def displayChirality (c : Nat) : Nat :=
  match c % 8 with
  | 0 => 8
  | k => k

end Qspace.pdqb
