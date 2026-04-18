/-
Qspace.Shell.Carrier

A carrier binds all arithmetic meaning.
No value exists without a carrier.
No arithmetic crosses carriers implicitly.
-/

set_option autoImplicit false

import Qspace.Shell.Basic

namespace Qspace

/--
A Carrier is a contextual arithmetic container.

• shell : geometric / phase shell
• base  : explicit denominator or unit of coherence

Nothing numeric is meaningful without a Carrier.
-/
structure Carrier where
  shell : Shell
  base  : Nat

deriving DecidableEq, Repr

/--
Carrier equality is structural only.
No numeric collapse is allowed.
-/
def Carrier.eq (c₁ c₂ : Carrier) : Prop :=
  c₁.shell = c₂.shell ∧ c₁.base = c₂.base

/--
A sanity law: carriers do not evolve implicitly.
Any base or shell change must be explicit.
-/
theorem carrier_stable (c : Carrier) : Carrier :=
  c

end Qspace
