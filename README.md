---
layout: default
permalink: /
---

# mf.captnemo.in

Get information about Indian Mutual Funds from their ISIN numbers.

You can get ISIN data from various [sources](https://github.com/captn3m0/india-isin-data#alternative-sources).

Access `https://mf.captnemo.in/:isin`, replacing `:isin` with the actual ISIN code.

The schema is documented at <https://stoplight.captnemo.in/docs/kuvera/6744709c28f51-mutual-fund-plan-details>.

## credits

This service redirects users to the corresponding [Kuvera](https://kuvera.com) API URL for the underlying data.

## how

A mapping between Kuvera Mutual Fund IDs and ISIN data is maintained in `lookup.csv`.

## license

Licensed under the [MIT License](https://nemo.mit-license.org/). See LICENSE file for details.