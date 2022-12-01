#!/bin/sh

mint run swiftlint lint --quiet --strict
swiftlint=$?
mint run swiftformat --lint .
swiftformat=$?

exit $swiftlint && $swiftformat
