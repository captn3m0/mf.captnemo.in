![GitHub last commit (branch)](https://img.shields.io/github/last-commit/captn3m0/mf.captnemo.in/main) ![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/captn3m0/mf.captnemo.in) ![GitHub](https://img.shields.io/github/license/captn3m0/mf.captnemo.in) [![GitHub Sponsors](https://img.shields.io/github/sponsors/captn3m0)](https://github.com/sponsors/captn3m0) [![Daily Deploy](https://github.com/captn3m0/mf.captnemo.in/actions/workflows/daily-deploy.yml/badge.svg?event=schedule)](https://github.com/captn3m0/mf.captnemo.in/actions/workflows/daily-deploy.yml)

Get information about Indian Mutual Funds from their ISIN numbers, along with complete Historical NAV.

To call this API, you will need an ISIN of a valid Mutual Fund in India.

You can get ISIN data from various [sources](https://github.com/captn3m0/india-isin-data#alternative-sources), including your [CDSL Consolidated Account Statement (CAS)](https://www.camsonline.com/Investors/Statements/Consolidated-Account-Statement).

API documentation is available at <https://mf.captnemo.in>.

## cors

All endpoints have CORS enabled, so you can call them directly in your website frontend.

## credits

This service uses data from 2 sources:

- Kuvera
- AMFI, via [Historical Mutual Fund Database](https://github.com/captn3m0/historical-mf-data)

## how

- A mapping between Kuvera Mutual Fund IDs and ISIN data is fetched from [kuvera-mutual-funds-lookup](https://github.com/captn3m0/kuvera-mutual-funds-lookup) as an automatically updating submodule.
- NAV data from AMFI is updated daily and published as a SQLite Database by https://github.com/captn3m0/historical-mf-data.
- This website takes the above, and publishes it via Netlify.

## update

Updates to the dataset are published daily around 2330 IST, and the site is deployed again around 0230 IST.

## license

Licensed under the [MIT License](https://nemo.mit-license.org/). See [`LICENSE`](https://github.com/captn3m0/mf.captnemo.in/tree/main/LICENSE) file for details.
