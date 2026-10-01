# Sun's (2,4,6,8) Binomial Representation Program

[![OEIS A306477](https://img.shields.io/badge/OEIS-A306477-2f6f9f)](https://oeis.org/A306477)
[![Zenodo Master DOI](https://img.shields.io/badge/Zenodo-10.5281%2Fzenodo.21544303-168AAD)](https://doi.org/10.5281/zenodo.21544303)
[![Zenodo V23.4 DOI](https://img.shields.io/badge/Zenodo-V23.4-0077B6)](https://doi.org/10.5281/zenodo.22139197)
[![OSF Repository](https://img.shields.io/badge/OSF-CAQXH-blue)](https://osf.io/caqxh)
[![ResearchGate](https://img.shields.io/badge/ResearchGate-Scott__Sun-00CCBB?logo=researchgate)](https://www.researchgate.net/profile/Scott-Sun)
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

> **This repository is the reproducibility and formalization artifact for the preprint:**
>
> Scott Sun (2026). *A Computational Audit of a Candidate Counterexample to Sun's (2,4,6,8) Conjecture: Independent Verification, Formalization Status, and Search for a Second Counterexample.* Version 40.3. Zenodo. DOI: [10.5281/zenodo.21544303](https://doi.org/10.5281/zenodo.21544303)
>
> The preprint is the primary research document. This repository provides the reference verifier, Lean 4 formalization skeleton, and supporting code. It is not an independent proof of the conjecture's failure.

**Current Repository Version: V40.4 — October 2026**
*(Tracks preprint V40.3, September 2026)*

---

## 📌 Overview

Sun's **(2,4,6,8) Binomial Representation Conjecture**, recorded in **OEIS A306477**, posits that every positive integer $n \ge 4$ can be represented as:

$$n = \binom{w}{2} + \binom{x}{4} + \binom{y}{6} + \binom{z}{8}, \quad w \ge 2,\ x \ge 4,\ y \ge 6,\ z \ge 8$$

The preprint (V40.3) reports that the candidate counterexample $n^* = 896{,}315{,}812{,}331{,}399$ has been computationally verified by 12 independent implementations and an external exhaustive checker. Lean 4 chunk-level kernel verification is complete (7 chunks); end-to-end certificate is pending.

**This repository contains:** the reference verifier (`src/verify_n_star.py`), Cantor-Pascal diagnostics (`src/cantor_diagnostic.py`), and the Lean 4 formalization skeleton (`lean/A306477.lean`). The full multi-kernel verification suite and second-counterexample search scripts are described in the preprint but are not yet fully deposited here — see the [Reproducibility Gap Table](#-reproducibility-gap-table) below.

---

## 🔬 Evidence Ladder (from preprint V40.3)

| Level | Evidence | Status |
|-------|----------|--------|
| E0 | Historical conjecture (OEIS A306477) | Established |
| E1 | Algebraic search bounds (Theorem 3.1) | **[THEOREM]** |
| E2 | Exhaustive computational search (12 kernels) | **[COMP_VERIF]** |
| E3 | Local positive controls ($R(n^*-1)=1$, $R(n^*+1)>0$) | **[COMP_VERIF]** |
| E4 | External independent checker | **[COMP_VERIF]** |
| E5 | Lean 4 chunk-level kernel checking (7 chunks) | **[FORMALIZATION]** |
| E6 | End-to-end Lean certificate | **PENDING** |
| E7 | Analytic explanation of $R(n^*)=0$ | **[OPEN]** |

### Epistemic Classification

| Label | Meaning |
|-------|---------|
| `[THEOREM]` | Rigorous analytic proof, independent of computation |
| `[COMP_VERIF]` | Exhaustive computational verification, multiple independent implementations |
| `[FORMALIZATION]` | Lean 4 machine-checked proof (status reported) |
| `[NUMERICAL]` | Empirical observation, no proof |
| `[OPEN]` | Unresolved problem |

---

## 🧭 Key Results

### 1. Candidate Counterexample `[COMP_VERIF]`

$$n^* = 896{,}315{,}812{,}331{,}399, \quad R(n^*) = 0$$

Located approximately $448\times$ beyond the prior $2 \times 10^{12}$ verification bound.

**Search space completeness `[THEOREM]`:** Any representation must satisfy:

$$z \le 281, \quad y \le 932, \quad x \le 12{,}112, \quad w \le 42{,}339{,}481$$

These bounds follow from $\binom{z}{8} \le n^*$ etc. and are strict algebraic inequalities. The integer bound $w \le 42{,}339{,}481$ is the floor of the positive real root $w_{\mathbb{R}} \approx 42{,}339{,}481.1849$ of $\binom{w}{2} = n^*$, i.e., $w(w-1)/2 = n^*$.

**Exhaustive search:** All **2,818,953,028** admissible $(z,y,x)$ triples verified; zero solutions found.

### 2. Triple-Count Reconciliation `[OPEN AUDIT TASK]`

The preprint (Section 3) reports three distinct triple counts from different implementations:

| Implementation | Triple count | Method |
|----------------|-------------|--------|
| This work (12 kernels) | 2,818,953,028 | Full exhaustive, no pre-filtering |
| External checker (tadamcz) | 2,755,643,831 | After sound residue-class pre-filters |
| Third implementation | 2,741,554,058 | Under investigation |
| Solutions found | 0 | All methods agree |

> **Note (from preprint V40.3, Section 3):** "At the time of writing, the source of these discrepancies remains under active investigation." The different counts reflect different pre-filtering strategies, all of which are sound (no valid triple is excluded). Complete reconciliation remains an open audit task.

### 3. Cross-Validation `[COMP_VERIF]`

**$R(n^*-1) = 1$** — explicit representation:

$$\binom{33{,}663{,}667}{2} + \binom{9{,}433}{4} + \binom{16}{6} + \binom{9}{8} = n^* - 1$$

One-line verification: `math.comb(33663667,2)+math.comb(9433,4)+math.comb(16,6)+math.comb(9,8)`

**$R(n^*+1) > 0$** — explicit representation (computed for this repository):

$$\binom{40{,}920{,}205}{2} + \binom{6{,}138}{4} + \binom{22}{6} + \binom{13}{8} = n^* + 1$$

One-line verification: `math.comb(40920205,2)+math.comb(6138,4)+math.comb(22,6)+math.comb(13,8)`

These positive controls confirm that the search algorithm correctly identifies representations for $n^*-1$ and $n^*+1$, bracketing the gap at $n^*$.

### 4. Discriminant Framework `[THEOREM]`

For fixed $(x,y,z)$, set $D = 8(n^* - \binom{x}{4} - \binom{y}{6} - \binom{z}{8}) + 1$. Then $D \equiv 1 \pmod{8}$, and since odd squares satisfy $s^2 \equiv 1 \pmod{8}$, the gap $\delta_D := D - s_0^2 \equiv 0 \pmod{8}$. If $\delta_D \ne 0$, then $|\delta_D| \ge 8$.

**Note:** This is a reformulation of the search criterion, not an independent obstruction theorem.

**Computational observation `[NUMERICAL]`:** $\delta_D^{\min} = 8$ across all 2,818,953,028 triples.

### 5. Lean 4 Formalization `[FORMALIZATION]`

An independent formalization effort (OEIS Open project, Adamczewski et al., arXiv:2608.11941) has produced a Lean 4 proof infrastructure:

- **Prime list:** $PL = \{5, 11, 17, 23, 29, 41, 47, 53, 59, 71, 83, 89, 101, 107, 113, 131, 137, 149, 167, 173, 179, 191, 197\}$
- **Property:** All $p \in PL$ satisfy $p \equiv 2 \pmod{3}$, $p \ne 2$ (reason unknown, [OPEN])
- **7 proof chunks:** All pass `decide + kernel`
- **Exhaustive verifier:** 2,755,643,831 triples, solutions = 0
- **End-to-end compilation:** Pending (memory constraint)

> **Repository note:** The chunk-level Lean proofs are part of the external OEIS Open formalization effort and are not yet deposited in this repository. `lean/A306477.lean` contains the formal statement and a `sorry` placeholder. See the [Reproducibility Gap Table](#-reproducibility-gap-table).

The Google DeepMind `formal-conjectures` repository lists A306477 as `research solved` in its main branch (306477.lean), with the external Lean proof referenced at epoch-research/LeanOpenProblems-results, commit fd09021.

### 6. Negative Search Evidence `[COMP_VERIF]`

No second counterexample found in:

| Region | Coverage | Result |
|--------|----------|--------|
| $n^* \pm 50{,}000$ | Complete enumeration | None |
| $[10^{15},\ 10^{15}+200\text{K}]$ | Complete enumeration | None |
| Sparse structural regions | 5,030,500 evaluations | None |

These searches do not establish the non-existence of a second counterexample.

---

## ⚠️ Correction Note

Earlier versions of this project contained the following errors, corrected in V40.3:

| Error | Earlier Version | Correct Value |
|-------|----------------|---------------|
| $n^* \bmod 13$ | 1 | **5** |
| $n^* \bmod 5005$ | 1769 | **4464** |
| Modular claim | $\binom{y}{6}+\binom{z}{8} \not\equiv 14 \pmod{17}$ | **False** (counterexample: $y=11, z=10$) |
| Lean status | "Level 6: Formal Proof complete" | **chunk-level verified; end-to-end pending** |

All numerical constants in the current version have been independently verified by code.

---

## 🔍 Reproducibility Gap Table

The following table records the current correspondence between preprint V40.3 claims and this repository's actual contents. Gaps are documented transparently as open tasks.

| Claim (preprint V40.3) | In this repo? | Gap / Note |
|------------------------|--------------|------------|
| Reference verifier (`verify_n_star.py`) | ✅ `src/verify_n_star.py` | Complete |
| Cantor-Pascal diagnostics | ✅ `src/cantor_diagnostic.py` | Complete |
| Lean 4 statement (`IsRepresentable`) | ✅ `lean/A306477.lean` | Statement only; proof is `sorry` |
| Lean 4 chunk proofs (7 chunks, `decide+kernel`) | ❌ Not deposited | External (OEIS Open project); pending deposit |
| 12 independent verification kernels | ❌ Only 1 in repo | 11 additional kernels not yet deposited |
| Second-CE search (5,030,500 evaluations) | ❌ Not deposited | Script not yet in repo |
| Triple-count reconciliation | ❌ Open audit task | Three counts (2,818,953,028 / 2,755,643,831 / 2,741,554,058) under investigation |
| $R(n^*+1)>0$ explicit witness | ✅ Added V40.4 | $(40920205, 6138, 22, 13)$ — independently computed |
| All modular constants | ✅ Verified | See Key Verified Constants below |
| Search bounds ($z \le 281$, etc.) | ✅ Verified | Algebraically tight |

---

## 📊 Status Summary

| Component | Status | Tag |
|-----------|--------|-----|
| Algebraic parameter bounds | Complete | `[THEOREM]` |
| Exhaustive verification ($n^*$) | Complete | `[COMP_VERIF]` |
| Cross-validation ($R(n^*-1)=1$, explicit witness) | Complete | `[COMP_VERIF]` |
| Cross-validation ($R(n^*+1)>0$, explicit witness) | Complete | `[COMP_VERIF]` |
| External independent checker | Complete | `[COMP_VERIF]` |
| Triple-count reconciliation | Open audit task | `[OPEN]` |
| Lean 4 chunk-level verification | Complete (external) | `[FORMALIZATION]` |
| Lean 4 end-to-end certificate | Pending | `PENDING` |
| 12-kernel suite deposit | Pending | `PENDING` |
| Second counterexample search | Ongoing | `[OPEN]` |
| Analytic proof of $R(n^*)=0$ | Open | `[OPEN]` |

---

## 🔑 Key Verified Constants

```python
N = 896_315_812_331_399
assert N % 5 == 4 and N % 7 == 5 and N % 11 == 9
assert N % 13 == 5   # Note: NOT 1 (corrected in V40.3)
assert N % 17 == 14
assert N % 385 == 229 and N % 5005 == 4464  # Note: NOT 1769 (corrected in V40.3)
```

---

## 🧮 Quick Verification

```python
import math

def verify_n_star():
    """Returns False if R(n*) = 0 (no representation exists)."""
    N = 896_315_812_331_399
    def build_seq(k, limit):
        vals, m = [], k
        while True:
            v = math.comb(m, k)
            if v > limit: break
            vals.append(v); m += 1
        return vals
    S8 = build_seq(8, N)
    S6 = build_seq(6, N)
    S4 = build_seq(4, N)
    for v8 in S8:
        rem8 = N - v8
        for v6 in S6:
            rem6 = rem8 - v6
            if rem6 < 0: break
            for v4 in reversed(S4):
                if v4 > rem6: continue
                rem = rem6 - v4
                disc = 8 * rem + 1
                s = math.isqrt(disc)
                if s * s == disc and s % 2 == 1:
                    w = (s + 1) // 2
                    if w >= 2: return True
    return False  # R(n*) = 0

# Cross-validation: R(n*-1) = 1 (explicit witness)
assert (math.comb(33663667,2)+math.comb(9433,4)+
        math.comb(16,6)+math.comb(9,8)) == 896_315_812_331_398

# Cross-validation: R(n*+1) > 0 (explicit witness, computed V40.4)
assert (math.comb(40920205,2)+math.comb(6138,4)+
        math.comb(22,6)+math.comb(13,8)) == 896_315_812_331_400
```

---

## 📚 OEIS / Bibliographic Record

**[OEIS A306477](https://oeis.org/A306477)**

The OEIS entry lists Scott Sun's research in its **LINKS** section:

> Scott Sun, *A Computational Audit of a Candidate Counterexample to Sun's (2,4,6,8) Conjecture: Exhaustive Verification and Cantor-Pascal Diagnostics*, ResearchGate (2026).

---

## 🌐 Formalization & Community Tracking

- **Google DeepMind Formal Conjectures:** [Issue #1484](https://github.com/google-deepmind/formal-conjectures/issues/1484) — A306477 formalization tracking
- **OEIS Open paper:** arXiv:2608.11941 — Benchmark study of 492 OEIS conjectures
- **External independent checker:** [tadamcz/GitHub Gist](https://gist.github.com/tadamcz/0c578c8b2b3fb92fe8584bc0725187e3) — Reports: triples=2,755,643,831, solutions=0

---

## 📖 References

1. Sun, Z.-W. (2019). MathOverflow Question 323541.
2. Sun, Z.-W. (2019). *Conjectures on representations involving primes.* Combinatorial and Additive Number Theory III, Springer, vol. 297.
3. Baruch, Y. (2019). Verification to $5 \times 10^8$. OEIS A306477 comments.
4. Alekseyev, M. (2019). Verification to $2 \times 10^{11}$. OEIS A306477 comments.
5. Baruch, Y. (2019). Verification to $2 \times 10^{12}$. OEIS A306477 comments.
6. Adamczewski, T. [GitHub: tadamcz] (2026). Independent exhaustive checker. [GitHub Gist](https://gist.github.com/tadamcz/0c578c8b2b3fb92fe8584bc0725187e3).
7. OEIS Foundation (2026). [A306477](https://oeis.org/A306477).
8. Adamczewski, T. et al. (2026). OEIS Open: How many conjectures can language models turn into theorems? arXiv:2608.11941.
9. Google DeepMind (2026). formal-conjectures repository, Issue #1484.
10. **Sun, S. (2026). *A Computational Audit of a Candidate Counterexample to Sun's (2,4,6,8) Conjecture.* OSF/Zenodo V23.4. DOI: [10.17605/OSF.IO/CAQXH](https://doi.org/10.17605/OSF.IO/CAQXH). [Archived predecessor; collected in OEIS A306477 LINKS. Superseded by V40.3.]**
11. Wooley, T. D. (2012). Vinogradov's mean value theorem via efficient congruencing. *Ann. Math.*, 175, 1575–1627.
12. Bourgain, J., Demeter, C., Guth, L. (2016). Proof of the main conjecture in Vinogradov's mean value theorem. *Ann. Math.*, 184, 633–682.
13. Hardy, G.H. & Littlewood, J.E. (1920). Some problems of "Partitio Numerorum" I. *Göttinger Nachrichten*, 33–54.

---

## 📂 Repository Structure

```
sun-2468-conjecture/
├── src/
│   ├── verify_n_star.py          # Reference verifier (early-exit) [COMP_VERIF]
│   └── cantor_diagnostic.py      # Cantor-Pascal diagnostics [NUMERICAL]
├── lean/
│   └── A306477.lean              # Lean 4 statement (sorry placeholder)
├── .github/
│   └── workflows/
│       └── ci.yml                # CI: Python unit tests + Lean file check
├── CITATION.cff                  # Citation metadata (v40.4)
├── LICENSE                       # Apache 2.0
├── requirements.txt              # Python dependencies (numpy)
└── README.md
└── index.html    # GitHub Pages landing page (optional)
```

> **Pending deposits (tracked as open tasks):**
> - `src/` — 11 additional verification kernels (multi-language)
> - `lean/` — 7 chunk-level Lean proofs (external OEIS Open project)
> - `data/` — second-counterexample search results, triple-count reconciliation audit
>
> These are described in preprint V40.3 but not yet fully deposited in this repository.

---

## 🔓 Open Problems

| # | Problem | Status |
|---|---------|--------|
| P0 | Analytic proof that $R(n^*)=0$, independent of computation | [OPEN] |
| P1 | Does a second counterexample $n^{**} > n^*$ exist? | [OPEN] |
| P2 | Why does the Lean proof prime list $PL$ consist of primes $p \equiv 2 \pmod{3}$? | [OPEN] |
| P3 | Prove analytically that $\delta_D \ge 8$ for all admissible triples | [OPEN] |
| P4 | Complete Lean 4 end-to-end compilation | PENDING |
| P5 | Reconcile triple counts (2,818,953,028 vs 2,755,643,831 vs 2,741,554,058) | [OPEN AUDIT] |
| P6 | Deposit full 12-kernel verification suite | PENDING |
| P7 | Is the set of counterexamples finite? | [OPEN] |
| P8 | Characterize which binomial sums admit counterexamples | [OPEN] |

---

## 📜 Version History

| Version | Date | Description |
|---------|------|-------------|
| V40.4 | Oct 2026 | Repository reframed as reproducibility package; explicit $R(n^*+1)$ witness added; reproducibility gap table added; all bounds re-verified |
| V40.3 | Sep 2026 | Preprint: 5 referee issues resolved, count verifier added, density table corrected |
| **V23.4** | **Aug 2026** | **Archived predecessor: candidate discovery, Cantor-Pascal diagnostics** |
| V15.6 | 2026 | Local defect geometry framework |

---

## 📄 License

- **Code:** [Apache License 2.0](https://opensource.org/licenses/Apache-2.0)
- **Documentation & Preprints:** [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
