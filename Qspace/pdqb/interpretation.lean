/-
Qspace.pdqb.interpretation

This file establishes a formal correspondence between
pdqb operators and rational matrices.

⚠️ This is NOT a proof.
⚠️ This is NOT executable semantics.
⚠️ This file introduces NO instances.

It exists only to *name the mapping*.
-/

import Qspace.Basic
import Qspace.pdqb.pdqb
import Qspace.pdqb.matrix

namespace Qspace
namespace pdqb

/--
Interpret a pdqb operator as a rational matrix.

This is an explicit lookup —
no inference, no algebra, no evaluation.
-/
def toMatrix : Op → Matrix
  | Op.I  => I
  | Op.p  => p
  | Op.b  => b
  | Op.q  => q
  | Op.d  => d
  | Op.d3 => d3

end pdqb
end Qspace
