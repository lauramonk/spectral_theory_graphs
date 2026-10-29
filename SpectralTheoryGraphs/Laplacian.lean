/-
Copyright (c) 2020 Laura Monk. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Asma Hassannezhad, Laura Monk
-/

import Mathlib.Combinatorics.SimpleGraph.AdjMatrix
import Mathlib.Combinatorics.SimpleGraph.Finite

open Matrix SimpleGraph

/- We added this instance to coerce matrices provided the types of their arguments coerce. -/
instance (m n α β : Type*) [∀ a : α, CoeT α a β] (M : Matrix m n α): CoeT (Matrix m n α) M (Matrix m n β) where
  coe := M.map (↑)

namespace SimpleGraph

variable {V : Type*}

variable (G : SimpleGraph V) [DecidableEq V] [LocallyFinite G]

section degMatrix

/-- `degMatrix G` is the matrix `D` such that `D v w = degree v` if `v = w` and otherwise
  `A v w = 0`. -/
def degMatrix : Matrix V V ℕ :=
  diagonal (fun v ↦ G.degree v)

@[simp]
lemma degMatrix_apply_eq (v : V) : G.degMatrix v v = G.degree v :=
  diagonal_apply_eq ..

lemma degMatrix_apply_ne {v w : V} (h : v ≠ w) : G.degMatrix v w = 0 :=
  diagonal_apply_ne _ h

end degMatrix

section lapMatrix

variable [DecidableRel G.Adj]

/-- `lapMatrix G` is the matrix `L` with integer coefficients such that `L = D - A` where `D` is the
degree matrix and `A` is the adjacency matrix. -/
def lapMatrix : Matrix V V ℤ := G.degMatrix - G.adjMatrix ℤ

@[simp]
lemma lapMatrix_apply (v w : V) : G.lapMatrix v w = G.degMatrix v w - G.adjMatrix ℤ v w := by rfl

lemma lapMatrix_apply_eq (v : V) : G.lapMatrix v v = G.degree v := by
  simp

lemma lapMatrix_apply_ne {v w : V} (h : v ≠ w) : G.lapMatrix v w = - G.adjMatrix ℤ v w := by
  simp
  apply degMatrix_apply_ne _ h

end lapMatrix
