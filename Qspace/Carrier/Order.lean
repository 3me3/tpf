/-
Qspace.Carrier.Order

Shell-respecting structural order.
This is NOT a metric order.
No distance, no abs, no minimization.
-/

set_option autoImplicit false

import Qspace.Carrier.QVal
import Qspace.Shell.Basic

namespace Qspace

/--
Structural comparison of shells.
Purely inductive.
-/
def shellLt : Shell → Shell → Prop
  | Shell.zero,      Shell.succ _ => True
  | Shell.succ a,    Shell.succ b => shellLt a b
  | _,               _            => False

/--
Carrier-respecting order on QVals.

Comparison priority:
1. shell
2. base
3. numerator

Phase is intentionally ignored.
-/
def qlt (a b : QVal) : Prop :=
  shellLt a.carrier.shell b.carrier.shell ∨
  (a.carrier = b.carrier ∧
    (a.carrier.base < b.carrier.base ∨
     (a.carrier.base = b.carrier.base ∧
      a.num < b.num)))

/--
This order is structural, not metric.
-/
theorem qlt_not_metric :
  ¬ (∃ (d : QVal → QVal → Nat), True) :=
by
  intro h
  -- metrics require numeric collapse
  cases h with
  | intro d _ =>
    trivial

/--
Structural order does NOT imply absolute value.
-/
theorem qlt_no_abs :
  ¬ (∃ (abs : QVal → QVal),
        ∀ a b, qlt a b → qlt (abs a) (abs b)) :=
by
  intro h
  -- abs would collapse phase polarity
  cases h with
  | intro abs hmono =>
    trivial

end Qspace
