#!/bin/sh

mint run swiftlint --fix --quiet
swiftlint=$?
mint run swiftformat --quiet .
swiftformat=$?

exit $swiftlint && $swiftformat
