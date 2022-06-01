---
layout: default
permalink: /
---

![GitHub last commit (branch)](https://img.shields.io/github/last-commit/captn3m0/mf.captnemo.in/main) ![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/captn3m0/mf.captnemo.in) ![GitHub](https://img.shields.io/github/license/captn3m0/mf.captnemo.in) ![GitHub Sponsors](https://img.shields.io/github/sponsors/captn3m0) [![Netlify Status](https://api.netlify.com/api/v1/badges/81a9df69-6c56-416e-89f4-a252dd94da1f/deploy-status)](https://app.netlify.com/sites/mf-captnemo/deploys)

Get information about Indian Mutual Funds from their ISIN numbers.

To call this API, you will need an ISIN of a valid Mutual Fund in India. 
You can get ISIN data from various [sources](https://github.com/captn3m0/india-isin-data#alternative-sources).

## API

### Mutual Fund Scheme Details

Access `https://mf.captnemo.in/kuvera/:isin`, replacing `:isin` with the actual ISIN code.

The schema is documented at <https://stoplight.captnemo.in/docs/kuvera/6744709c28f51-mutual-fund-plan-details>.
While this endpoint provides a lot of information, this only supports Mutual Funds available on Kuvera.

### NAV

To just get basic information about a given mutual fund, including the NAV, use `https://mf.captnemo.in/nav/:isin.json`. The
response will look like:

```json
{
  "ISIN": "INF843K01FC8",
  "name": "Edelweiss Banking and PSU Debt Fund - Direct Plan - Growth Option",
  "nav": 20.1021,
  "date": "2022-05-31"
}
```

## credits

This service uses data from 2 sources:

- Kuvera
- AMFI

## how

- A mapping between Kuvera Mutual Fund IDs and ISIN data is maintained in [_data/`lookup.csv`](https://github.com/captn3m0/mf.captnemo.in/blob/main/_data/lookup.csv).
- NAV data from AMFI is updated daily and saved in [_data/nav.csv](https://github.com/captn3m0/mf.captnemo.in/blob/main/_data/nav.csv)

##

## license

Licensed under the [MIT License](https://nemo.mit-license.org/). See LICENSE file for details.