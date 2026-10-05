# Sun's (2,4,6,8) Binomial Representation Conjecture

[![OEIS A306477](https://img.shields.io/badge/OEIS-A306477-2f6f9f)](https://oeis.org/A306477)
[![Zenodo Master DOI](https://img.shields.io/badge/Zenodo-10.5281%2Fzenodo.21544303-168AAD)](https://doi.org/10.5281/zenodo.21544303)
[![Zenodo V23.4 DOI](https://img.shields.io/badge/Zenodo-V23.4-0077B6)](https://doi.org/10.5281/zenodo.22139197)
[![OSF Repository](https://img.shields.io/badge/OSF-CAQXH-blue)](https://osf.io/caqxh)
[![ResearchGate](https://img.shields.io/badge/ResearchGate-Scott__Sun-00CCBB?logo=researchgate)](https://www.researchgate.net/profile/Scott-Sun)
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

> **Computational audit, reproducibility, and formalization-oriented research artifact for Sun's (2,4,6,8) binomial representation problem.**
>
> The conjecture recorded as OEIS A306477 has now been computationally refuted at
>
> $$> n^* = 896{,}315{,}812{,}331{,}399, > \quad R(n^*) = 0. >$$
>
> This repository provides the locally archived verification code, algebraic diagnostics, formalization scaffold, reproducibility records, and research documentation surrounding that result.
>
> The original counterexample was reported through the OEIS Open research run. This repository should therefore be understood as a **downstream computational audit and formalization-oriented research project**, rather than as the original discovery record.

**Current Repository Version: V40.5 — October 2026**

*Tracks and supersedes the repository documentation associated with preprint V40.3.*

---

## 1. Problem Definition

Sun's (2,4,6,8) binomial representation problem is recorded as **OEIS A306477**.

The canonical formulation is most conveniently written in shifted non-negative coordinates:

$$\boxed{ n = \binom{w+2}{2} +\binom{x+3}{4} +\binom{y+5}{6} +\binom{z+7}{8}, \quad w,x,y,z \ge 0. }$$

Equivalently, using the original binomial indices,

$$\boxed{ n = \binom{W}{2} +\binom{X}{4} +\binom{Y}{6} +\binom{Z}{8}, }$$

with

$$W \ge 2, \quad X \ge 3, \quad Y \ge 5, \quad Z \ge 7.$$

The zero-valued boundary terms

$$\binom{3}{4} = \binom{5}{6} = \binom{7}{8} = 0$$

are therefore part of the canonical representation problem.

### Important Definition Correction

Earlier versions of this repository incorrectly stated

$$X \ge 4, \quad Y \ge 6, \quad Z \ge 8.$$

That restriction excludes valid zero-valued terms and defines a strictly smaller positive-term subproblem. It is **not** the canonical OEIS A306477 formulation.

This distinction affects small-$n$ tests and triple-count conventions, although it does not change the conclusion

$$R(n^*) = 0.$$

All current verification work should use the canonical shifted formulation.

---

## 2. Current Mathematical Status

The conjecture is now **refuted**.

The reported counterexample is

$$\boxed{ n^* = 896{,}315{,}812{,}331{,}399 }$$

with

$$\boxed{ R(n^*) = 0. }$$

The computational search uses exact integer arithmetic and exhaustively covers the admissible parameter region implied by the algebraic bounds

$$z \le 281, \quad y \le 932, \quad x \le 12{,}112, \quad W \le 42{,}339{,}481.$$

The last bound follows from the positive root of

$$\frac{W(W-1)}{2} = n^*,$$

whose floor is

$$W_{\max} = 42{,}339{,}481.$$

The result has also been incorporated into the current external formalization record, where A306477 is listed as `research solved`.

### Evidence Boundary

The external Lean proof is available through the formalization ecosystem, but this repository has **not independently recompiled the complete external proof artifact**.

Accordingly, the evidence should be distinguished as follows:

* **Computationally verified:** the exhaustive search reported here.
* **Externally formally verified:** the linked Lean formalization.
* **Repository-local formalization:** currently a statement/scaffold rather than a complete end-to-end proof.

---

## 3. Evidence Status

| Claim | Status | Evidence class |
| :--- | :--- | :--- |
| Canonical A306477 definition | Confirmed | OEIS / formalization record |
| $n^* = 896315812331399$ | Confirmed | Computational + external formalization |
| $R(n^*) = 0$ | Confirmed | `[COMP_VERIF]` |
| Search parameter bounds | Proven algebraically | `[THEOREM]` |
| $R(n^* - 1) = 89$ | Computationally verified | `[COMP_VERIF]` |
| $R(n^* + 1) = 67$ | Computationally verified | `[COMP_VERIF]` |
| External Lean refutation | Available externally | `[FORMAL_VERIF]` |
| Repository-local end-to-end Lean proof | Not yet integrated | `[OPEN / REPRO]` |
| Eisenstein-norm filtering structure | Strong structural inference | `[STRUCTURAL_INFERENCE]` |
| Second counterexample | Unknown | `[OPEN]` |
| Analytic mechanism behind the isolated gap | Unknown | `[OPEN]` |
| Finiteness of the counterexample set | Unknown | `[OPEN]` |

---

## 4. Epistemic Classification

The repository uses the following evidence vocabulary:

| Label | Meaning |
| :--- | :--- |
| `[THEOREM]` | Rigorous mathematical proof |
| `[FORMAL_VERIF]` | Machine-checked formal proof available |
| `[COMP_VERIF]` | Exact computational verification |
| `[STRUCTURAL_INFERENCE]` | Mathematically motivated interpretation not yet proved at theorem level |
| `[NUMERICAL]` | Empirical numerical observation |
| `[OPEN]` | Unresolved research question |

A claim is not promoted from `[NUMERICAL]` or `[STRUCTURAL_INFERENCE]` to `[THEOREM]` merely because it agrees with computational data.

---

## 5. Key Computational Result

### 5.1 The Counterexample

$$\boxed{ n^* = 896{,}315{,}812{,}331{,}399 }$$

and exhaustive verification gives

$$\boxed{ R(n^*) = 0. }$$

The search bounds are

$$z \le 281, \quad y \le 932, \quad x \le 12{,}112, \quad W \le 42{,}339{,}481.$$

These bounds make the finite search region explicit.

---

### 5.2 Neighbouring Representation Counts

The neighbouring integers provide useful positive controls:

$$\boxed{ R(n^* - 1) = 89 }$$

and

$$\boxed{ R(n^* + 1) = 67. }$$

Thus $n^*$ is an isolated zero of the representation-count function within this immediate neighbourhood.

For example,

$$\binom{33{,}663{,}667}{2} +\binom{9{,}433}{4} +\binom{16}{6} +\binom{9}{8} = n^* - 1,$$

while

$$\binom{40{,}920{,}205}{2} +\binom{6{,}138}{4} +\binom{22}{6} +\binom{13}{8} = n^* + 1.$$

These are **witnesses**, not representation counts. The exact counts are 89 and 67 respectively.

---

## 6. Triple-Count Reconciliation

Three triple counts have appeared in the research record:

| Count | Correct interpretation |
| ---: | :--- |
| **2,755,643,831** | Canonical shifted/non-negative convention; reference count |
| **2,741,554,058** | Positive-term convention; all three higher binomial terms required to be non-zero |
| **2,818,953,028** | Unshifted indexing with zero-valued terms counted with multiplicity |

These numbers do **not** represent three contradictory exhaustive searches.

The discrepancy is caused by different conventions for handling zero-valued binomial terms.

In particular,

$$2{,}755{,}643{,}831$$

is the canonical count to use when comparing against the OEIS / Lean formulation.

The larger value

$$2{,}818{,}953{,}028$$

should not be described as “more complete”. Its excess arises from repeated counting of zero-valued terms under a different indexing convention.

The smaller value

$$2{,}741{,}554{,}058$$

corresponds to the older positive-term implementation and therefore excludes valid zero-term boundary cases.

### Audit Status

$$\boxed{\text{P5 CLOSED}}$$

The former “triple-count discrepancy” was a **definition/convention issue**, not an unresolved algorithmic contradiction.

---

## 7. Discriminant Framework

For fixed $(X,Y,Z)$, define

$$D = 8\left( n^* -\binom{X}{4} -\binom{Y}{6} -\binom{Z}{8} \right) + 1.$$

Since

$$D \equiv 1 \pmod 8,$$

and every odd square satisfies

$$s^2 \equiv 1 \pmod 8,$$

the discriminant defect

$$\delta_D = D - s_0^2$$

satisfies

$$\delta_D \equiv 0 \pmod 8.$$

Therefore, whenever

$$\delta_D \ne 0,$$

we necessarily have

$$\vert{}\delta_D\vert{} \ge 8.$$

This observation is purely arithmetic.

It is **not an independent obstruction** to representation.

Indeed,

$$\delta_D = 0$$

is precisely the condition that the corresponding $w$-coordinate exists. Consequently, the statement

$$\delta_D \ne 0$$

for all admissible triples is equivalent to

$$R(n^*) = 0.$$

Thus the former P3 should not be treated as an independent open problem.

Likewise, the numerical observation

$$\delta_D^{\min} = 8$$

is equivalent to the existence of at least one representation of $n^*-1$ or $n^*+1$. It provides useful geometric visualization, but no independent obstruction theorem.

---

## 8. Eisenstein-Norm Structure

A useful structural reduction follows from

$$u = \frac{X(X-3)}{2}$$

and the identity

$$ 6\left( \binom{W}{2} + \binom{X}{4} \right) + 1 = Q(u+W, 2W-1), $$

where

$$Q(a,b) = a^2 - ab + b^2.$$

The quadratic form $Q(a,b)$ is the norm form of the Eisenstein integers.

For primes

$$p \equiv 2 \pmod 3,$$

the prime remains inert in the Eisenstein integers. Consequently, if such a prime divides an Eisenstein norm, its exponent must be even.

This explains the appearance of the prime filtering set

$$PL = \{5, 11, 17, 23, 29, 41, 47, 53, 59, 71, 83, 89, 101, 107, 113, 131, 137, 149, 167, 173, 179, 191, 197\}.$$

All these primes satisfy

$$p \equiv 2 \pmod 3.$$

### Evidence Status

The Eisenstein interpretation is a **structural mathematical inference** from the displayed identity and standard norm theory.

It is therefore classified as

$$\boxed{\text{STRUCTURAL\_INFERENCE}}$$

rather than as a theorem extracted from the external Lean proof.

### P2 Status

$$\boxed{\text{P2 CLOSED}}$$

The former question “Why does the prime list consist of $p \equiv 2 \pmod 3$?” is no longer an unexplained feature.

---

## 9. Formalization Status

The external formalization ecosystem currently records A306477 as `research solved`.

A Lean formalization is available through the external Formal Conjectures / LeanOpenProblems infrastructure.

The repository should distinguish three different states:

### External Formal Proof

$$\boxed{\text{AVAILABLE}}$$

A machine-checked formal refutation exists externally.

### Repository-Local Lean Statement

$$\boxed{\text{AVAILABLE}}$$

`lean/A306477.lean` contains the local formal statement/scaffold.

### Repository-Local End-to-End Proof Reproduction

$$\boxed{\text{NOT YET INTEGRATED}}$$

The full external certificate has not yet been independently recompiled and archived in this repository.

Therefore:

> “External formal proof available” and “repository-local Lean reproduction complete” are different claims.

---

## 10. Negative Search Evidence

Additional searches have not found a second counterexample in the following regions:

| Region | Coverage | Result |
| :--- | :--- | :--- |
| $n^* \pm 50{,}000$ | Complete local enumeration | None |
| $[10^{15}, 10^{15} + 200{,}000]$ | Complete enumeration | None |
| Sparse structural regions | 5,030,500 evaluations | None |

These results do **not** prove uniqueness of $n^*$, nor do they exclude a second counterexample elsewhere.

Therefore:

$$\boxed{\text{P1 remains OPEN}.}$$

---

## 11. Corrected Constants

The following modular values have been independently checked:

```python
N = 896_315_812_331_399

assert N % 5 == 4
assert N % 7 == 5
assert N % 11 == 9
assert N % 13 == 5
assert N % 17 == 14
assert N % 385 == 229
assert N % 5005 == 4464

```

Earlier incorrect values for $N \bmod 13$ and $N \bmod 5005$ have been removed.

---

## 12. Quick Verification

The reference verifier must use the canonical shifted definition rather than silently imposing positive-term restrictions.

A minimal reference implementation is:

```python
import math

N = 896_315_812_331_399

def build_shifted_binomial(k, shift, limit):
    """
    Returns C(m, k) for m = k-shift, k-shift+1, ...
    in the canonical shifted/non-negative convention.
    """
    vals = []
    m = max(k, k - shift)

    while True:
        v = math.comb(m, k)
        if v > limit:
            break
        vals.append(v)
        m += 1

    return vals


def has_representation(n):
    """
    Tests the canonical A306477 representation.
    Returns True iff R(n) > 0.
    """

    # Canonical original-index ranges:
    # W >= 2, X >= 3, Y >= 5, Z >= 7.
    S8 = [math.comb(z, 8)
          for z in range(7, 1000)
          if math.comb(z, 8) <= n]

    S6 = [math.comb(y, 6)
          for y in range(5, 5000)
          if math.comb(y, 6) <= n]

    S4 = [math.comb(x, 4)
          for x in range(3, 20000)
          if math.comb(x, 4) <= n]

    for v8 in S8:
        rem8 = n - v8

        for v6 in S6:
            rem6 = rem8 - v6
            if rem6 < 0:
                break

            for v4 in S4:
                if v4 > rem6:
                    continue

                rem = rem6 - v4

                # rem = C(W,2) = W(W-1)/2
                disc = 8 * rem + 1
                s = math.isqrt(disc)

                if s * s == disc and s % 2 == 1:
                    return True

    return False

```

For a production verifier, the repository implementation should use the tighter algebraic bounds rather than the deliberately simple ranges above.

Regression tests should include:

```python
# Boundary cases: zero-valued binomial terms matter.
assert has_representation(5)
assert has_representation(7)
assert has_representation(11)

# Counterexample.
assert not has_representation(N)

```

The exact neighbouring counts should additionally be verified by the exhaustive counting implementation:

```text
R(N - 1) = 89
R(N)     = 0
R(N + 1) = 67

```

---

## 13. Reproducibility Status

| Research component | Repository status |
| --- | --- |
| Canonical problem definition | ✅ Documented |
| Reference verifier | ✅ Present |
| Correct zero-term convention | 🔄 V40.5 correction |
| Search bounds | ✅ Verified |
| $R(n^*) = 0$ | ✅ Computationally verified |
| $R(n^* - 1) = 89$ | ✅ Verified |
| $R(n^* + 1) = 67$ | ✅ Verified |
| Triple-count reconciliation | ✅ Resolved |
| Eisenstein interpretation | ✅ Structural analysis |
| External Lean proof | ✅ Available externally |
| Repository-local Lean proof | ⏳ Not yet integrated |
| 12-kernel archival package | ⏳ Incomplete |
| Second-counterexample search package | ⏳ Incomplete |
| Analytic explanation of the isolated gap | 🔬 Open |

---

## 14. Repository Structure

```text
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

The repository currently contains the locally archived reference implementation and supporting diagnostics.

Additional verification kernels, external Lean chunks, and extended search datasets may be maintained in associated research artifacts rather than this repository.

---

## 15. Open Research Questions

| ID | Question | Status |
| --- | --- | --- |
| P0 | Can $R(n^*) = 0$ be explained analytically without exhaustive computation? | `[OPEN]` |
| P1 | Does a second counterexample $n^{**} > n^*$ exist? | `[OPEN]` |
| P2 | Why does the Eisenstein filtering set consist of $p \equiv 2 \pmod 3$ primes? | **Closed — structural explanation** |
| P3 | Is there an independent meaning to the discriminant defect beyond the representation criterion? | `[OPEN]` |
| P4 | Can the external Lean proof be independently reproduced and archived here? | `[REPRO]` |
| P5 | Why did different implementations report different triple counts? | **Closed — convention mismatch** |
| P6 | Can the complete multi-kernel verification suite be archived? | `[REPRO]` |
| P7 | Is the set of counterexamples finite? | `[OPEN]` |
| P8 | What general principles govern representations by mixed even-degree binomial sums? | `[OPEN]` |

---

## 16. Attribution and Research Position

The currently available public record indicates that the counterexample was first reported through the **OEIS Open research run** in 2026.

This repository therefore does not claim original discovery priority.

Its role is instead:

1. Computational auditing;
2. Exact arithmetic verification;
3. Reproducibility engineering;
4. Structural analysis;
5. Formalization-oriented documentation;
6. Investigation of possible subsequent counterexamples.

This distinction is important for maintaining a clear research record between **discovery**, **verification**, and **formalization**.

---

## 17. Version History

| Version | Date | Description |
| --- | --- | --- |
| **V40.5** | **Oct 2026** | Corrected canonical definition; repaired zero-term convention; reconciled triple counts; updated $R(n^* \pm 1)$; closed P2/P5; reframed P3; updated external Lean status and discovery attribution |
| V40.4 | Oct 2026 | Reproducibility package; added explicit $n^*+1$ witness and reproducibility-gap documentation |
| V40.3 | Sep 2026 | Preprint revision; corrected modular constants and computational documentation |
| V23.4 | Aug 2026 | Archived predecessor; computational audit and Cantor-Pascal diagnostics |
| V15.6 | 2026 | Local defect-geometry framework |

---

## 18. References

1. Sun, Z.-W. (2019). MathOverflow Question 323541.
2. Sun, Z.-W. (2019). *Conjectures on representations involving primes*. Combinatorial and Additive Number Theory III, Springer, Vol. 297.
3. Baruch, Y. (2019). Computational verification associated with OEIS A306477.
4. Alekseyev, M. (2019). Computational verification associated with OEIS A306477.
5. Baruch, Y. (2019). Extended computational verification associated with OEIS A306477.
6. Adamczewski, T. (2026). Independent exhaustive computational checker.
7. OEIS Foundation. A306477.
8. Adamczewski, T. et al. (2026). *OEIS Open: How many conjectures can language models turn into theorems?* arXiv:2608.11941.
9. Google DeepMind. *Formal Conjectures*, A306477 formalization record.
10. Sun, S. (2026). *A Computational Audit of a Candidate Counterexample to Sun's (2,4,6,8) Conjecture*. Zenodo / OSF research record.
11. Hardy, G. H., & Littlewood, J. E. (1920). *Some problems of “Partitio Numerorum” I*. Göttinger Nachrichten.
12. Wooley, T. D. (2012). Vinogradov's mean value theorem via efficient congruencing. *Annals of Mathematics*, 175, 1575–1627.
13. Bourgain, J., Demeter, C., & Guth, L. (2016). Proof of the main conjecture in Vinogradov's mean value theorem. *Annals of Mathematics*, 184, 633–682.

---

## 19. License

* **Code:** Apache License 2.0
* **Documentation and research text:** CC BY 4.0

---

## Research Status

$$\boxed{ \text{A306477 is computationally refuted at } n^* = 896{,}315{,}812{,}331{,}399. }$$

The central remaining research question is no longer whether the conjecture fails, but **why this particular integer becomes an isolated zero of the representation-count function and whether further counterexamples exist**.

```

```
