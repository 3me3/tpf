# Tensegric Possibility Field (TPF)

A formally verified generative kernel implemented in Lean 4.

## What This Is

TPF is a finite, closed, deterministic algebraic system built from three primitives:

- **Finite phase space** — 8 discrete states (`Fin 8`)
- **Torsional progression** (σ) — a deterministic successor of order 8
- **Chirality involution** (χ) — a structural reflection of order 2

The algebra is simultaneously commutative and non-commutative. At the algebraic level, composition is abelian (C8). At the process level, ordered state mutation produces structurally distinct outcomes — the sequence in which sigma and chi are applied matters. This coexistence is the generative principle.

## What It Proves

All results are mechanically verified by the Lean 4 kernel:

- Torsion closure (sigma8 = id)
- Chirality involution (chi2 = id)
- Exact reversibility
- Dihedral relation (chi sigma chi = sigma-inverse)
- Algebra-level commutativity
- Process-level non-commutativity
- Finite state conservation
- Conserved weighted chiral current
- Involutive collapse
- Reversible directed mutation
- Deletion without energy cost — no entropy bookkeeping
- No annihilation
- Classical projection channels (Pell and Fibonacci sequences as stride choices on the phase ring)

## What It Does Not Admit

The kernel excludes the following as primitives. None appear anywhere in the formal system:

- Zero
- Infinity
- Irrational numbers (including pi and phi)
- Imaginary numbers
- Probability
- Entropy
- Metric distance
- Time
- Floating point or decimal representation
- Continuous limits
- Annihilation or absorbing states

These may exist as projection targets in external observation spaces. They are not part of the substrate. Any critique of the kernel that relies on one of these concepts operates in a different axiom set from the system it is examining.

## Architecture

This kernel is entirely self-constructing. It builds from bare Lean 4 with:

- No imports. No Mathlib. No external libraries. No borrowed definitions. No shared dependencies. Every type, every operator, every theorem is defined and proven internally.
- No axioms beyond the Lean 4 core type theory.
- No sorry. No admit. No deferred proofs. No escape hatches.
- No floating point. All arithmetic is exact integer or exact rational.

The entire logical chain from primitive definition to final theorem is visible, auditable, and mechanically verified. There is nowhere for hidden assumptions to enter. To our knowledge, a self-constructing Lean 4 kernel of this scope — spanning torsion algebra, chirality dynamics, conservation laws, and classical number theory projection — without any external imports, is without precedent.

## Build

    lake build

Requires Lean 4 (toolchain specified in lean-toolchain). The build completes with zero errors, zero warnings, and zero admits.

## Projection Principle

Classical mathematical structures are admissible only as homomorphic images of kernel relations. Projection is one-way (kernel to observation), structure-preserving, and non-generative. The kernel is not interpreted through external frameworks. External frameworks are recovered as projections of the kernel.
