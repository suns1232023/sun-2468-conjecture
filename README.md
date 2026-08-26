# Sun's (2,4,6,8) Binomial Representation Program

[![OEIS A306477](https://img.shields.io/badge/OEIS-A306477-2f6f9f)](https://oeis.org/A306477)
[![V15.6 DOI](https://img.shields.io/badge/Zenodo-V15.6-168AAD)](https://doi.org/10.5281/zenodo.22004198)
[![OSF Repository](https://img.shields.io/badge/OSF-CMVUQ-blue)](https://osf.io/cmvuq)
[![ResearchGate](https://img.shields.io/badge/ResearchGate-Scott__Sun-00CCBB?logo=researchgate)](https://www.researchgate.net/profile/Scott-Sun)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**Computational verification, structural analysis, and formalization framework for the Sun (2,4,6,8) Binomial Representation Conjecture.**

**Current Research Version: Framework V15.6 — August 2026**

---

## 📌 Overview

Sun's **(2,4,6,8) Binomial Representation Conjecture**, recorded as **OEIS A306477**, concerns representations of positive integers by mixed-degree binomial coefficients.

The conjectural representation is

$$
n =
\binom{w}{2}
+
\binom{x}{4}
+
\binom{y}{6}
+
\binom{z}{8},
$$

with the relevant variables satisfying the required lower bounds.

The current research program develops a **witness-geometric and additive-combinatorial framework** for studying the conjecture.

The V15.6 framework focuses on:

- witness geometry;
- amortized defect capacity;
- exact witness identities;
- transfer constants;
- global crossing mechanisms;
- short-interval coverage of the Minkowski sum
  \(H=S_4+S_6+S_8\);
- computational verification;
- independent verification pipelines;
- Lean 4 formalization.

> **Important:** V15.6 does **not** claim a proof of the conjecture. It establishes a computationally audited proof architecture and isolates the remaining analytic closure problem.

---

# 🔬 Current Framework — V15.6

## Witness Geometry and Global Crossing Transfer

The current research formulation is:

> **Witness Geometry and Global Crossing Transfer for the Sun (2,4,6,8) Binomial Representation Conjecture**

**Version:** V15.6  
**Date:** August 19, 2026  
**Primary DOI:** [10.5281/zenodo.22004198](https://doi.org/10.5281/zenodo.22004198)

The V15.6 framework reformulates the representation problem through the geometry of admissible witnesses and the transfer of local defect information into global coverage.

### Core Structural Identity

A central identity in the framework is

$$
w^*(n)=K(n)+\Delta(n)+2.
$$

This decomposes the critical witness scale into:

- \(K(n)\): the principal structural contribution;
- \(\Delta(n)\): the accumulated defect contribution;
- \(2\): the fixed triangular offset.

---

## 🧭 Amortized Defect-Capacity Framework

The defect structure is quantified through

$$
D(n)
=
\sum_{j\ge2}
\frac{L_j}{w_j}.
$$

This provides an amortized measure of how local gaps or defects consume the available witness capacity.

The purpose of this construction is not merely to describe numerical behavior, but to establish a mechanism through which local obstruction can be transferred and controlled across the witness trajectory.

---

## 🔄 Global Crossing Transfer

The V15.6 proof architecture separates the problem into two layers.

### Local Layer

Control the geometry and accumulated defect of individual witnesses.

### Global Layer

Convert this local control into a crossing statement for the additive sumset

$$
H=S_4+S_6+S_8.
$$

The remaining difficulty is therefore formulated as a **short-interval coverage problem for \(H\)**.

This is the principal analytic closure problem of the current framework.

---

# 📊 Principal V15.6 Results

## 1. Extremal Transfer Constant

The framework identifies the extremal transfer constant

$$
C_T=\frac{64}{19},
$$

arising from the tight configuration

$$
n=55{,}858.
$$

---

## 2. Subcritical Structural Constant

The corresponding subcritical constant is

$$
C_K=
\frac{118202}{59375}
<2.
$$

The strict inequality

$$
C_K<2
$$

is structurally important for the intended global transfer mechanism.

---

## 3. Exact Witness Decomposition

The framework establishes the exact relation

$$
w^*(n)=K(n)+\Delta(n)+2.
$$

This provides the principal bridge between witness geometry and defect-capacity analysis.

---

## 4. Exhaustive Computational Verification

The V15.6 computational program reports exhaustive verification through

$$
N=2{,}000{,}000,
$$

with **zero reported violations across multiple independent verification pipelines**.

The computational layer is used as an audit and falsification-control mechanism for the proposed structural framework.

It is not presented as a proof of the universal conjecture.

---

# ⚠️ Proof Status

The current status is:

| Component | V15.6 Status |
|---|---|
| Witness-geometric reformulation | Established framework |
| Exact witness identity | Established |
| Amortized defect-capacity formulation | Established framework |
| Transfer constant \(C_T=64/19\) | Computationally identified |
| Subcritical constant \(C_K<2\) | Verified within framework |
| Exhaustive verification to \(2\times10^6\) | Passed |
| Global crossing mechanism | Framework established |
| Short-interval coverage of \(H=S_4+S_6+S_8\) | **Open** |
| Universal proof of the conjecture | **Not yet established** |

> **Scientific claim boundary:** The project currently provides a structured and computationally audited route toward a proof. It does not claim that the conjecture has been proved.

---

# 📚 OEIS / Research Record

The conjecture is officially indexed as:

**[OEIS A306477](https://oeis.org/A306477)**

The OEIS record originates from the work of **Zhi-Wei Sun** and includes the corresponding computational sequence data and references.

The current OEIS record also lists Scott Sun's 2026 research publication in its **LINKS** section:

> Scott Sun, *Additive Representations by Mixed-Degree Binomial Coefficient Sequences: A Computational Investigation of Sun's (2,4,6,8) Conjecture*, ResearchGate (2026).

[ResearchGate publication](https://www.researchgate.net/profile/Scott-Sun-3/publication/410979202)

This establishes a public bibliographic connection between:

**Zhi-Wei Sun's original conjecture → OEIS A306477 → Scott Sun's 2026 computational investigation.**

This should be understood as a **bibliographic/indexing relationship**, not as an endorsement or proof of the V15.6 results by OEIS.

---

# 📖 Primary V15.6 Reference

**Scott Sun (2026).**

*Witness Geometry and Global Crossing Transfer for the Sun (2,4,6,8) Binomial Representation Conjecture.*

**Preprint V15.6, August 19, 2026.**

**DOI:**  
[10.5281/zenodo.22004198](https://doi.org/10.5281/zenodo.22004198)

**OSF Repository:**  
[10.17605/OSF.IO/CMVUQ](https://doi.org/10.17605/OSF.IO/CMVUQ)

**Code / Project DOI:**  
[10.17605/OSF.IO/CAQXH](https://doi.org/10.17605/OSF.IO/CAQXH)

---

# 🧮 Computational Program

The repository contains the computational infrastructure used to investigate the structural claims.

The current program includes:

- numerical verification;
- witness trajectory analysis;
- defect-capacity calculations;
- transfer-constant evaluation;
- gap and coverage analysis;
- independent verification pipelines;
- reproducibility logs;
- supplementary datasets;
- Python computational scripts;
- Lean 4 formalization modules.

The computational results are intended to provide:

1. **falsification testing** of proposed structural claims;
2. **extremal-case discovery**;
3. **constant identification**;
4. **independent numerical auditing**;
5. **formalization support** for the mathematical framework.

---

# 📁 Repository Structure

```text
.
├── src/
│   ├── witness_geometry/
│   ├── defect_capacity/
│   ├── crossing_transfer/
│   ├── verification/
│   └── utils/
│
├── verification_logs/
│   ├── v15_6/
│   └── independent_pipelines/
│
├── datasets/
│   └── v15_6/
│
├── notebooks/
│   └── v15_6/
│
├── lean/
│   └── formalization/
│
├── docs/
│   └── research_framework_v15.6.md
│
├── tests/
│
├── LICENSE
└── README.md
