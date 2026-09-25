#!/usr/bin/env python3
"""
verify_n_star.py
================
Exhaustive computational audit engine for Zhi-Wei Sun's (2,4,6,8) Binomial Representation Conjecture.
Target candidate counterexample: n* = 896,315,812,331,399.

Author: Scott Sun (ORCID: 0009-0002-1095-6228)
Repository: https://github.com/suns1232023/sun-2468-conjecture
Paper Reference: V23.4 Final (OSF DOI: 10.17605/OSF.IO/CAQXH / Zenodo DOI: 10.5281/zenodo.22139197)

Epistemic Status: [COMP_VERIF_CANDIDATE, PENDING_INDEPENDENT_VERIFICATION]
"""

import math
import time
import numpy as np


def verify_n_star(n: int = 896_315_812_331_399):
    """
    Exhaustively enumerates all admissible (z, y, x) triples for a given n
    and verifies whether a valid representation C(w,2) + C(x,4) + C(y,6) + C(z,8) = n
    exists, using exact integer arithmetic (math.isqrt) for discriminant testing.

    Returns:
        found (tuple or None): Solution (w, x, y, z) if found, else None.
        n_zy (int): Total number of evaluated (z, y) pairs.
        n_xyz (int): Total number of evaluated (z, y, x) triples.
        runtime (float): Execution time in seconds.
    """
    # IEEE 754 float64 safety check: max discriminant 8N+1 must not exceed 2^53 for exact representation
    assert 8 * n + 1 < 2**53, "Discriminant exceeds IEEE 754 float64 exact precision limit"

    def build_seq(k: int, limit: int):
        """Generates binomial coefficients C(m, k) up to limit using zero-extension C(m,k)=0 for m<k."""
        vals = []
        m = 2
        while True:
            v = math.comb(m, k) if m >= k else 0
            if v > limit:
                break
            vals.append(v)
            m += 1
        return vals

    # Pre-generate candidate term sequences
    s8 = build_seq(8, n)
    s6 = build_seq(6, n)
    s4 = np.array(build_seq(4, n), dtype=np.int64)

    n_zy = 0
    n_xyz = 0
    found = None

    t0 = time.time()

    # Exhaustive enumeration over admissible z and y
    for v8 in s8:
        rem8 = n - v8
        if rem8 < 0:
            break
        for v6 in s6:
            rem6 = rem8 - v6
            if rem6 < 0:
                break
            n_zy += 1

            # Filter valid x values where C(x, 4) <= rem6
            valid_s4 = s4[s4 <= rem6]
            if len(valid_s4) == 0:
                continue
            n_xyz += len(valid_s4)

            # Compute residuals R = n - C(z,8) - C(y,6) - C(x,4)
            rems = rem6 - valid_s4
            discs = 8 * rems + 1

            # Exact integer square root test (eliminates floating-point rounding errors)
            for i, disc in enumerate(discs):
                s = math.isqrt(disc)
                if s * s == disc and s % 2 == 1:
                    w = (s + 1) // 2
                    if w >= 2:
                        # Extract parameter values
                        found = (w, int(valid_s4[i]), v6, v8)
                        break
            if found:
                break
        if found:
            break

    runtime = time.time() - t0
    return found, n_zy, n_xyz, runtime


def run_unit_tests():
    """Validates the audit algorithm against known representable numbers."""
    test_cases = [1, 4, 9590, 24935, 33845]
    print("=== Running Correctness Validation Unit Tests ===")
    for test_n in test_cases:
        res, zy, xyz, _ = verify_n_star(test_n)
        assert res is not None or test_n == 0, f"Failed verification for known representable n = {test_n}"
        print(f"[PASS] Test n = {test_n:5d} -> Found representation: {res}")
    print("All unit tests passed successfully!\n")


if __name__ == "__main__":
    # 1. Run sanity check unit tests
    run_unit_tests()

    # 2. Run target candidate counterexample audit
    target_n = 896_315_812_331_399
    print(f"=== Starting Exhaustive Computational Audit for n* = {target_n:,} ===")

    found_sol, num_zy, num_xyz, elapsed_time = verify_n_star(target_n)

    print(f"Total Admissible (z, y) Pairs Searched:   {num_zy:,}")
    print(f"Total Admissible (z, y, x) Triples Searched: {num_xyz:,}")
    print(f"Solution Found:                              {found_sol}")
    print(f"Execution Time:                              {elapsed_time:.2f} seconds")

    if found_sol is None:
        print("\nAUDIT RESULT: No representation exists within the complete finite search domain.")
        print("STATUS: [COMP_VERIF_CANDIDATE, PENDING_INDEPENDENT_VERIFICATION]")
