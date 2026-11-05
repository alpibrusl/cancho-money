#!/bin/sh
# Run the cancho-money tests. CANCHO overrides the compiler path (default: `cancho` on PATH).
cd "$(dirname "$0")/.."
exec "${CANCHO:-cancho}" test tests/money_test.cho src/money.cho --std
