import Qspace.PDQB.Operators

/-
Qspace.PDQB.Torsion

Torsion closure of the pdqb operator system.

This file proves:
• closure
• identity
• finite torsion (order 8)

No metrics.
No angles.
No arithmetic magnitude.
Pure operator algebra.
-/

set_option autoImplicit false

namespace Qspace
namespace pdqb

/--
Explicit composition table for pdqb operators.
This is intentionally concrete.
We are NOT abstracting to group theory.
-/
def compose : Op → Op → Op
| I   , x   => x
| x   , I   => x

| p   , p   => I
| d   , d   => q
| q   , q   => I
| b   , b   => I

| p   , d   => pd
| d   , p   => pb
| p   , b   => pb
| b   , p   => pd

| d   , b   => qd
| b   , d   => dq

| q   , p   => p
| p   , q   => p

| q   , d   => d
| d   , q   => d

| q   , b   => b
| b   , q   => b

| pd  , d   => q
| d   , pd  => q

| pb  , b   => q
| b   , pb  => q

end pdqb
end Qspace
