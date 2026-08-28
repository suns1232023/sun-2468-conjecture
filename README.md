.
├── src/
│   ├── verification/
│   │   ├── verify_n_star.py        # Core candidate audit script (n*)
│   │   └── bounds_calculator.py    # Analytical upper bound solver (z, y, x, w)
│   ├── diagnostics/
│   │   ├── cantor_pascal.py        # Base-3 ternary gap-order analysis
│   │   └── modular_surjectivity.py # Modulo 231 residue set calculator
│   └── utils/
│       └── exact_math.py           # IEEE 754 precision safeguards & isqrt logic
│
├── verification_logs/
│   ├── v23_4/                      # Complete verification output logs for n*
│   └── historical_v15_6/           # Legacy V15.6 defect-capacity logs
│
├── datasets/
│   └── candidate_n_star.json       # Metadata & bounds for n* = 896,315,812,331,399
│
├── docs/
│   ├── osf_registration_v23.4.md   # OSF Registration Update documentation
│   └── theoretical_framework_v23.4.md
│
├── tests/
│   └── test_exact_integer.py
│
├── LICENSE
└── README.md
