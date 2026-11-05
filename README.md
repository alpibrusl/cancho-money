# cancho-money

Exact decimal monetary arithmetic for [cancho](https://github.com/alpibrusl/cancho): an amount is an integer count of minor units plus an ISO 4217 currency. No floats, no silent rounding, and mixing currencies is refused.

**Status: placeholder. Nothing is built yet.** It exists because `cancho`'s `std` has no exact decimal type (only float parsing in `std.json`), and a booking system must not compute prices in floats. Sibling for Lex: [lex-money](https://github.com/alpibrusl/lex-money).

## Planned scope

* `Money { minor: int, currency }` with `add`, `sub`, `mul_int`, `cmp`; cross-currency operations are an error, not a conversion.
* ISO 4217 table: code, numeric code, minor-unit exponent (JPY 0, EUR 2, KWD 3).
* Parse and format decimal strings exactly ("123.45" and back), the form payment APIs such as Duffel use.
* Allocation (`split` N ways with remainders handed out deterministically) for group cost splitting.
* Explicit rounding modes where rounding is unavoidable (percentages, FX).

Licence: EUPL-1.2.
