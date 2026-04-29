# Tensegric Possibility Field (TPF)

A formally verified generative kernel implemented in Lean 4.

Toolchain: `leanprover/lean4` (version in `lean-toolchain`). Build: `lake build`. Zero errors, zero warnings, zero admits, zero `sorry`. 67 modules. 38 build jobs.

---

## What this is

TPF is a finite, closed, deterministic algebraic system built from bare Lean 4 type theory. The kernel defines its own primitives, proves its theorems from them, and compiles clean. No imports. No Mathlib. No external libraries. No borrowed axioms. No `sorry`. No admits.

The kernel is constructed below the level at which classical mathematical primitives are introduced. From its own four primitives, the kernel derives a sequence of structural results that classical mathematics carries as separate constructions. Each is mechanically verified by the Lean kernel.

---

## Primitives

The kernel admits only:

- A finite phase space of eight elements (`Fin 8`)
- A torsional progression operator σ of order 8
- An involutive chirality operator χ of order 2
- The named cancellation identity `n × k / n = k` for `n > 0`

Everything else is constructed.

---

## What the kernel produces

Each of the following is derived inside the kernel from its own primitives, Lean-certified, and compiled clean. Computation throughout is exact integer or exact rational arithmetic.

**Pell and Fibonacci sequences.** Both sequences appear in the kernel as two stride choices on a single structural object — the eight-state phase ring. Conventional treatment derives each from its own recurrence relation; the kernel derives both from one underlying structure by selecting different traversal strides.

**The cancellation identity, and the absence of negative numbers as primitives.** `n × k / n = k` and `n × (n+1) / n = n+1`, for `n > 0`, named as theorems and proved against the kernel's own arithmetic. The structural significance is sharper than it first appears. Conventional arithmetic introduces negation to close the natural numbers under subtraction, producing the integers, and from there the rationals, the reals, and the complex numbers — each closure carrying the previous one's commitments forward. The kernel does not take the first step. By naming multiplicative cancellation directly as a structural identity, the kernel obtains exact rational arithmetic without needing additive inverse as a primitive operation, and therefore without needing negative numbers as primitive objects. The chirality involution χ produces what observation reads as negation when projected to `{−1, +1}`, but χ is an orientation involution, not arithmetic negation. The kernel's substrate is the demonstration that a formal system capable of producing the structural results above can be built without negation at the foundation. Module: `Qspace/pdqb/RationalCore.lean`.

**A conserved weighted chiral current.** The current `J = Σ wᵢ · s(φᵢ)`, where `wᵢ` is the integer weight on the `i`-th node and `s` is the chirality sign function (+1 on phases 1–4, −1 on phases 5–8), is proved invariant under composition, collapse, and reversible rollback. The conservation is structural and proved in Lean against the algebra's own definitions, with no continuous symmetry argument required.

**Process-level non-commutativity on a commutative algebra.** At the algebraic level, composition under σ is abelian (C₈). The dihedral relation `χσχ = σ⁻¹` is proved. The kernel additionally formalises directed state mutation as an ordered process, and proves that two mutation sequences whose composition equals as algebra elements can produce structurally distinct mutated states. The non-commutativity at the mutation level is sharper than the standard observation that the dihedral group is non-abelian.

**Reversibility without entropy bookkeeping.** Every operation in the kernel has an explicit inverse, proven to compose to the identity. Deletion of structural elements is reversible by construction. No entropy variable accumulates because the kernel admits no entropy variable. The classical association of irreversible operations with thermodynamic cost does not arise — irreversibility is not present to be costed.

These results are checkable. The kernel compiles. The reader who would dispute any production has to dispute it on the kernel's own terms — which means engaging with the Lean source rather than with the framing.

---

## The substrate floor

The kernel is built on bare Lean type theory with no imports. This is structural commitment, not engineering minimalism.

The substrate admits exactly what the foundation requires. The cancellation identity, the eight-state phase space, the torsion operator, the chirality involution. From these, by lawful construction, every production above is derived.

The substrate admits no metric, because a metric requires a distance function on the reals, and the reals are constructions that admit projection from the substrate rather than primitives the substrate presupposes. The substrate admits no probability, because a probability measure requires a sigma-algebra over the reals. The substrate admits no irrational primitive, because an irrational requires a completion of a rational sequence, which is itself a projection of the substrate at a coarser grain.

The substrate is constructed below the level of those further constructions. Where the kernel produces them at all, they are produced as projections — one-way, structure-preserving, non-generative.

---

## What the kernel does not admit

These are not in the substrate as primitives:

- Zero as ontological state
- Infinity as ontological state
- Irrational numbers including π, e, √2, φ as continuous quantity
- Imaginary numbers
- Probability
- Entropy
- Metric distance
- Time
- Floating point or decimal representation
- Continuous limits
- Annihilation or absorbing states

These may exist as projection targets in external observation spaces. They are not part of the substrate. They are not excluded by stipulation; they are absent because they require constructions the substrate is built below.

---

## The projection principle

A classical structure is admissible only as the homomorphic image of a kernel relation.

- Projection is one-way: kernel into observation space.
- Projection is structure-preserving.
- Projection is non-generative — the projection does not define the kernel.

Classical mathematics is recovered. It does not interpret the kernel. The kernel projects into it.

---

## Build

    lake build

Requires Lean 4 (toolchain specified in `lean-toolchain`). The build completes with zero errors, zero warnings, zero admits, and zero `sorry` across 38 jobs covering 67 modules.

---

## Position

The kernel sits at the level beneath the constructions classical mathematics treats as primitive. Classical mathematics and physics describe observed behaviour. The kernel generates the structural conditions from which such behaviour, observed and measured, can be recovered as lawful projection.

---

## For the curious

The kernel as published is in `Qspace/`. The reader who clones the repository and runs `lake build` will find 67 modules compiling clean across 38 build jobs. Each production above corresponds to a module named in the source.
