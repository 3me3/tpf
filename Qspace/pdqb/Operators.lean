/-
Qspace.pdqb.Operators

Pure symbolic PDQB operator algebra.

✱ No coordinates
✱ No ℚ, no ℝ
✱ No metrics, no distances

Just the discrete reversible operators that will
drive Q-space torsion and phase evolution.
-/

set_option autoImplicit false

namespace Qspace
namespace pdqb

/--
PDQB operators: the primitive reversible actions.

We keep them purely symbolic here.
Any geometric / coordinate interpretation belongs
in higher layers (e.g. matrix, QPoint, etc.)
-/
inductive Op where
  /-- Identity operator (do nothing). -/
  | I
  /-- `p` — swap / diagonal-flip generator. -/
  | p
  /-- `b` — reflection generator. -/
  | b
  /-- `q` — inversion generator. -/
  | q
  /-- `d` — +90°-like torsion generator. -/
  | d
  /-- `d3` — -90°-like torsion generator (formal inverse of `d`). -/
  | d3
deriving DecidableEq, Repr

/--
Formal inverse in the PDQB algebra.

We do **not** assume any coordinates here — this is
just the algebraic inverse at the operator level.
-/
def inverse : Op → Op
  | Op.I  => Op.I
  | Op.p  => Op.p      -- `p` is its own inverse
  | Op.b  => Op.b      -- `b` is its own inverse
  | Op.q  => Op.q      -- `q` is its own inverse
  | Op.d  => Op.d3
  | Op.d3 => Op.d

/--
A PDQB word is just a finite list of operators.

This will later be the vehicle for torsion / phase
composition before we prove closure and C₈-structure.
-/
abbrev Word := List Op

/--
Apply `inverse` pointwise to a PDQB word, and reverse it.

This is the natural notion of an inverse word in a
group-like setting: (abc)⁻¹ = c⁻¹ b⁻¹ a⁻¹.

We **do not** prove here that this is a group;
that comes later in the torsion/closure file.
-/
def Word.inverse (w : Word) : Word :=
  (w.reverse.map pdqb.inverse)

end pdqb
end Qspace
