/-
Qspace.pdqb.compose

Explicit composition of rational PDQB matrices.

No instances.
No simp.
No rewriting.
No algebraic hierarchy.

This is symbolic wiring only.
-/

import Qspace.pdqb.matrix

namespace Qspace
namespace pdqb

/--
Explicit matrix composition (left action).

This is NOT declared as multiplication.
It is just a function.
-/
def compose (A B : Matrix) : Matrix :=
  ⟨
    A.a * B.a + A.b * B.c,
    A.a * B.b + A.b * B.d,
    A.c * B.a + A.d * B.c,
    A.c * B.b + A.d * B.d
  ⟩

end pdqb
end Qspace
