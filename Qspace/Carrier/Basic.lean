/-
Qspace.Carrier.Basic

A carrier is the minimal context in which values exist.
It binds:
- a shell (structural layer)
- a base  (explicit denominator / phase width)

No arithmetic.
No metrics.
No collapse.
-/

set_option autoImplicit false

import Qspace.Shell.Basic

namespace Qspace

/--
A carrier provides the *context* for Q-values.
-/
structure Carrier where
  shell : Shell
  base  : Nat

deriving DecidableEq, Repr

end Qspace
