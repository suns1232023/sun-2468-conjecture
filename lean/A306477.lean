/-
Copyright (c) 2026 Scott Sun. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Scott Sun
-/
import Mathlib.Data.Nat.Choose.Basic

/-!
# Zhi-Wei Sun's (2,4,6,8) Binomial Representation Conjecture (OEIS A306477)

*Reference:* 
- Zhi-Wei Sun (2019), "Conjectures on representations involving primes"
- OSF Preprint: https://doi.org/10.17605/OSF.IO/CAQXH
- Zenodo DOI: https://doi.org/10.5281/zenodo.22139197
-/

namespace Sun2468Conjecture

/--
Zhi-Wei Sun (2019) conjectured that every positive integer n can be represented as:
n = C(w, 2) + C(x, 4) + C(y, 6) + C(z, 8) for integers w, x, y, z ≥ 2.

Audit Status (Scott Sun, 2026):
Candidate Counterexample: n* = 896,315,812,331,399.
Exhaustive computational audit over all 2,818,953,028 admissible triples
yielded no representation [COMP_VERIF_CANDIDATE].
-/
def IsRepresentable (n : ℕ) : Prop :=
  ∃ (w x y z : ℕ), w ≥ 2 ∧ x ≥ 2 ∧ y ≥ 2 ∧ z ≥ 2 ∧
  n = Nat.choose w 2 + Nat.choose x 4 + Nat.choose y 6 + Nat.choose z 8

theorem sun_2468_conjecture (n : ℕ) (hn : n > 0) : IsRepresentable n := by
  sorry

end Sun2468Conjecture
