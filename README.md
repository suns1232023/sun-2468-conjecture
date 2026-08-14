# Sun's (2,4,6,8) Binomial Representation Program

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21765015.svg)](https://doi.org/10.5281/zenodo.21765015)
[![OSF Project](https://img.shields.io/badge/OSF-10.17605%2FOSF.IO%2FCAQXH-blue)](https://osf.io/caqxh)
[![ResearchGate](https://img.shields.io/badge/ResearchGate-Scott__Sun-00CCBB?logo=researchgate)](https://www.researchgate.net/profile/Scott-Sun)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Official software implementation, numerical verification suite, and hypermartingale gap analysis pipeline supporting **Framework V12.4** for **Sun's (2,4,6,8) Binomial Representation Conjecture**.

> **Primary Reference**: Sun, S. (2026). *Computational Evidence and Conjectural Framework for Sub-Square-Root Gap Growth in Binomial Sumsets $S_4+S_6+S_8$: Object-Driven Paradigm, Exhaustive Verification to $10^{12}$, and a Conditional Supermartingale Cluster Decay Theorem* (Preprint V12.4).  
> **DOI**: [10.5281/zenodo.21765015](https://doi.org/10.5281/zenodo.21765015) | **OSF**: [10.17605/OSF.IO/CAQXH](https://doi.org/10.17605/OSF.IO/CAQXH)

---

## 📌 Theoretical Overview

Sun's (2,4,6,8) Conjecture (OEIS A306477) asserts that every positive integer $n$ can be represented in the mixed-degree binomial form:
$$n = \binom{w}{2} + \binom{x}{4} + \binom{y}{6} + \binom{z}{8} \quad (w,x,y,z \ge 2)$$

This repository hosts the computational backbone for **Framework V12.4**, featuring:
- **Exhaustive $10^{12}$ Verification**: Parallel sumset decomposition over 10 orders of magnitude confirm Sub-Square-Root Gap Growth ($\text{MaxGap}(X) \approx 0.9841 \cdot X^{0.4789}$).
- **Hypermartingale Gap Decay Model**: Implementation of the empirical supermartingale test ($\mathbb{E}[g_{i+1}/g_i \mid g_i > T] \le 1 - c$ with $c \approx 0.4912$).
- **Frozen Zero-Set $\mathcal{E}_8$**: Verification and monitoring of the permanent exception set $\mathcal{E}_8 = \{1, 2, 3, 5, 7, 11\}$ strictly invariant for $X \ge 10^4$.
- **Modular Congruence Elimination**: Structural checks verifying $R_4(24) = \mathbb{Z}_{24}$ (no local $p$-adic obstructions).

---

## 📁 Repository Structure

```text
.
├── src/                        # Core Mathematical Algorithms (Python / SageMath)
│   ├── max_gap_evaluator.py    # Sub-Square-Root Gap Growth & power-law regression fitting
│   ├── supermartingale_test.py # Multiplicative elasticity & gap decay constant (c ≈ 0.49)
│   ├── translation_solver.py   # Intersection evaluator (N - S_8) ∩ (S_2 + S_4 + S_6) != ∅
│   ├── zero_set_e8_tracker.py  # Rigid monitoring of frozen zero-set E_8 = {1,2,3,5,7,11}
│   └── utils.py                # Binomial coefficient helpers and parallelized bitset solvers
├── verification_logs/          # Large-Scale Computational Outputs
│   ├── gap_growth_10e12.json   # Power-law fit data & maximum gap records up to 10^12
│   └── zero_set_e8.log         # Complete logs confirming E_8 frozen status
├── notebooks/                  # Interactive Verification & Statistical Tutorials
│   └── tutorial_gap_decay_10e12.ipynb
├── docs/                       # Theoretical Research Framework Documentation
│   └── research_framework_v12.4.md
├── tests/                      # Unit & Integration Tests
│   └── test_binomial_solver.py
├── LICENSE                     # Code: MIT | Content: CC BY 4.0
└── README.md
