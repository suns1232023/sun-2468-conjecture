# Witness Geometry and Global Crossing Transfer for the Sun (2,4,6,8) Binomial Representation Conjecture

[![OEIS A306477](https://img.shields.io/badge/OEIS-A306477-2f6f9f)](https://oeis.org/A306477)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.22004198.svg)](https://doi.org/10.5281/zen198)
[![OSF Repository](https://img.shields-blue](https://osf.io/cmvuq)
[![OSF Project](https://img.shields.io/badge/OSF-CAQXH-orange)](https://osf.io/hGate](https://img.shields.io/badge/ResearchGate-Scott_Sun-00CCBB?logo=researchgate)](https://www.researchgate-Sun-3)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.[License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://enses/MIT)

---

## Overview

This repository contains the computational infrastructure, datasets, verification scripts, and supporting materials for:

> **Witness Geometry and Global Crossing Transfer for the Sun (2,4,6,8) Binomial Representation Conjecture**
>
> Scott Sun (Version V15.6, August 2026)

The project develops a witness-geometric reformulation of Sun's (2,4,6,8) Binomial Representation Conjecture and introduces a Global Crossing Transfer framework connecting witness trajectories, transfer defects, and large-scale computational verification.

---

## Primary Reference

**Scott Sun (2026)**

*Witness Geometry and Global Crossing Transfer for the Sun (2,4,6,8) Binomial Representation Conjecture*

**Version:** V15.6 (Preprint)

**DOI:**

https://doi.org/10.5281/zenodo.22004198

**OSF Repository:**

https://osf.io/cmvuq

**Project Archive & Code:**

https://osf.io/caqxh

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
w\ge2,\qquad
x\ge4,\qquad
y\ge6,\qquad
z\ge8.
\]

The conjecture was proposed by Professor Zhi-Wei Sun and recorded in:

**OEIS A306477**

https://oeis.org/A306477

---

## Abstract

We study Sun's (2,4,6,8) Binomial Representation Conjecture through a witness-geometric reformulation and introduce a Global Crossing Transfer framework.

The principal contributions of Version V15.6 include:

- Exact identity

\[
w^*(n)=K(n)+\Delta(n)+2
\]

- Identification of the extremal transfer constant

\[
C_T=\frac{64}{19}
\]

- Verification of the subcritical transfer constant

\[
C_K=
\frac{118202}{59375}
<2
\]

- Exhaustive computational verification up to

\[
N=2,000,000
\]

- Reduction of the remaining difficulty to a sharply formulated analytic closure problem involving

\[
H=S_4+S_6+S_8
\]

This repository does **not** claim a proof of the conjecture. Instead, it provides an audited computational framework and a precise formulation of the remaining analytic bottleneck.

---

## Main Results

| Result | Status |
|----------|---------|
| Exact Identity \(w^*=K+\Delta+2\) | Established |
| Extremal Transfer Constant \(C_T=64/19\) | Established |
| Subcritical Bound \(C_K<2\) | Established |
| Computational Verification to \(N=2,000,000\) | Complete |
| Global Crossing Transfer Framework | Developed |
| Analytic Closure Problem | Open |
| Full Proof of Conjecture | Open |

---

## OEIS Connection

The project is directly connected to the public OEIS record:

**OEIS A306477**

https://oeis.org/A306477

The OEIS record includes links to Scott Sun's computational investigation and related public research materials.

This bibliographic connection should not be interpreted as an OEIS endorsement or as a proof of the conjecture.

---

## Repository Structure

```text
.
├── docs/
│   ├── v15_6_preprint.pdf
│   ├── supplementary_materials.pdf
│   └── framework_notes.md
│
├── src/
│   ├── witness_geometry/
│   ├── crossing_transfer/
│   ├── verification/
│   └── utils/
│
├── datasets/
│   ├── witness_tables/
│   ├── transfer_constants/
│   └── verification_results/
│
├── notebooks/
│   ├── witness_geometry_examples.ipynb
│   └── verification_demo.ipynb
│
├── tests/
│   └── unit_tests/
│
├── LICENSE
└── README.md
```

---

## Public Resources

### Zenodo

https://doi.org/10.5281/zenodo.22004198

### OSF Repository

https://osf.io/cmvuq

DOI:

10.17605/OSF.IO/CMVUQ

### OSF Project Archive

https://osf.io/caqxh

DOI:

10.17605/OSF.IO/CAQXH

### ResearchGate

https://www.researchgate.net/profile/Scott-Sun-3

### OEIS

https://oeis.org/A306477

---

## Citation

If you use this repository, please cite:

```bibtex
@misc{sun2026witness,
  author = {Scott Sun},
  title = {Witness Geometry and Global Crossing Transfer for the Sun (2,4,6,8) Binomial Representation Conjecture},
  year = {2026},
  doi = {10.5281/zenodo.22004198}
}
```

---

## Disclaimer

This repository presents computational evidence, structural frameworks, and large-scale verification results.

It does **not** claim a complete proof of Sun's (2,4,6,8) Binomial Representation Conjecture.

The remaining analytic closure problem remains open.

---

## License

Research Content: **CC BY 4.0**

Source Code: **MIT License**

© 2026 Scott Sun
