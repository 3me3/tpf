/-
  Qspace/pdqb/Sequences.lean
  ==========================

  Canonical integer sequences for bridge construction.

  No limits
  No irrational numbers
  No external mathematics

  Only:
    • finite recurrence definitions
    • exact integer relations
-/

namespace Qspace.pdqb.Sequences

-- ============================================
-- SECTION 1: Fibonacci
-- ============================================

def fib : Nat → Nat
| 0     => 0
| 1     => 1
| (n+2) => fib (n+1) + fib n

theorem fib_0 : fib 0 = 0 := rfl
theorem fib_1 : fib 1 = 1 := rfl
theorem fib_2 : fib 2 = 1 := by native_decide
theorem fib_3 : fib 3 = 2 := by native_decide
theorem fib_4 : fib 4 = 3 := by native_decide
theorem fib_5 : fib 5 = 5 := by native_decide

-- ============================================
-- SECTION 2: Pell
-- ============================================

def pell : Nat → Nat
| 0     => 0
| 1     => 1
| (n+2) => 2 * pell (n+1) + pell n

theorem pell_0 : pell 0 = 0 := rfl
theorem pell_1 : pell 1 = 1 := rfl
theorem pell_2 : pell 2 = 2 := by native_decide
theorem pell_3 : pell 3 = 5 := by native_decide
theorem pell_4 : pell 4 = 12 := by native_decide

-- ============================================
-- SECTION 3: Pell Companion
-- ============================================

def pellComp : Nat → Nat
| 0     => 1
| 1     => 1
| (n+2) => 2 * pellComp (n+1) + pellComp n

theorem pellComp_0 : pellComp 0 = 1 := rfl
theorem pellComp_1 : pellComp 1 = 1 := rfl
theorem pellComp_2 : pellComp 2 = 3 := by native_decide
theorem pellComp_3 : pellComp 3 = 7 := by native_decide
theorem pellComp_4 : pellComp 4 = 17 := by native_decide

end Qspace.pdqb.Sequences
