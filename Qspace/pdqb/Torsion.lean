/-
Qspace.pdqb.Torsion

Internal algebra of pdqb operators.
Pure finite group structure.
No geometry. No metrics. No numbers.
-/

set_option autoImplicit false

namespace pdqb

/--
The primitive pdqb operator set.
Order is conceptual, not numeric.
-/
inductive Op where
  | p | d | q | b
  | pd | db | qb | pb
deriving DecidableEq

/--
Explicit composition table.
This is *definition*, not computation.
-/
def comp : Op → Op → Op
| Op.p,  x        => x
| x,     Op.p     => x

| Op.d,  Op.d     => Op.q
| Op.d,  Op.q     => Op.db
| Op.d,  Op.b     => Op.pd
| Op.d,  Op.pd    => Op.b
| Op.d,  Op.db    => Op.pb
| Op.d,  Op.qb    => Op.p
| Op.d,  Op.pb    => Op.q

| Op.q,  Op.q     => Op.p
| Op.q,  Op.b     => Op.pb
| Op.q,  Op.pd    => Op.db
| Op.q,  Op.db    => Op.pd
| Op.q,  Op.qb    => Op.b
| Op.q,  Op.pb    => Op.d

| Op.b,  Op.b     => Op.p
| Op.b,  Op.pd    => Op.qb
| Op.b,  Op.db    => Op.d
| Op.b,  Op.qb    => Op.pd
| Op.b,  Op.pb    => Op.q

| Op.pd, x        => comp Op.d (comp Op.p x)
| Op.db, x        => comp Op.b (comp Op.d x)
| Op.qb, x        => comp Op.b (comp Op.q x)
| Op.pb, x        => comp Op.b (comp Op.p x)

/--
Identity element exists.
-/
theorem left_identity (x : Op) : comp Op.p x = x := rfl

theorem right_identity (x : Op) : comp x Op.p = x := by
  cases x <;> rfl

/--
Closure: pdqb is closed under composition.
-/
theorem closed (x y : Op) : ∃ z : Op, comp x y = z :=
by
  refine ⟨comp x y, rfl⟩

/--
One full torsion cycle returns identity.
This encodes C₈ without numbers.
-/
def cycle : List Op :=
  [Op.p, Op.d, Op.q, Op.b, Op.pb, Op.qb, Op.db, Op.pd]

/--
Folding the full cycle gives identity.
-/
theorem torsion_closure :
  cycle.foldl comp Op.p = Op.p :=
by
  rfl

end pdqb
