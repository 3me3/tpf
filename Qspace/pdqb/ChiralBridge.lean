/-
  =============================

  Exact finite bridge from internal sequence structure
  to chirally alternating attractor identities.

  Only:
    • integer identities
    • evaluated structure
-/

import Qspace.pdqb.Sequences

open Qspace.pdqb.Sequences

-- ============================================
-- SECTION 1: Handedness carrier
-- ============================================

inductive Handedness where
  | L
  | D
deriving DecidableEq, Repr

def flipHand : Handedness → Handedness
  | Handedness.L => Handedness.D
  | Handedness.D => Handedness.L

-- ============================================
-- SECTION 2: Fibonacci bridge identity
-- ============================================

def fibBridgeExpr (n : Nat) : Int :=
  (fib (n+1) : Int) * (fib (n+1) : Int)
  - (fib (n+1) : Int) * (fib n : Int)
  - (fib n : Int) * (fib n : Int)

theorem fibBridge_1 : fibBridgeExpr 1 = -1 := by native_decide
theorem fibBridge_2 : fibBridgeExpr 2 = 1 := by native_decide
theorem fibBridge_3 : fibBridgeExpr 3 = -1 := by native_decide
theorem fibBridge_4 : fibBridgeExpr 4 = 1 := by native_decide

-- ============================================
-- SECTION 3: Pell bridge identity
-- ============================================

def pellBridgeExpr (n : Nat) : Int :=
  (pellComp n : Int) * (pellComp n : Int)
  - 2 * (pell n : Int) * (pell n : Int)

theorem pellBridge_1 : pellBridgeExpr 1 = -1 := by native_decide
theorem pellBridge_2 : pellBridgeExpr 2 = 1 := by native_decide
theorem pellBridge_3 : pellBridgeExpr 3 = -1 := by native_decide
theorem pellBridge_4 : pellBridgeExpr 4 = 1 := by native_decide

-- ============================================
-- SECTION 4: Extract handedness
-- ============================================

def fibHand (n : Nat) : Handedness :=
  if fibBridgeExpr n = 1 then Handedness.L else Handedness.D

def pellHand (n : Nat) : Handedness :=
  if pellBridgeExpr n = 1 then Handedness.L else Handedness.D

theorem fibHand_1 : fibHand 1 = Handedness.D := by native_decide
theorem fibHand_2 : fibHand 2 = Handedness.L := by native_decide
theorem fibHand_3 : fibHand 3 = Handedness.D := by native_decide
theorem fibHand_4 : fibHand 4 = Handedness.L := by native_decide

theorem pellHand_1 : pellHand 1 = Handedness.D := by native_decide
theorem pellHand_2 : pellHand 2 = Handedness.L := by native_decide
theorem pellHand_3 : pellHand 3 = Handedness.D := by native_decide
theorem pellHand_4 : pellHand 4 = Handedness.L := by native_decide

