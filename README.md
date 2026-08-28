# Sun's (2,4,6,8) Binomial Representation Program

[![OEIS A306477](https://img.shields.io/badge/OEIS-A306477-2f6f9f)](https://oeis.org/A306477)
[![Zenodo Master DOI](https://img.shields.io/badge/Zenodo-10.5281%2Fzenodo.21544303-168AAD)](https://doi.org/10.5281/zenodo.21544303)
[![Zenodo V23.4 DOI](https://img.shields.io/badge/Zenodo-V23.4-0077B6)](https://doi.org/10.5281/zenodo.22139197)
[![OSF Repository](https://img.shields.io/badge/OSF-CAQXH-blue)](https://osf.io/caqxh)
[![ResearchGate](https://img.shields.io/badge/ResearchGate-Scott__Sun-00CCBB?logo=researchgate)](https://www.researchgate.net/profile/Scott-Sun)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**Computational verification, structural analysis, and explicit counterexample certification framework for Sun's (2,4,6,8) Binomial Representation Conjecture.**

**Current Research Version: Framework V23.4 — August 2026**

---

## 📌 Overview

Sun's **(2,4,6,8) Binomial Representation Conjecture**, recorded in **OEIS A306477**, posits that every positive integer $n$ can be represented as the sum of four binomial coefficients:

$$n = \binom{w}{2} + \binom{x}{4} + \binom{y}{6} + \binom{z}{8}$$

where $w, x, y, z \ge 2$ are integers.

This repository hosts the computational verification engine, exact integer parameter bounding proofs, modular residue diagnostic suite, and replication datasets under **Framework V23.4** (*Final Computational Audit & Candidate Certification Architecture*). 

The V23.4 framework transitions the project from early local defect geometry (V15.6) to an exhaustive computational audit of explicit candidate counterexamples lying beyond the prior $2 \times 10^{12}$ verification bound, paired with exact algebraic modulus surjectivity proofs.

---

# 🔬 Current Framework — V23.4

## Final Computational Audit & Candidate Certification

**Version:** V23.4  
**Date:** August 2026  
**Master Zenodo DOI:** [10.5281/zenodo.21544303](https://doi.org/10.5281/zenodo.21544303)  
**Version 23.4 Zenodo DOI:** [10.5281/zenodo.22139197](https://doi.org/10.5281/zenodo.22139197)  
**OSF Project DOI:** [10.17605/OSF.IO/CAQXH](https://doi.org/10.17605/OSF.IO/CAQXH)

### Epistemic Four-Tier Classification System

To maintain strict scientific rigor and avoid prematurely declaring unverified claims, all results in Framework V23.4 are explicitly labeled using a four-tier epistemic system:

1. **`[THEOREM]`**: Rigorous analytic mathematical proof (e.g., modular surjectivity modulo 231).
2. **`[COMP_VERIF_CANDIDATE]`**: Exhaustively audited integer counterexample candidate pending independent multi-language cross-replication.
3. **`[NUMERICAL]`**: Empirical observation or statistical diagnostic pattern.
4. **`[OPEN]`**: Unresolved theoretical question or conjecture.

---

## 🧭 Key Theoretical & Computational Contributions

### 1. Exhaustive Candidate Audit (`n* = 896,315,812,331,399`) `[COMP_VERIF_CANDIDATE]`
The candidate integer $n^* = 896,315,812,331,399$ (located $\sim 448.2\times$ beyond the $2 \times 10^{12}$ prior verification bound) has been audited across a 100% complete, analytically bounded search domain. 
- **Parameter Bounds:** Individually sharp upper limits derived via binomial monotonicity:
  $$z \le 281, \quad y \le 932, \quad x \le 12{,}112, \quad w \le 42{,}339{,}481$$
- **Domain Coverage:** Exhaustive enumeration across all **2,818,953,028** admissible $(z, y, x)$ parameter triples.
- **Audit Outcome:** Exact integer discriminant evaluation ($\Delta_{\text{sq}}(w) = 8(n^* - \binom{z}{8} - \binom{y}{6} - \binom{x}{4}) + 1$) yields **zero valid integer quadruples** ($a(n^*) = 0$).

### 2. Local Modulus Surjectivity Theorem `[THEOREM]`
Using the Cauchy-Davenport theorem and the Chinese Remainder Theorem, we prove that the auxiliary third-order difference set $D_3 = \{\binom{a}{3} - \binom{b}{3} : a,b \ge 3\}$ satisfies:
$$D_3 \bmod 231 = \mathbb{Z}/231\mathbb{Z}$$
Because $n^* \equiv 152 \pmod{231}$, $n^*$ is modularly admissible. This proves that the non-representability of $n^*$ is **not** caused by local modular residue obstructions modulo 231.

### 3. Cantor-Pascal Diagnostic Framework `[NUMERICAL]`
The framework analyzes scale mismatches between higher-order polynomial step sizes and triangular residuals via base-3 ternary digit distributions. For $n^*$:
$$n^* = 11100112120221210001202202020222_3 \implies f_{go}(n^*) = 9$$

---

# 📊 Status Summary

| Component | Status | Epistemic Tag | Notes / Method |
|---|---|---|---|
| **Exact Parameter Upper Bounding** | Established | `[THEOREM]` | Analytical binomial monotonicity |
| **Local Modulus Surjectivity ($D_3 \bmod 231$)** | Proven | `[THEOREM]` | Cauchy-Davenport + CRT |
| **Exhaustive Domain Verification ($n^*$)** | Complete | `[COMP_VERIF_CANDIDATE]` | Audited $2,818,953,028$ triples |
| **Exact Integer Arithmetic Safeguard** | Active | `[THEOREM]` | Python `math.isqrt` / IEEE 754 ($8n^*+1 < 2^{53}$) |
| **Cantor-Pascal Scale Mismatch ($f_{go}$)** | Evaluated | `[NUMERICAL]` | $f_{go}(n^*) = 9$ (ternary digit distribution) |
| **Multi-Language Independent Replication** | In Progress | `[OPEN]` | Solicit external C++20 / SageMath audits |

---

# 📚 OEIS / Bibliographic Record

The conjecture is officially indexed in the **On-Line Encyclopedia of Integer Sequences**:

**[OEIS A306477](https://oeis.org/A306477)**

The OEIS entry lists Scott Sun's research publications in its **LINKS** section, establishing a direct public academic index for this project:

> Scott Sun, *Additive Representations by Mixed-Degree Binomial Coefficient Sequences: A Computational Investigation of Sun's (2,4,6,8) Conjecture*, ResearchGate (2026).

---

# 📖 Primary V23.4 References

**Scott Sun (2026).**  
*Final Computational Audit & Candidate Certification Architecture for Sun's (2,4,6,8) Binomial Representation Conjecture.*  
**Preprint V23.4, August 2026.**

- **Master Zenodo Repository:** [10.5281/zenodo.21544303](https://doi.org/10.5281/zenodo.21544303)
- **Version 23.4 Artifact DOI:** [10.5281/zenodo.22139197](https://doi.org/10.5281/zenodo.22139197)
- **OSF Project DOI:** [10.17605/OSF.IO/CAQXH](https://doi.org/10.17605/OSF.IO/CAQXH)

---

# 🧮 Reproduction & Execution

To reproduce the candidate audit for $n^* = 896,315,812,331,399$:

```bash
# Clone repository
git clone [https://github.com/Scott-Sun/sun-2-4-6-8-conjecture.git](https://github.com/Scott-Sun/sun-2-4-6-8-conjecture.git)
cd sun-2-4-6-8-conjecture

# Run exact integer computational verification pipeline
python3 src/verification/verify_n_star.py
