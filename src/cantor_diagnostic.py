#!/usr/bin/env python3
"""
cantor_diagnostic.py
====================
Cantor-Pascal Diagnostic Framework for Zhi-Wei Sun's (2,4,6,8) Binomial Representation Conjecture.
Computes the ternary expansion, digit counts, and fractal gap order statistic fgo(n) for a given integer.

Author: Scott Sun (ORCID: 0009-0002-1095-6228)
Repository: https://github.com/suns1232023/sun-2468-conjecture
Paper Reference: V23.4 Final (OSF DOI: 10.17605/OSF.IO/CAQXH / Zenodo DOI: 10.5281/zenodo.22139197)

Epistemic Status: [NUMERICAL] (Descriptive statistic and diagnostic observation)
"""

def cantor_diagnostic(n: int = 896_315_812_331_399):
    """
    Computes the ternary expansion and fractal gap order (fgo) statistic for n.

    Args:
        n (int): Target integer to analyze.

    Returns:
        dict: A dictionary containing ternary representation details, digit counts, and fgo.
    """
    if n <= 0:
        raise ValueError("Input must be a positive integer.")

    digits = []
    tmp = n
    while tmp > 0:
        digits.append(tmp % 3)
        tmp //= 3
    digits.reverse()

    ones_positions = [i for i, d in enumerate(digits) if d == 1]
    zeros_count = digits.count(0)
    twos_count = digits.count(2)
    fgo = len(ones_positions)

    # Correctness check: total digits sum must equal expansion length
    assert zeros_count + fgo + twos_count == len(digits), "Digit count mismatch!"

    ternary_str = "".join(map(str, digits))

    print(f"=== Cantor-Pascal Diagnostic Analysis for n* = {n:,} ===")
    print(f"Ternary Expansion: {ternary_str}_3")
    print(f"Expansion Length:  {len(digits)} ternary digits")
    print(f"Digit '0' Count:   {zeros_count}")
    print(f"Digit '1' Count:   {fgo}  (Positions [0-indexed]: {ones_positions})")
    print(f"Digit '2' Count:   {twos_count}")
    print(f"Fractal Gap Order: fgo(n*) = {fgo}")
    print("=========================================================\n")

    return {
        "n": n,
        "ternary_str": ternary_str,
        "length": len(digits),
        "digit_0_count": zeros_count,
        "digit_1_count": fgo,
        "digit_2_count": twos_count,
        "fgo": fgo,
        "ones_positions": ones_positions,
    }


if __name__ == "__main__":
    # Execute diagnostic for target candidate n* = 896,315,812,331,399
    target_n = 896_315_812_331_399
    results = cantor_diagnostic(target_n)

    # Sanity checks matching Paper V23.4
    assert results["length"] == 32, f"Expected 32 digits, got {results['length']}"
    assert results["fgo"] == 9, f"Expected fgo(n*) = 9, got {results['fgo']}"
    assert results["digit_0_count"] == 10, f"Expected 10 zeros, got {results['digit_0_count']}"
    assert results["digit_2_count"] == 13, f"Expected 13 twos, got {results['digit_2_count']}"
    print("[SUCCESS] All diagnostic assertions verified against Paper V23.4!")
