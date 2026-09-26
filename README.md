 
# Sun's (2,4,6,8) Binomial Representation Program
 
[![OEIS A306477](https://img.shields.io/badge/OEIS-A306477-2f6f9f)](https://oeis.org/A306477)
[![Zenodo Master DOI](https://img.shields.io/badge/Zenodo-10.5281%2Fzenodo.21544303-168AAD)](https://doi.org/10.5281/zenodo.21544303)
[![Zenodo V23.4 DOI](https://img.shields.io/badge/Zenodo-V23.4-0077B6)](https://doi.org/10.5281/zenodo.22139197)
[![OSF Repository](https://img.shields.io/badge/OSF-CAQXH-blue)](https://osf.io/caqxh)
[![ResearchGate](https://img.shields.io/badge/ResearchGate-Scott__Sun-00CCBB?logo=researchgate)](https://www.researchgate.net/profile/Scott-Sun)
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
 
**Computational verification, independent replication, Lean 4 formalization, and second-counterexample search for Sun's (2,4,6,8) Binomial Representation Conjecture.**
 
**Current Research Version: V40.3 — September 2026**  
*(Supersedes V23.4, August 2026)*
 
---
 
## 📌 Overview
 
Sun's **(2,4,6,8) Binomial Representation Conjecture**, recorded in **OEIS A306477**, posits that every positive integer $n \ge 4$ can be represented as:
 
$$n = \binom{w}{2} + \binom{x}{4} + \binom{y}{6} + \binom{z}{8}, \quad w \ge 2,\ x \ge 4,\ y \ge 6,\ z \ge 8$$
 
This repository hosts the computational verification engine, algebraic parameter bounding proofs, Lean 4 formalization infrastructure, and the ongoing search for a second counterexample.
 
**The candidate counterexample $n^* = 896{,}315{,}812{,}331{,}399$ has been computationally verified by 12 independent implementations and an external exhaustive checker. Lean 4 chunk-level kernel verification is complete; end-to-end certificate is pending.**
 
---
 
## 🔬 Current Framework — V40.3
 
### Evidence Ladder
 
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
 
### Epistemic Classification System
 
All results are labeled using a five-tier system:
 
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
 
Located approximately $448	imes$ beyond the prior $2 	imes 10^{12}$ verification bound.
 
**Search space completeness `[THEOREM]`:** Any representation must satisfy:
 
$$z \le 281, \quad y \le 932, \quad x \le 12{,}112, \quad w \le 42{,}339{,}481$$
 
These bounds follow from $C(z,8) \le n^*$ etc. and are strict algebraic inequalities.
 
**Exhaustive search:** All **2,818,953,028** admissible $(z,y,x)$ triples verified; zero solutions found.
 
**Triple-count reconciliation:**
 
| Layer | Count | Description |
|-------|-------|-------------|
| Algebraic domain | 2,818,953,028 | All admissible triples (Theorem 3.1) |
| This work (12 kernels) | 2,818,953,028 | Full exhaustive, no pre-filtering |
| External checker | 2,755,643,831 | After sound residue-class pre-filters |
| Solutions found | 0 | All methods agree |
 
### 2. Cross-Validation `[COMP_VERIF]`
 
$$\binom{33{,}663{,}667}{2} + \binom{9{,}433}{4} + \binom{16}{6} + \binom{9}{8} = n^* - 1$$
 
Verifiable in one line: `math.comb(33663667,2)+math.comb(9433,4)+math.comb(16,6)+math.comb(9,8)`
 
### 3. Discriminant Framework `[THEOREM]`
 
For fixed $(x,y,z)$, set $D = 8(n^* - C(x,4) - C(y,6) - C(z,8)) + 1$. Then $D \equiv 1 \pmod{8}$, and since odd squares satisfy $s^2 \equiv 1 \pmod{8}$, the gap $\delta_D := D - s_0^2 \equiv 0 \pmod{8}$. If $\delta_D 
e 0$, then $|\delta_D| \ge 8$.
 
**Note:** This is a reformulation of the search criterion, not an independent obstruction theorem.
 
**Computational observation `[NUMERICAL]`:** $\delta_D^{\min} = 8$ across all 2,818,953,028 triples.
 
### 4. Lean 4 Formalization `[FORMALIZATION]`
 
An independent formalization effort (OEIS Open project, Adamczewski et al., arXiv:2608.11941) has produced a Lean 4 proof infrastructure:
 
- **Prime list:** $PL = \{5, 11, 17, 23, 29, 41, 47, 53, 59, 71, 83, 89, 101, 107, 113, 131, 137, 149, 167, 173, 179, 191, 197\}$
- **Property:** All $p \in PL$ satisfy $p \equiv 2 \pmod{3}$, $p 
e 2$ (reason unknown, [OPEN])
- **7 proof chunks:** All pass `decide +kernel`
- **Exhaustive verifier:** 2,755,643,831 triples, solutions = 0
- **End-to-end compilation:** Pending (memory constraint)
 
The Google DeepMind `formal-conjectures` repository currently lists A306477 as `research open` in its main branch, pending formal announcement.
 
### 5. Negative Search Evidence `[COMP_VERIF]`
 
No second counterexample found in:
 
| Region | Coverage | Result |
|--------|----------|--------|
| $n^* \pm 50{,}000$ | Complete enumeration | None |
| $[10^{15},\ 10^{15}+200K]$ | Complete enumeration | None |
| Sparse structural regions | 5,030,500 evaluations | None |
 
These searches do not establish the non-existence of a second counterexample.
 
---
 
## ⚠️ Correction Note
 
Earlier versions of this project contained the following errors, corrected in V40.3:
 
| Error | Earlier Version | Correct Value |
|-------|----------------|---------------|
| $n^* \bmod 13$ | 1 | **5** |
| $n^* \bmod 5005$ | 1769 | **4464** |
| Modular claim | $C(y,6)+C(z,8) 
ot\equiv 14 \pmod{17}$ | **False** (counterexample: $y=11, z=10$) |
| Lean status | "Level 6: Formal Proof complete" | **chunk-level verified; end-to-end pending** |
 
All numerical constants in the current version have been independently verified by code.
 
---
 
## 📊 Status Summary
 
| Component | Status | Tag |
|-----------|--------|-----|
| Algebraic parameter bounds | Complete | `[THEOREM]` |
| Exhaustive verification ($n^*$) | Complete | `[COMP_VERIF]` |
| 12 independent implementations | Complete | `[COMP_VERIF]` |
| External independent checker | Complete | `[COMP_VERIF]` |
| Cross-validation ($R(n^*-1)=1$) | Complete | `[COMP_VERIF]` |
| Lean 4 chunk-level verification | Complete | `[FORMALIZATION]` |
| Lean 4 end-to-end certificate | Pending | `PENDING` |
| Second counterexample search | Ongoing | `[OPEN]` |
| Analytic proof of $R(n^*)=0$ | Open | `[OPEN]` |
 
---
 
## 🔑 Key Verified Constants
 
```python
N = 896_315_812_331_399
assert N % 5 == 4 and N % 7 == 5 and N % 11 == 9
assert N % 13 == 5   # Note: NOT 1
assert N % 17 == 14
assert N % 385 == 229 and N % 5005 == 4464  # Note: NOT 1769
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
 
# Cross-validation: R(n*-1) = 1
assert (math.comb(33663667,2)+math.comb(9433,4)+
        math.comb(16,6)+math.comb(9,8)) == 896_315_812_331_398
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
3. Baruch, Y. (2019). Verification to $5 	imes 10^8$. OEIS A306477 comments.
4. Alekseyev, M. (2019). Verification to $2 	imes 10^{11}$. OEIS A306477 comments.
5. Baruch, Y. (2019). Verification to $2 	imes 10^{12}$. OEIS A306477 comments.
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
│   ├── verify_n_star.py          # Reference verifier (early-exit)
│   ├── count_representations.py  # Count-based verifier (exact R(n))
│   ├── cantor_diagnostic.py      # Cantor-Pascal diagnostics
│   └── v34_engine.cpp            # Multi-sub-agent C++20 search engine
├── lean/
│   └── A306477.lean              # Lean 4 formalization
├── data/
│   ├── milestones.log            # Search milestones (with exact R verification)
│   └── candidates.csv            # Candidate evaluations
├── preprint/
│   └── V40.3_preprint.docx       # Current preprint (supersedes V23.4)
└── README.md
```
 
---
 
## 🔓 Open Problems
 
| # | Problem | Status |
|---|---------|--------|
| P0 | Analytic proof that $R(n^*)=0$, independent of computation | [OPEN] |
| P1 | Does a second counterexample $n^{**} > n^*$ exist? | [OPEN] |
| P2 | Why does the Lean proof prime list $PL$ consist of primes $p \equiv 2 \pmod{3}$? | [OPEN] |
| P3 | Prove analytically that $\delta_D \ge 8$ for all admissible triples | [OPEN] |
| P4 | Complete Lean 4 end-to-end compilation | PENDING |
| P5 | Develop a theory of sparse additive image sets | [OPEN] |
| P6 | Is the set of counterexamples finite? | [OPEN] |
| P7 | Characterize which binomial sums admit counterexamples | [OPEN] |
 
---
 
## 📜 Version History
 
| Version | Date | Description |
|---------|------|-------------|
| V40.3 | Sep 2026 | Current: 5 referee issues resolved, count verifier added, density table corrected |
| **V23.4** | **Aug 2026** | **Archived predecessor: candidate discovery, Cantor-Pascal diagnostics** |
| V15.6 | 2026 | Local defect geometry framework |
 
---
 
## 📄 License
 
- **Code:** [Apache License 2.0](https://opensource.org/licenses/Apache-2.0)
- **Documentation & Preprints:** [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
 
