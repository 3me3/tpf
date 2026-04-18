/-
Qspace.Phase.Displacement

Prime evolution interpreted as phase displacement
inside shell recursion.

No divisibility.
No metrics.
No ℕ arithmetic.
Pure structural misalignment.
-/

set_option autoImplicit false

import Qspace.Shell.Basic
import Qspace.Carrier.QVal

namespace Qspace

/--
A displacement is a shell-local offset.
It is not numeric magnitude.
It measures how far a value advances inside a shell.
-/
structure Displacement where
  shell : Shell
  phase : Phase

deriving DecidableEq, Repr

/--
A phase boundary is the shell-aligned state.
By convention: φ1 is boundary entry.
-/
def isPhaseBoundary (p : Phase) : Prop :=
  p = Phase.φ1

/--
A displacement is aligned if it lands exactly on a
phase boundary of its shell.
-/
def aligned (d : Displacement) : Prop :=
  isPhaseBoundary d.phase

/--
A displacement is misaligned if it advances the shell
without landing on a boundary.
-/
def misaligned (d : Displacement) : Prop :=
  ¬ aligned d

/--
Q-space notion of primality.

A value is "prime-evolving" if its displacement
is misaligned with shell boundaries.

This replaces R-space indivisibility.
-/
def primeDisplacement (d : Displacement) : Prop :=
  misaligned d

/--
Canonical interpretation:

Values like 17/13 = 1 + 4/13 correspond to
a phase-4 displacement inside the shell.

Phase ≠ boundary ⇒ prime displacement.
-/
theorem phase_displacement_is_prime :
  ∀ d : Displacement,
    d.phase ≠ Phase.φ1 →
    primeDisplacement d :=
by
  intro d h
  unfold primeDisplacement misaligned aligned isPhaseBoundary
  exact h

/--
Boundary-aligned displacements are composite
in the Q-space sense: they close a shell phase.
-/
theorem boundary_is_not_prime :
  ∀ d : Displacement,
    d.phase = Phase.φ1 →
    ¬ primeDisplacement d :=
by
  intro d h
  unfold primeDisplacement misaligned aligned isPhaseBoundary
  exact h

/-
Interpretation:

• "Prime" means phase does not close.
• Composite means phase closure occurs.
• No factorization exists at this level.
• Arithmetic comes later (as transport).
-/

end Qspace
