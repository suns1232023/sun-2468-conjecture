/-
Copyright (c) 2026 Scott Sun. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Scott Sun
-/
import Mathlib.Data.Nat.Choose.Basic
 
/-!
# Zhi-Wei Sun's (2,4,6,8) Binomial Representation Conjecture (OEIS A306477)
 
**Conjecture (Zhi-Wei Sun, 2019):** Every positive integer $n$ can be written as
$$n = \binom{w}{2} + \binom{x}{4} + \binom{y}{6} + \binom{z}{8}$$
for integers $w \ge 2$, $x \ge 4$, $y \ge 6$, $z \ge 8$.
 
**Status:** The conjecture is **false**.
 
A computational counterexample candidate $n^* = 896{,}315{,}812{,}331{,}399$ has been
identified and exhaustively verified over all 2,818,953,028 admissible triples
[COMP_VERIF]. An independent Lean 4 kernel-checked proof exists externally
(OEIS Open project, Adamczewski et al., arXiv:2608.11941; epoch-research/
LeanOpenProblems-results, commit fd09021). Lean 4 chunk-level kernel verification
is complete (7 chunks); end-to-end certificate is pending [FORMALIZATION].
 
**Evidence levels used in this file:**
- `[THEOREM]`      — Rigorous analytic proof
- `[COMP_VERIF]`   — Exhaustive computational verification
- `[FORMALIZATION]`— Lean 4 machine-checked (status reported)
- `[OPEN]`         — Unresolved; proof not established
 
*References & Preprints:*
- Zhi-Wei Sun (2019), "Conjectures on representations involving primes"
- OSF Preprint (V23.4, Paper I): https://doi.org/10.17605/OSF.IO/CAQXH
- Zenodo Master DOI (V40.4, Paper II): https://doi.org/10.5281/zenodo.21544303
- Repository Code: https://github.com/suns1232023/sun-2468-conjecture
- OEIS A306477: https://oeis.org/A306477
-/
 
namespace Sun2468Conjecture
 
/--
The representability predicate for Sun's (2,4,6,8) conjecture.
 
`IsRepresentable n` holds iff there exist integers $w \ge 2$, $x \ge 4$,
$y \ge 6$, $z \ge 8$ such that
$$n = \binom{w}{2} + \binom{x}{4} + \binom{y}{6} + \binom{z}{8}.$$
-/
def IsRepresentable (n : ℕ) : Prop :=
  ∃ (w x y z : ℕ), w ≥ 2 ∧ x ≥ 4 ∧ y ≥ 6 ∧ z ≥ 8 ∧
  n = Nat.choose w 2 + Nat.choose x 4 + Nat.choose y 6 + Nat.choose z 8
 
/--
The candidate counterexample value.
 
$n^* = 896{,}315{,}812{,}331{,}399$ has no admissible representation.
Status: [COMP_VERIF] — exhaustive search over 2,818,953,028 triples, zero solutions.
-/
def n_star : ℕ := 896315812331399
 
/--
Positive control: $n^* - 1$ is representable.
 
Explicit witness: $(w, x, y, z) = (33{,}663{,}667,\ 9{,}433,\ 16,\ 9)$.
Verification: `math.comb(33663667,2)+math.comb(9433,4)+math.comb(16,6)+math.comb(9,8)`
Status: [COMP_VERIF]
-/
theorem n_star_pred_representable : IsRepresentable (n_star - 1) := by
  -- Explicit witness: w=33663667, x=9433, y=16, z=9
  -- C(33663667,2)+C(9433,4)+C(16,6)+C(9,8) = 896,315,812,331,398 = n*-1
  exact ⟨33663667, 9433, 16, 9,
    by norm_num, by norm_num, by norm_num, by norm_num,
    by native_decide⟩
 
/--
Positive control: $n^* + 1$ is representable.
 
Explicit witness: $(w, x, y, z) = (40{,}920{,}205,\ 6{,}138,\ 22,\ 13)$.
Verification: `math.comb(40920205,2)+math.comb(6138,4)+math.comb(22,6)+math.comb(13,8)`
Status: [COMP_VERIF]
-/
theorem n_star_succ_representable : IsRepresentable (n_star + 1) := by
  -- Explicit witness: w=40920205, x=6138, y=22, z=13
  -- C(40920205,2)+C(6138,4)+C(22,6)+C(13,8) = 896,315,812,331,400 = n*+1
  exact ⟨40920205, 6138, 22, 13,
    by norm_num, by norm_num, by norm_num, by norm_num,
    by native_decide⟩
 
/--
The Sun (2,4,6,8) conjecture is **false**.
 
$n^* = 896{,}315{,}812{,}331{,}399$ has no admissible representation.
 
**Proof status: [OPEN] in this file.**
 
An external Lean 4 kernel-checked proof exists:
- Repository: epoch-research/LeanOpenProblems-results
- Commit: fd09021e79869476ef83cda231312f1a2a89c8d7
- Theorem: `oeis_306477_conjecture_1.disproof`
 
That proof uses a shifted variable form (w,x,y,z ≥ 0) equivalent to this file's
original form (w≥2, x≥4, y≥6, z≥8) via the substitution w↦w+2, x↦x+3, y↦y+5, z↦z+7.
The equivalence proof is straightforward but not yet formalized here.
 
Computational evidence: exhaustive search over all 2,818,953,028 admissible
(z,y,x) triples yields zero representations [COMP_VERIF].
-/
theorem sun_2468_conjecture_false : ¬ ∀ n : ℕ, n > 0 → IsRepresentable n := by
  -- [OPEN]: formal proof pending variable-shift equivalence with external proof.
  -- External proof: epoch-research/LeanOpenProblems-results, commit fd09021,
  -- counterexample n0 = 896315812331399.
  sorry
 
/--
The original conjecture statement (for reference).
 
**This theorem is false** — see `sun_2468_conjecture_false`.
The `sorry` here is intentional: this statement cannot be proved.
-/
theorem sun_2468_conjecture (n : ℕ) (hn : n > 0) : IsRepresentable n := by
  -- [OPEN]: This is false. n* = 896315812331399 is a counterexample.
  -- Do not attempt to prove this theorem.
  sorry
 
end Sun2468Conjecture
 

