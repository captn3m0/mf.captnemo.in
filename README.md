---
---
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/captn3m0/mf.captnemo.in/main) ![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/captn3m0/mf.captnemo.in) ![GitHub](https://img.shields.io/github/license/captn3m0/mf.captnemo.in) ![GitHub Sponsors](https://img.shields.io/github/sponsors/captn3m0) [![Netlify Status](https://api.netlify.com/api/v1/badges/81a9df69-6c56-416e-89f4-a252dd94da1f/deploy-status)](https://app.netlify.com/sites/mf-captnemo/deploys)

Get information about Indian Mutual Funds from their ISIN numbers.

To call this API, you will need an ISIN of a valid Mutual Fund in India. 
You can get ISIN data from various [sources](https://github.com/captn3m0/india-isin-data#alternative-sources).

## API

`/kuvera/:isin`
: ### Mutual Fund Details
This endpoint returns various details about the mutual fund. The schema is documented at <https://stoplight.captnemo.in/docs/kuvera/6744709c28f51-mutual-fund-plan-details>. It only supports Mutual Funds available on Kuvera.
  <details>
  <summary markdown='span'>Show/Hide Sample response
  </summary>
  ```json
[
    {
        "ISIN": "INF843K01FC8",
        "aum": 4118,
        "category": "Debt - Bonds",
        "channel_partner_code": "118PSD1",
        "code": "EDPSD1-GR",
        "crisil_rating": "Moderate Risk",
        "detail_info": "https://www.edelweissmf.com/Download/scheme-information-document.aspx",
        "direct": "Y",
        "expense_ratio": "0.34",
        "expense_ratio_date": "2022-04-30",
        "face_value": null,
        "fund_category": "Banking and PSU Fund",
        "fund_house": "EDELWEISSMUTUALFUND_MF",
        "fund_manager": "Dhawal Dalal; Rahul Dedhia",
        "fund_name": "EDELWEISS Mutual Fund",
        "fund_rating": 5,
        "fund_rating_date": "2022-04-30",
        "fund_type": "Debt",
        "insta_redeem_max_amount": 0.0,
        "insta_redeem_min_amount": 0.0,
        "instant": "N",
        "investment_objective": "YOLO",
        "jan_31_nav": 14.3672,
        "last_nav": {
            "date": "2022-05-30",
            "nav": 20.1379
        },
        "lock_in_period": 0,
        "lump_available": "Y",
        "lump_max": 10000000000000.0,
        "lump_min": 5000.0,
        "lump_min_additional": 500.0,
        "lump_multiplier": 1.0,
        "maturity_type": "Open Ended",
        "name": "Edelweiss Banking & PSU Debt Growth Direct Plan",
        "nav": {
            "date": "2022-05-31",
            "nav": 20.1021
        },
        "plan": "GROWTH",
        "portfolio_turnover": null,
        "redemption_allowed": "Y",
        "redemption_amount_minimum": 500.0,
        "redemption_amount_multiple": 1.0,
        "redemption_quantity_minimum": 0.001,
        "redemption_quantity_multiple": 0.001,
        "reinvestment": "Z",
        "returns": {
            "date": "2022-05-31",
            "inception": 8.34477,
            "week_1": 0.07816,
            "year_1": 1.7323,
            "year_3": 7.81226,
            "year_5": 7.75483
        },
        "short_code": "edelweiss",
        "short_name": "Edelweiss Banking & PSU Debt",
        "sip_available": "Y",
        "sip_dates": ["1","2"],
        "sip_max": 999999999.0,
        "sip_maximum_gap": 60,
        "sip_min": 500.0,
        "sip_multiplier": 1.0,
        "sips": [
            {
                "sip_dates": ["1","2"],
                "sip_frequency": "MONTHLY",
                "sip_maximum_gap": "60",
                "sip_minimum_gap": "0"
            },
            {
                "sip_dates": ["1","2"],
                "sip_frequency": "QUARTERLY",
                "sip_maximum_gap": "100",
                "sip_minimum_gap": "0"
            }
        ],
        "slug": "edelweiss-banking-psu-debt-growth--EDPSD1-GR",
        "start_date": "2013-09-13",
        "stp_flag": "Y",
        "switch_allowed": "Y",
        "swp_flag": "Y",
        "tags": [
            "top_rated"
        ],
        "tax_period": 1095,
        "upsizecode_sip_dates": ["1","2"],
        "volatility": 2.67079
    }
]
```
  </details>

`/nav/:isin`
: ### NAV Details
To just get basic information about a given mutual fund, including the NAV.
  <details>
  <summary markdown='span'>Show/Hide Sample response
  </summary>
  ```json
  {
    "ISIN": "INF843K01FC8",
    "name": "Edelweiss Banking and PSU Debt Fund - Direct Plan - Growth Option",
    "nav": 20.1021,
    "date": "2022-05-31"
  }
  ```
  </details>

This is a much more exhaustive list of Mutual Funds.

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