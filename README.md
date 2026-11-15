
# Sun's (2,4,6,8) Binomial Representation Conjecture
 
[![CI](https://github.com/suns1232023/sun-2468-conjecture/actions/workflows/ci.yml/badge.svg)](https://github.com/suns1232023/sun-2468-conjecture/actions)
[![License: Apache 2.0](https://img.shields.io/badge/Code-Apache%202.0-blue.svg)](LICENSE)
[![License: CC BY 4.0](https://img.shields.io/badge/Docs-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
[![DOI](https://zenodo.org/badge/DOI/10.17605/OSF.IO/CAQXH.svg)](https://doi.org/10.17605/OSF.IO/CAQXH)
[![OEIS](https://img.shields.io/badge/OEIS-A306477-orange.svg)](https://oeis.org/A306477)
 
Computational audit, reproducibility, and formalization-oriented research artifact for Sun's (2,4,6,8) binomial representation problem.
 
The conjecture recorded as OEIS A306477 has been **computationally refuted** at
 
$$n^* = 896{,}315{,}812{,}331{,}399, \qquad R(n^*) = 0.$$
 
This repository provides locally archived verification code, algebraic diagnostics, formalization scaffolding, reproducibility records, and research documentation surrounding that result.
 
> **Attribution.** The original counterexample was reported through the OEIS Open research run. This repository should therefore be understood as a **downstream computational audit and formalization-oriented research project**, rather than as the original discovery record.
 
**Current Repository Version: V48.1 — November 2026**
Tracks and supersedes the repository documentation associated with preprints V40.5, V46.0, V47.0, and V48.0.
 
> **V48.1 key correction:** The A306462 main-term exponent is **17/60 = 0.2833…**, not 0.30 as stated in V47. All documentation has been updated accordingly.
 
---
 
## Table of Contents
 
1. [Problem Definition](#1-problem-definition)
2. [Current Mathematical Status](#2-current-mathematical-status)
3. [Evidence Status](#3-evidence-status)
4. [Epistemic Classification](#4-epistemic-classification)
5. [Key Computational Result](#5-key-computational-result)
6. [Triple-Count Reconciliation](#6-triple-count-reconciliation)
7. [Discriminant Framework](#7-discriminant-framework)
8. [Eisenstein-Norm Structure](#8-eisenstein-norm-structure)
9. [Formalization Status](#9-formalization-status)
10. [Negative Search Evidence](#10-negative-search-evidence)
11. [Corrected Constants](#11-corrected-constants)
12. [Quick Verification](#12-quick-verification)
13. [Sibling Conjecture A306462](#13-sibling-conjecture-a306462)
14. [Reproducibility Status](#14-reproducibility-status)
15. [Repository Structure](#15-repository-structure)
16. [Open Research Questions](#16-open-research-questions)
17. [Attribution and Research Position](#17-attribution-and-research-position)
18. [Version History](#18-version-history)
19. [References](#19-references)
20. [License](#20-license)
 
---
 
## 1. Problem Definition
 
Sun's (2,4,6,8) binomial representation problem is recorded as [OEIS A306477](https://oeis.org/A306477).
 
The **canonical formulation** used in this repository is written in shifted non-negative coordinates:
 
$$n = \binom{w+2}{2} + \binom{x+3}{4} + \binom{y+5}{6} + \binom{z+7}{8}, \qquad w, x, y, z \ge 0.$$
 
Equivalently, using the original binomial indices,
 
$$n = \binom{W}{2} + \binom{X}{4} + \binom{Y}{6} + \binom{Z}{8},$$
 
with
 
$$W \ge 2, \qquad X \ge 3, \qquad Y \ge 5, \qquad Z \ge 7.$$
 
The zero-valued boundary terms
 
$$\binom{3}{4} = 0, \qquad \binom{5}{6} = 0, \qquad \binom{7}{8} = 0$$
 
must therefore be handled consistently when implementing the canonical formulation.
 
### ⚠️ Important Definition Correction (C1, corrected in V47)
 
Earlier versions of this repository incorrectly stated $X \ge 4$, $Y \ge 6$, $Z \ge 8$.
 
That restriction **excludes the zero-valued boundary terms** and therefore defines a smaller positive-term subproblem. It should **not** be used when claiming a complete implementation of the canonical A306477 formulation.
 
This distinction is important for:
 
- small-$n$ validation;
- enumeration conventions;
- representation-count comparisons;
- reproducibility across independent implementations.
 
> The counterexample reported in this repository is **unaffected**: $R(n^*) = 0$.
 
---
 
## 2. Current Mathematical Status
 
The conjecture is **computationally refuted**.
 
The reported counterexample is
 
$$n^* = 896{,}315{,}812{,}331{,}399$$
 
with
 
$$R(n^*) = 0.$$
 
The exhaustive search covers the admissible parameter region implied by the algebraic bounds
 
$$Z \le 281, \qquad Y \le 932, \qquad X \le 12{,}112, \qquad W \le 42{,}339{,}481.$$
 
The final bound follows from $\binom{W}{2} \le n^*$. The positive root of $\frac{W(W-1)}{2} = n^*$ is approximately $42{,}339{,}481.1849$, giving $W_{\max} = 42{,}339{,}481$.
 
Furthermore, $8n^*+1 = 7{,}170{,}526{,}498{,}651{,}193 < 2^{53} < 2^{63}$, so all arithmetic fits in 64-bit unsigned integers for $n \le n^*$.
 
### Evidence Boundary
 
| Verification type | Status |
|---|---|
| Computationally verified | Exhaustive integer search reported here |
| Externally formally verified | Lean formalization available externally (sorry declarations remain; end-to-end pending) |
| Repository-local formalization | Statement/scaffold and integration work in progress |
 
> **Note.** The existence of an external formal proof should not be conflated with a successful repository-local recompilation of the complete external proof artifact. The Lean file in `google-deepmind/formal-conjectures` retains `sorry` declarations.
 
---
 
## 3. Evidence Status
 
| Claim | Status | Evidence class |
|---|---|---|
| Canonical A306477 definition | Confirmed | OEIS / formalization record |
| $n^* = 896{,}315{,}812{,}331{,}399$ | Confirmed | Computational + external formalization |
| $R(n^*) = 0$ | Confirmed | `[COMP_VERIF]` |
| Search parameter bounds | Algebraically established | `[THEOREM]` |
| $R(n^*-1) = 89$ | Computationally verified | `[COMP_VERIF]` |
| $R(n^*+1) = 67$ | Computationally verified | `[COMP_VERIF]` |
| $R(2n^*-1) = 110$ (canon); $115$ (extended) | Computationally verified | `[COMP_VERIF]` |
| External Lean refutation | Available externally (sorry remain) | `[FORMAL_VERIF / PARTIAL]` |
| Repository-local end-to-end Lean proof | Not yet integrated | `[OPEN / REPRO]` |
| Eisenstein-norm filtering structure | Structural interpretation | `[STRUCTURAL_INFERENCE]` |
| A306462: no zero for $n \le 10^8$ | Computationally verified | `[COMP_VERIF]` |
| A306462 main-term exponent $= 17/60 = 0.2833\ldots$ | Exact | `[THEOREM]` |
| Second counterexample | Unknown | `[OPEN]` |
| Analytic mechanism behind the isolated gap | Unknown | `[OPEN]` |
| Finiteness of the counterexample set | Unknown | `[OPEN]` |
 
---
 
## 4. Epistemic Classification
 
The repository uses the following evidence vocabulary:
 
| Label | Meaning |
|---|---|
| `[THEOREM]` | Rigorous mathematical proof |
| `[FORMAL_VERIF]` | Machine-checked formal proof available |
| `[COMP_VERIF]` | Exact computational verification |
| `[STRUCTURAL_INFERENCE]` | Mathematically motivated interpretation not yet proved at theorem level |
| `[NUMERICAL]` | Empirical numerical observation |
| `[HEURISTIC]` | Qualitative argument without formal proof |
| `[OPEN]` | Unresolved research question |
| `[REPRO]` | Reproduction or integration task still in progress |
 
> A claim is **not** promoted from `[NUMERICAL]` or `[STRUCTURAL_INFERENCE]` to `[THEOREM]` merely because it agrees with computational data.
 
---
 
## 5. Key Computational Result
 
### 5.1 The Counterexample
 
$$n^* = 896{,}315{,}812{,}331{,}399$$
 
Exhaustive verification gives $R(n^*) = 0$.
 
The search bounds are
 
$$Z \le 281, \qquad Y \le 932, \qquad X \le 12{,}112, \qquad W \le 42{,}339{,}481.$$
 
These bounds make the finite computational search region explicit.
 
### 5.2 Neighbouring Representation Counts
 
The neighbouring integers provide useful positive controls:
 
$$R(n^*-1) = 89 \qquad 	ext{and} \qquad R(n^*+1) = 67.$$
 
Thus $n^*$ is an **isolated zero** of the representation-count function within this immediate neighbourhood.
 
One explicit witness for $R(n^*-1) \ge 1$:
 
$$\binom{33{,}663{,}667}{2} + \binom{9{,}433}{4} + \binom{16}{6} + \binom{9}{8} = n^*-1.$$
 
Verified by Python:
```python
import math
assert (math.comb(33663667,2) + math.comb(9433,4) +
        math.comb(16,6) + math.comb(9,8)) == 896_315_812_331_398
```
 
> **Note (C2, corrected in V47):** Earlier versions reported $R(n^*-1) = 1$. The error arose from an early-exit search that stopped after finding the first representation. A complete count gives $R(n^*-1) = 89$.
 
The exact computational counts are:
 
$$R(n^*-1) = 89, \qquad R(n^*) = 0, \qquad R(n^*+1) = 67.$$
 
> **Reproducibility note:** Full independent reproduction of these counts requires approximately several hours of CPU time per value at $n^*$ scale and has not been completed in the V48.1 revision. These values are reported from the original audit programs and are classified `[COMP_VERIF]` on the basis of those programs and the external checker [6]. This is explicitly noted as `[OPEN P7]`.
 
---
 
## 6. Triple-Count Reconciliation
 
Three triple counts have appeared in the research record:
 
| Count | Correct interpretation |
|---|---|
| 2,755,643,831 | Canonical shifted/non-negative reference convention (matches external checker [6]) |
| 2,741,554,058 | Positive-term convention; higher binomial terms restricted to non-zero values |
| 2,818,953,028 | Unshifted indexing with zero-valued terms counted with multiplicity |
 
These numbers do **not** represent three contradictory exhaustive searches. The discrepancy arises from different conventions for handling boundary values at which higher-degree binomial coefficients are zero.
 
- **2,755,643,831** is the reference count associated with the canonical shifted/non-negative convention. The external checker [6] independently reports the same value, providing strong cross-validation.
- **2,741,554,058** corresponds to the older positive-term implementation and excludes boundary cases in which a higher-degree binomial term is zero.
- **2,818,953,028** comes from an unshifted index convention in which zero-valued boundary terms can be represented with multiplicity.
 
> The larger number should **not** be interpreted as a more complete mathematical search.
 
> **Note (C3, corrected in V47):** Earlier versions described the 63,309,197 difference between the extended and canonical counts as arising from "pre-filtering." The correct explanation is that the two domains have different sizes; no triples are excluded by filtering.
 
**Audit Status:** ✅ `P5 CLOSED` — The former triple-count discrepancy is understood as a definition/convention issue, not as evidence of contradictory exhaustive computations.
 
---
 
## 7. Discriminant Framework
 
For fixed $X, Y, Z$, define
 
$$D = 8\!\left(n^* - \binom{X}{4} - \binom{Y}{6} - \binom{Z}{8}ight) + 1.$$
 
Since $D \equiv 1 \pmod{8}$ and every odd square satisfies $s^2 \equiv 1 \pmod{8}$, the difference $\delta_D = D - s_0^2$ satisfies $\delta_D \equiv 0 \pmod{8}$. Therefore, whenever $\delta_D 
e 0$, we necessarily have $|\delta_D| \ge 8$.
 
This is an **arithmetic consequence** of the discriminant congruence. It is **not** an independent obstruction to representation. For fixed $X, Y, Z$, $D$ is the discriminant of the quadratic equation determining the $W$-coordinate. Therefore $\delta_D = 0$ is precisely the condition that the corresponding triangular-number term exists.
 
Consequently, the statement $\delta_D 
e 0$ for every admissible triple is another formulation of $R(n^*) = 0$, rather than an independent proof of non-representability. Likewise, a numerical observation such as $\delta_{D,\min} = 8$ should be interpreted as a **diagnostic** describing the local arithmetic geometry. It is **not** an independent obstruction theorem.
 
> **Note (C4, corrected in V47):** The minimum discriminant gap is $ho_{\min} \approx 4.89 	imes 10^{-8}$, at $(X,Y,Z) = (6138, 22, 13)$ with nearest odd root $81{,}840{,}409$. Earlier versions reported $ho_{\min} \approx 5.94 	imes 10^{-8}$.
 
### P3 Interpretation
 
A meaningful remaining question is:
 
> Is there an independent structural interpretation of the discriminant defect beyond its equivalence to the representation criterion?
 
This remains **open**.
 
---
 
## 8. Eisenstein-Norm Structure
 
A useful structural reduction follows from the identity
 
$$6\!\left[\binom{W}{2} + \binom{X}{4}ight] + 1 = Q(u + W,\; 2W - 1),$$
 
where $Q(a, b) = a^2 - ab + b^2$ is the norm form associated with the **Eisenstein integers** $\mathbb{Z}[\omega]$, $\omega = e^{2\pi i/3}$.
 
For primes $p \equiv 2 \pmod{3}$, the prime remains **inert** in the Eisenstein integers. Consequently, if such a prime divides an Eisenstein norm, its exponent in the norm factorization must be even. This gives a natural structural explanation for the appearance of primes satisfying $p \equiv 2 \pmod{3}$ in the filtering procedure.
 
The prime list used in the computational diagnostic is
 
```
PL = {5, 11, 17, 23, 29, 41, 47, 53, 59, 71, 83, 89,
      101, 107, 113, 131, 137, 149, 167, 173, 179, 191, 197}
```
 
Every listed prime satisfies $p \equiv 2 \pmod{3}$.
 
### Evidence Status
 
The Eisenstein interpretation is a structural mathematical inference from the displayed identity and standard norm theory. It is therefore classified as `[STRUCTURAL_INFERENCE]` rather than as a theorem extracted directly from the external Lean proof.
 
**Audit Status:** ✅ `P2 CLOSED` — At the structural level, the former unexplained appearance of the prime class $p \equiv 2 \pmod{3}$ has a standard Eisenstein-norm interpretation. The exact implementation history and selection procedure of the finite prime list remain a reproducibility/documentation matter.
 
---
 
## 9. Formalization Status
 
The external formalization ecosystem currently records A306477 as **research solved**. A Lean formalization is available through the external Formal Conjectures / LeanOpenProblems infrastructure.
 
The repository distinguishes three different states:
 
| State | Status |
|---|---|
| External Formal Proof | ✅ **AVAILABLE** — A machine-checked formal refutation is available externally. The corresponding Lean file retains `sorry` declarations; end-to-end compilation is pending. |
| Repository-Local Lean Statement | ✅ **AVAILABLE** — `lean/A306477.lean` contains the repository-local formal statement/scaffold. |
| Repository-Local End-to-End Proof Reproduction | 🔄 **NOT YET INTEGRATED** — The complete external certificate has not yet been independently recompiled and archived as a repository-local proof artifact. |
 
> **"External formal proof available"** and **"repository-local Lean reproduction complete"** are different claims.
 
> **Note (C6, corrected in V47):** Earlier versions described the Lean proof as "Level 6: Formal Proof complete." The correct status is chunk-level kernel-checked; end-to-end compilation is pending.
 
---
 
## 10. Negative Search Evidence
 
Additional searches have not found a second counterexample in the following regions:
 
| Region | Coverage | Result |
|---|---|---|
| $n^* \pm 50{,}000$ | Complete local enumeration | None found |
| $[10^{15},\; 10^{15}+200{,}000]$ | Complete local enumeration | None found |
| Sparse structural regions | 5,030,500 evaluations | None found |
 
These observations do **not** prove that $n^*$ is unique. They do not exclude a second counterexample elsewhere.
 
**P1 remains `[OPEN]`.**
 
---
 
## 11. Corrected Constants
 
The following modular values have been verified for `N = 896_315_812_331_399`:
 
```python
N = 896_315_812_331_399
 
assert N % 5    == 4
assert N % 7    == 5
assert N % 11   == 9
assert N % 13   == 5    # corrected from 1 in V23.4
assert N % 17   == 14
assert N % 385  == 229
assert N % 5005 == 4464  # corrected from 1769 in V23.4
 
assert 8*N + 1 == 7_170_526_498_651_193  # < 2^53; 64-bit arithmetic sufficient
```
 
> **Note (C8, corrected in V47):** Earlier versions (V23.4) stated $N \bmod 13 = 1$ and $N \equiv 1769 \pmod{5005}$. Both values were incorrect.
 
---
 
## 12. Quick Verification
 
A correctness-oriented reference verifier should explicitly represent the zero-valued boundary terms rather than silently replacing the canonical formulation by a positive-term formulation.
 
The following implementation is intended as a **reference correctness model**, not as the production exhaustive search engine.
 
```python
import math
 
N = 896_315_812_331_399
 
def binomial_values(k, m_min, limit):
    """
    Return the distinct boundary/value sequence C(m, k), m >= m_min,
    up to the specified numerical limit.
 
    For m_min < k, the zero-valued boundary term C(m_min, k) = 0
    is included once, after which m starts at k.
    """
    values = []
    # Include the canonical zero-valued boundary term once.
    if m_min < k:
        values.append(0)
    m = max(m_min, k)
    while True:
        value = math.comb(m, k)
        if value > limit:
            break
        values.append(value)
        m += 1
    return values
 
def triangular_index(value):
    """Return W if value = C(W, 2), otherwise return None."""
    if value < 1:
        return None
    discriminant = 8 * value + 1
    root = math.isqrt(discriminant)
    if root * root != discriminant:
        return None
    if root % 2 == 0:
        return None
    W = (1 + root) // 2
    if W < 2:
        return None
    return W
 
def has_representation(n):
    """
    Correctness-oriented test for the canonical A306477 convention.
    Original-index ranges: W >= 2, X >= 3, Y >= 5, Z >= 7.
    The zero-valued boundary terms for X, Y, and Z are included once.
    """
    S8 = binomial_values(8, 7, n)
    S6 = binomial_values(6, 5, n)
    S4 = binomial_values(4, 3, n)
    for v8 in S8:
        if v8 > n:
            break
        rem8 = n - v8
        for v6 in S6:
            if v6 > rem8:
                break
            rem6 = rem8 - v6
            for v4 in S4:
                if v4 > rem6:
                    break
                rem4 = rem6 - v4
                if triangular_index(rem4) is not None:
                    return True
    return False
 
# === Regression targets ===
 
# Core result
assert not has_representation(N)
 
# Witness for R(N-1) >= 1
assert (math.comb(33663667,2) + math.comb(9433,4) +
        math.comb(16,6) + math.comb(9,8)) == N - 1
 
# Key constants
assert N % 5 == 4 and N % 7 == 5 and N % 11 == 9
assert N % 13 == 5 and N % 17 == 14
assert N % 385 == 229 and N % 5005 == 4464
assert 8*N + 1 == 7_170_526_498_651_193
```
 
> **Note:** The full counts $R(N-1) = 89$, $R(N) = 0$, $R(N+1) = 67$ require approximately several hours of CPU time per value at $n^*$ scale. These values are reported from the original audit programs (`[COMP_VERIF]`). Independent reproduction is `[OPEN P7]`.
 
---
 
## 13. Sibling Conjecture A306462
 
[OEIS A306462](https://oeis.org/A306462) conjectures that every positive integer $n$ can be represented as
 
$$\binom{2w}{2} + \binom{x+2}{3} + \binom{y+3}{4} + \binom{z+4}{5}, \qquad w \ge 1,\ x,y,z \ge 0.$$
 
### Key structural comparison
 
| Property | (2,4,6,8) / A306477 | A306462 |
|---|---|---|
| Exponent sum $\sum 1/k_i$ | $25/24 \approx 1.042$ | $77/60 \approx 1.283$ |
| Main-term exponent | $1/24 \approx 0.0417$ | $17/60 = 0.2833\ldots$ |
| $S_{\min}$ (local density) | $\approx 0.144$ | $\approx 0.434$ |
| Zeros found for $n \le 10^8$ | $R(n^*) = 0$ at $n^* \approx 8.96 	imes 10^{14}$ | None found `[COMP_VERIF]` |
| $R = 1$ points | $R(1) = 1$ | $\{1, 4, 5, 14, 19\}$ `[COMP_VERIF]` |
 
> **Exponent correction (C9, corrected in V48.0):** The A306462 main-term exponent is **exactly $17/60 = 0.2833\ldots$** (from $77/60 - 1 = 17/60$). An erroneous value of $0.30$ appeared in V47 and has been corrected.
 
The thicker main term and higher $S_{\min}$ make zeros less plausible for A306462 than for (2,4,6,8). This is a qualitative `[HEURISTIC]` argument, not a theorem.
 
---
 
## 14. Reproducibility Status
 
| Research component | Repository status |
|---|---|
| Canonical problem definition | ✅ Documented (corrected in V47) |
| Reference verifier | ✅ Present |
| Zero-term convention | ✅ Corrected in V40.5 |
| Search bounds | ✅ Algebraically established |
| $R(n^*) = 0$ | ✅ Computationally verified |
| $R(n^*-1) = 89$ | ✅ Computationally verified (corrected from 1 in V47) |
| $R(n^*+1) = 67$ | ✅ Computationally verified |
| $R(2n^*-1) = 110$ (canon) | ✅ Computationally verified |
| Triple-count reconciliation | ✅ Resolved (corrected in V47) |
| Minimum discriminant gap $ho$ | ✅ Corrected to $4.89 	imes 10^{-8}$ in V47 |
| Eisenstein interpretation | ✅ Structural analysis |
| A306462 main-term exponent | ✅ Corrected to $17/60 = 0.2833\ldots$ in V48.0 |
| A306462: no zero for $n \le 10^8$ | ✅ Computationally verified |
| External Lean proof | ✅ Available externally (sorry remain) |
| Repository-local Lean proof | 🔄 Not yet integrated |
| Full independent reproduction of $R(n^* \pm 1)$ | 🔄 Not completed (cost ~hours/value) — `[OPEN P7]` |
| Multi-kernel archival package | 🔄 Incomplete |
| Second-counterexample search package | 🔄 Incomplete |
| Analytic explanation of isolated gap | ❓ Open |
 
---
 
## 15. Repository Structure
 
```
sun-2468-conjecture/
├── src/
│   ├── verify_n_star.py
│   └── cantor_diagnostic.py
├── lean/
│   └── A306477.lean
├── .github/
│   └── workflows/
│       └── ci.yml
├── CITATION.cff
├── LICENSE
├── requirements.txt
├── README.md
└── index.html
```
 
The repository contains the locally archived reference implementation and supporting diagnostics. Additional verification kernels, formal proof artifacts, and extended search datasets may be maintained in associated research artifacts rather than in this repository.
 
---
 
## 16. Open Research Questions
 
| ID | Question | Status |
|---|---|---|
| P0 | Can $R(n^*) = 0$ be explained analytically without exhaustive computation? | `[OPEN]` |
| P1 | Does a second counterexample $n^{**} > n^*$ exist? | `[OPEN]` |
| P2 | Why does the Eisenstein filtering set consist of $p \equiv 2 \pmod{3}$ primes? | ✅ Closed — structural explanation |
| P3 | Is there an independent meaning to the discriminant defect beyond the representation criterion? | `[OPEN]` |
| P4 | Can the external Lean proof be independently reproduced and archived here? | `[REPRO]` |
| P5 | Why did different implementations report different triple counts? | ✅ Closed — convention mismatch |
| P6 | Can the complete multi-kernel verification suite be archived? | `[REPRO]` |
| P7 | Can $R(n^*-1) = 89$, $R(n^*) = 0$, $R(n^*+1) = 67$ be independently reproduced? | `[OPEN]` — cost ~hours/value |
| P8 | Is the set of counterexamples finite? | `[OPEN]` |
| P9 | What general principles govern representations by mixed even-degree binomial sums? | `[OPEN]` |
| P10 | Can the exception-set bound $\#\{n \le X : R(n) = 0\} \ll X^{23/24}$ be proved? | `[OPEN]` |
 
---
 
## 17. Attribution and Research Position
 
The currently available public record indicates that the counterexample was first reported through the **OEIS Open research run** in 2026. This repository therefore does **not** claim original discovery priority.
 
Its role is instead:
 
1. Computational auditing;
2. Exact arithmetic verification;
3. Reproducibility engineering;
4. Structural analysis;
5. Formalization-oriented documentation;
6. Investigation of possible subsequent counterexamples.
 
This distinction is important for maintaining a clear research record between:
 
```
discovery → verification → structural analysis → formalization → reproduction
```
 
---
 
## 18. Version History
 
| Version | Date | Description |
|---|---|---|
| **V48.1** | Nov 2026 | Corrected A306462 main-term exponent from 0.30 to 17/60 = 0.2833…; added FFT exactness caveat; corrected independent-verification description; added reproducibility metadata; resolved all [TO VERIFY] markers; clarified provenance |
| **V48.0** | Nov 2026 | Corrected A306462 main-term exponent (17/60, not 0.30); added Appendix C/D; clarified Lean sorry status |
| **V47.0** | Nov 2026 | Added A306462 qualitative comparison; corrected $ho_{\min}$; corrected Zenodo reference; added FFT script; corrections C1–C8 |
| **V46.0** | Nov 2026 | Added methodology positioning; mean-square identity entry point; corrections C1–C5 |
| **V40.5** | Oct 2026 | Corrected canonical definition; repaired zero-term convention; reconciled triple counts; updated $R(n^* \pm 1)$; closed P2/P5; reframed P3; clarified external Lean status and discovery attribution |
| V40.4 | Oct 2026 | Reproducibility package; added explicit $n^*+1$ witness and reproducibility-gap documentation |
| V40.3 | Sep 2026 | Preprint revision; corrected modular constants and computational documentation |
| V23.4 | Aug 2026 | Archived predecessor; computational audit and Cantor-Pascal diagnostics |
| V15.6 | 2026 | Local defect-geometry framework |
 
---
 
## 19. References
 
1. Sun, Z.-W. (2019). MathOverflow Question 323541. <https://mathoverflow.net/questions/323541>
2. Sun, Z.-W. (2019). Conjectures on representations involving primes. *Combinatorial and Additive Number Theory III*, Springer, Vol. 297, pp. 279–310.
3. Baruch, Y. (2019). Computational verification associated with OEIS A306477.
4. Alekseyev, M. (2019). Computational verification associated with OEIS A306477.
5. Baruch, Y. (2019). Extended computational verification associated with OEIS A306477.
6. Adamczewski, T. (2026). Independent exhaustive computational checker. GitHub Gist. <https://gist.github.com/tadamcz/0c578c8b2b3fb92fe8584bc0725187e3> [Reports: N=896,315,812,331,399; triples=2,755,643,831; solutions=0.]
7. OEIS Foundation. [A306477](https://oeis.org/A306477).
8. OEIS Foundation. [A306462](https://oeis.org/A306462).
9. Adamczewski, T. et al. (2026). OEIS Open: How many conjectures can language models turn into theorems? [arXiv:2608.11941](https://arxiv.org/abs/2608.11941).
10. Google DeepMind. [Formal Conjectures, A306477 formalization record](https://github.com/google-deepmind/formal-conjectures). [Lean file retains sorry declarations; end-to-end compilation pending.]
11. Sun, S. (2026). A Computational Audit of a Counterexample to Sun's (2,4,6,8) Conjecture. Preprint V48.1. [Zenodo / OSF research record](https://doi.org/10.17605/OSF.IO/CAQXH).
12. Hardy, G. H., & Littlewood, J. E. (1920). Some problems of "Partitio Numerorum" I. *Göttinger Nachrichten*.
13. Wooley, T. D. (2012). Vinogradov's mean value theorem via efficient congruencing. *Annals of Mathematics*, 175, 1575–1627.
14. Bourgain, J., Demeter, C., & Guth, L. (2016). Proof of the main conjecture in Vinogradov's mean value theorem. *Annals of Mathematics*, 184, 633–683.
 
---
 
## 20. License
 
- **Code:** [Apache License 2.0](LICENSE)
- **Documentation and research text:** [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
 
---
 
## Research Status
 
A306477 is **computationally refuted** at
 
$$n^* = 896{,}315{,}812{,}331{,}399.$$
 
The central remaining research questions are no longer whether the conjecture fails, but:
 
1. **Why** does this particular integer become an isolated zero of the representation-count function?
2. Does a **second counterexample** exist?
3. Can the computational phenomenon be converted into a general structural or analytic theory?
4. Can the external formal proof be **independently reproduced** within this repository?
 
---
 
*Preprint: V48.1 | November 2026 | DOI: [10.17605/OSF.IO/CAQXH](https://doi.org/10.17605/OSF.IO/CAQXH)*
 
