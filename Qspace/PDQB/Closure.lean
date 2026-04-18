import Qspace.PDQB.Operators

/-
Qspace.PDQB.Closure

Structural closure and torsion properties of pdqb operators.
No metrics.
No arithmetic interpretation.
No imported algebra.
-/

set_option autoImplicit false

namespace Qspace
namespace PDQB

/--
Composition of pdqb operators.
This is structural composition, not function application.
-/
def compose : Op → Op → Op
| I,   o   => o
| o,   I   => o
| p,   p   => I
| p,   d   => d3
| p,   d3  => d
| p,   b   => q
| p,   q   => b

| d,   p   => d3
| d,   d   => q
| d,   d3  => I
| d,   b   => p
| d,   q   => b

| d3,  p   => d
| d3,  d   => I
| d3,  d3  => q
| d3,  b   => p
| d3,  q   => b

| b,   p   => q
| b,   d   => p
| b,   d3  => p
| b,   b   => I
| b,   q   => p

| q,   p   => b
| q,   d   => b
| q,   d3  => b
| q,   b   => p
| q,   q   => I

/--
Closure theorem: pdqb is closed under composition.
-/
theorem compose_closed (a b : Op) : ∃ c : Op, compose a b = c :=
by
  exact ⟨compose a b, rfl⟩

end PDQB
end Qspace
