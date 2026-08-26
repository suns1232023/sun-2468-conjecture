# Witness Geometry and Global Crossing Transfer for the Sun (2,4,6,8) Binomial Representation Conjecture

[![OEIS A306477](https://img.shields.io/badge/OEIS-A306477-2f6f9f)](https://oeis.org/A306477)
https://zenodo.org/badge/DOI/10.5281/zenodo.22004198.svg](https://doi.org/10.5281/zenodo.22004198)
https://img.shields.io/badge/OSF-CMVUQ-blue](https://osf.io/cmvuq)
https://img.shields.io/badge/Code-CAQXH-orange](https://osf.io/caqxh)
https://img.shields.io/badge/ResearchGate-Scott%20Sun-00CCBB?logo=researchgate](https://www.researchgate.net/profile/Scott-Sun-3)
https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg](https://creativecommons.org/licenses/by/4.0/)
https://img.shields.io/badge/License-MIT-yellow.svg](https://opensource.org/licenses/MIT)

---

## Overview

This repository hosts the computational infrastructure, datasets, verification scripts, and supporting materials for:

> **Witness Geometry and Global Crossing Transfer for the Sun (2,4,6,8) Binomial Representation Conjecture**
>
> Scott Sun (Version V15.6, August 2026)

The project studies Sun's mixed-degree binomial representation conjecture through a witness-geometric framework, global crossing transfer mechanisms, defect-capacity analysis, and large-scale computational verification.

---

## The Conjecture

Sun's (2,4,6,8) Binomial Representation Conjecture (OEIS A306477) states that every sufficiently large positive integer can be represented in the form

\[
n=
\binom{w}{2}
+
\binom{x}{4}
+
\binom{y}{6}
+
\binom{z}{8}
\]

with

\[
w\ge 2,\quad
x\ge 4,\quad
y\ge 6,\quad
z\ge 8.
\]

Originally proposed by Professor Zhi-Wei Sun and recorded as:

- OEIS A306477
- https://oeis.org/A306477

---

## Main Contributions of V15.6

### 1. Exact Witness Identity

The framework establishes the identity

\[
w^*(n)=K(n)+\Delta(n)+2.
\]

This relation forms the backbone of the witness-geometric construction.

---

### 2. Extremal Transfer Constant

Identification of the extremal transfer constant

\[
C_T=\frac{64}{19}.
\]

This constant arises from the critical configuration centered around

\[
n=55,858.
\]

---

### 3. Subcritical Transfer Bound

Verification of

\[
C_K=
\frac{118202}{59375}
<
2.
\]

This provides a key subcriticality condition within the transfer framework.

---

### 4. Computational Verification

Independent computational pipelines verify the framework up to

\[
N=2,000,000.
\]

No violations were found.

---

### 5. Analytic Reduction

The remaining difficulty is reduced to a sharply formulated analytic closure problem involving

\[
H=S_4+S_6+S_8.
\]

The project does not claim a proof of the conjecture.

---

## Project Status

| Component | Status |
|------------|---------|
| Witness Geometry Framework | Developed |
| Global Crossing Transfer | Developed |
| Exact Identity \(w^*=K+\Delta+2\) | Established |
| Extremal Constant \(C_T=64/19\) | Established |
| Computational Verification | Complete to N=2,000,000 |
| Analytic Closure Problem | Open |
| Full Proof of Conjecture | Open |

---

## Related Records

### Zenodo

Primary publication:

https://doi.org/10.5281/zenodo.22004198

---

### OSF Repository

Research archive:

https://osf.io/cmvuq

DOI:

10.17605/OSF.IO/CMVUQ

---

### OSF Project (Code & Computational Assets)

https://osf.io/caqxh

DOI:

10.17605/OSF.IO/CAQXH

---

### OEIS

Official conjecture record:

https://oeis.org/A306477

---

### ResearchGate

Author profile:

https://www.researchgate.net/profile/Scott-Sun-3

---

## Repository Structure

```text
.
├── docs/
│   ├── v15_6_preprint.pdf
│   ├── framework_notes.md
│   └── supplementary_materials.md
│
├── src/
│   ├── witness_geometry/
│   ├── crossing_transfer/
│   ├── verification/
│   └── utils/
│
├── datasets/
│   ├── verification_results/
│   ├── witness_tables/
│   └── transfer_constant_data/
│
├── notebooks/
│   ├── verification_demo.ipynb
│   └── witness_geometry_examples.ipynb
│
├── tests/
│   └── unit_tests/
│
├── LICENSE
└── README.md
