![GitHub last commit (branch)](https://img.shields.io/github/last-commit/captn3m0/mf.captnemo.in/main) ![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/captn3m0/mf.captnemo.in) ![GitHub](https://img.shields.io/github/license/captn3m0/mf.captnemo.in) [![GitHub Sponsors](https://img.shields.io/github/sponsors/captn3m0)](https://github.com/sponsors/captn3m0) [![Netlify Status](https://api.netlify.com/api/v1/badges/81a9df69-6c56-416e-89f4-a252dd94da1f/deploy-status)](https://app.netlify.com/sites/mf-captnemo/deploys)

Get information about Indian Mutual Funds from their ISIN numbers.

To call this API, you will need an ISIN of a valid Mutual Fund in India.

You can get ISIN data from various [sources](https://github.com/captn3m0/india-isin-data#alternative-sources), including your [CDSL Consolidated Account Statement (CAS)](https://www.camsonline.com/Investors/Statements/Consolidated-Account-Statement).

API documentation is available at <https://mf.captnemo.in>.

## cors

All endpoints have CORS enabled, so you can call them directly in your website frontend.

## credits

This service uses data from 2 sources:

- Kuvera
- AMFI

## how

- A mapping between Kuvera Mutual Fund IDs and ISIN data is maintained in [_data/`lookup.csv`](https://github.com/captn3m0/mf.captnemo.in/blob/main/_data/lookup.csv).
- NAV data from AMFI is updated daily and saved in [_data/nav.csv](https://github.com/captn3m0/mf.captnemo.in/blob/main/_data/nav.csv)

## license

Licensed under the [MIT License](https://nemo.mit-license.org/). See [`LICENSE`](https://github.com/captn3m0/mf.captnemo.in/tree/main/LICENSE) file for details.
