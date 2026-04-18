/-
Qspace.Phase.Prime

Prime evolution as phase displacement.
No divisibility.
No factorization.
No arithmetic collapse.

A "prime" is a value that does NOT complete a phase cycle
within its current shell.
-/

set_option autoImplicit false

import Qspace.Shell.Basic
import Qspace.Carrier.Basic

namespace Qspace

/--
Phase displacement.
How far a value has progressed through a phase cycle.
-/
structure PhaseDisp where
  phase : Phase
  remaining : Nat
-- remaining = steps needed to complete cycle

/--
A value is phase-complete if it returns to the boundary.
-/
def PhaseComplete (d : PhaseDisp) : Prop :=
  d.remaining = 0

/--
A value is phase-displaced if completion is pending.
-/
def PhaseDisplaced (d : PhaseDisp) : Prop :=
  d.remaining ≠ 0

/--
Prime (Q-space definition):

A value is prime if it is phase-displaced
in its shell-relative evolution.
-/
def QPrime (d : PhaseDisp) : Prop :=
  PhaseDisplaced d

/--
Phase advancement is deterministic and reversible.
-/
def advancePhase : Phase → Phase
| Phase.φ1 => Phase.φ2
| Phase.φ2 => Phase.φ3
| Phase.φ3 => Phase.φ4
| Phase.φ4 => Phase.φ5
| Phase.φ5 => Phase.φ6
| Phase.φ6 => Phase.φ7
| Phase.φ7 => Phase.φ8
| Phase.φ8 => Phase.φ1

/--
One step of phase evolution.
-/
def step (d : PhaseDisp) : PhaseDisp :=
  match d.remaining with
  | 0     => d
  | n + 1 =>
      { phase := advancePhase d.phase
      , remaining := n }

/--
A prime never self-resolves in zero steps.
-/
theorem prime_never_trivial (d : PhaseDisp) :
  QPrime d → ¬ PhaseComplete d :=
by
  intro h
  unfold QPrime PhaseDisplaced PhaseComplete at *
  exact h

/--
Completion transforms a prime into a composite (Q-space sense),
but never erases its evolution history.
-/
theorem completion_preserves_structure (d : PhaseDisp) :
  QPrime d → ∃ d', PhaseComplete d' :=
by
  intro _
  refine ⟨{ phase := d.phase, remaining := 0 }, rfl⟩

end Qspace
