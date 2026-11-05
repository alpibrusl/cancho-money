# cancho-money

Exact decimal monetary arithmetic for [cancho](https://github.com/alpibrusl/cancho): an amount is an integer count of minor units plus an ISO 4217 currency. No floats, no silent rounding, and mixing currencies is refused. Sibling for Lex: [lex-money](https://github.com/alpibrusl/lex-money).

**Status: alpha.** `src/money.cho`, 14 tests.

```cancho
let (price, code) = money.parse("42.15", money.currency_of("EUR"));   // 4215 minor units
let (sum, code2)  = money.add(price, price);                           // refuses a different currency
let text          = money.format(heap, sum);                           // "84.30"
let (mine, code3) = money.share(sum, 3, 0);                            // 8430 among 3: 2810, 2810, 2810 (remainder to the first shares)
```

* **`parse`** reads `"42.15"`, `"-0.5"`, `"1000"` exactly. Fractional digits beyond the currency's exponent are accepted only if they are zeros (`"10.670"` is 10.67); `"10.675"` is refused (`r_precision`), never rounded. Strict grammar: an optional `-`, digits, and optionally `.` with digits on both sides.
* **Exponents** follow ISO 4217: 0 for JPY, KRW and the other whole-unit currencies, 3 for KWD, BHD and friends, 4 for CLF, else 2.
* **`add`, `sub`, `compare`** refuse mixed currencies (`r_currency_mismatch`) and a result past an int (`r_overflow`).
* **`share(total, parts, index)`** splits a total so the shares add up exactly and differ by at most one minor unit; the first `total % parts` shares are larger. A negative total (a refund) splits the same way.
* **`format`** is the inverse of `parse`.

Refusals are return codes, not traps: a malformed amount is an input problem.

## Not built

Currency conversion and exchange rates, percentages and rounding modes (rounding is deliberately absent: `parse` refuses it), a full ISO 4217 table (only the currencies whose exponent is not 2 are listed), and formatting with symbols or locales.

## Test

```sh
CANCHO=/path/to/cancho scripts/test.sh     # or `cancho` on PATH
```

The suite was checked by deliberately breaking the code (19 breakages) and confirming a test goes red; the one survivor is equivalent (a guard that a neighbouring check already makes redundant).

Licence: EUPL-1.2.
