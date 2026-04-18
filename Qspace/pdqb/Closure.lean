import Qspace.pdqb.Operators

set_option autoImplicit false

namespace Qspace
namespace pdqb

/-
Qspace.pdqb.Closure

Internal torsion closure for pdqb operators.
No metrics.
No arithmetic.
No group axioms.
Pure symbolic reversibility.
-/

/--
Symbolic composition of pdqb operators.
-/
def comp : Op → Op → Op
| Op.I,   o        => o
| o,      Op.I     => o

| Op.p,   Op.p     => Op.I
| Op.b,   Op.b     => Op.I
| Op.q,   Op.q     => Op.I
| Op.d,   Op.d3    => Op.I
| Op.d3,  Op.d     => Op.I

| Op.d,   Op.d     => Op.q
| Op.d3,  Op.d3    => Op.q
| Op.q,   Op.d     => Op.d3
| Op.q,   Op.d3    => Op.d

| Op.p,   Op.b     => Op.q
| Op.b,   Op.p     => Op.q

-- TODO: remaining cases must be filled for totality

end pdqb
end Qspace
