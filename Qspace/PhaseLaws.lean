import Qspace.Basic
import Qspace.Phase   -- wherever QPhase is defined

set_option autoImplicit false

namespace Qspace

/--
The fundamental 8-phase structure.
Phase indexing is 1–8; no zero phase exists.
-/
inductive QPhase
| φ1 | φ2 | φ3 | φ4 | φ5 | φ6 | φ7 | φ8
deriving DecidableEq

/--
Phase successor (cyclic).
-/
def next : QPhase → QPhase
| φ1 => φ2
| φ2 => φ3
| φ3 => φ4
| φ4 => φ5
| φ5 => φ6
| φ6 => φ7
| φ7 => φ8
| φ8 => φ1

/--
Phase inversion (Möbius flip).
-/
def invert : QPhase → QPhase
| φ1 => φ5
| φ2 => φ6
| φ3 => φ7
| φ4 => φ8
| φ5 => φ1
| φ6 => φ2
| φ7 => φ3
| φ8 => φ4

/--
Axiomatically: 8 steps returns identity.
(No proof required yet.)
-/
axiom next_pow_8_id (p : QPhase) :
  next (next (next (next (next (next (next (next p))))))) = p

end Qspace
