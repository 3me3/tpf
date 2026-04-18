/-
Qspace.Memory.Pattern

Minimal pattern type for Q-Lean v0.3.

No metrics.
No similarity.
No distance.
Patterns are just finite lists of Q-cells.
-/

set_option autoImplicit false

import Qspace.Carrier.QVal

namespace Qspace
namespace Memory

/-- For now, a Q-cell is just a QVal in a carrier. -/
abbrev QCell := QVal

/--
A finite Q-space pattern.

We do NOT assume any geometry or metric.
Just a list of cells.
-/
structure QPattern where
  cells : List QCell
deriving DecidableEq, Repr

end Memory
end Qspace
