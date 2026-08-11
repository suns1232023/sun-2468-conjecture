# Sun's (2,4,6,8) Binomial Representation Program

[![OSF Project](https://img.shields.io/badge/OSF-10.17605%2FOSF.IO%2FCAQXH-blue)](https://osf.io/caqxh)
[![ResearchGate](https://img.shields.io/badge/ResearchGate-Scott__Sun-00CCBB?logo=researchgate)](https://www.researchgate.net/profile/Scott-Sun)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Official software implementation, numerical verification suite, and error-tree analysis pipeline supporting **Framework V12.1** for **Sun's (2,4,6,8) Binomial Representation Conjecture**.

---

## 📌 Theoretical Overview

Sun's (2,4,6,8) Conjecture asserts that every positive integer $N$ can be represented in the mixed-degree binomial form:
$$N = \binom{x_2}{2} + \binom{x_4}{4} + \binom{x_6}{6} + \binom{x_8}{8}$$

This repository hosts the computational backbone for **Framework V10.3**, which incorporates:
- **Formal Error Dynamics**: Finite-difference descent and normalized failure density $H^*(E_k, N)$.
- **Bootstrapping Lemma (BL)**: Gap coverage analysis and extended numerical checks up to $x \le 1000$.
- **Failure Set Tracking**: Rigorous enumeration of the permanent failure set $\mathcal{E}_8 = \{1, 2, 3, 5, 7, 11\}$.

---

## 📁 Repository Structure

```text
.
├── src/                        # Core Mathematical Algorithms (Python / SageMath)
│   ├── bootstrapping_lemma.py  # BL verification for C(x,7) in S_2 + S_4 + S_6 + S_8
│   ├── counterexample_search.py# Identifies historical counterexamples (e.g., x = 31, 32, 35)
│   ├── translation_solver.py   # Evaluates (N - S_8) ∩ (S_2 + S_4 + S_6) != ∅
│   ├── error_tree_descent.py   # Numerical evaluation of failure set E_8 = {1,2,3,5,7,11}
│   └── utils.py                # Binomial coefficient helpers and standardizers
├── verification_logs/          # Raw Outputs & Verification Records
│   ├── bl_verification_1000.json
│   └── failure_set_e8.log
├── examples/                   # Interactive Verification Tutorials
│   └── tutorial_2468_verification.ipynb
├── docs/                       # Extended Research Framework Documentation
│   └── research_framework_v10.3.md
├── tests/                      # Unit & Integration Tests
│   └── test_binomial_solver.py
├── LICENSE                     # Code: MIT | Content: CC BY 4.0
└── README.md
