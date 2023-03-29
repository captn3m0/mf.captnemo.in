---
layout: default
permalink: /
---
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/captn3m0/mf.captnemo.in/main) ![GitHub](https://img.shields.io/github/license/captn3m0/mf.captnemo.in) ![GitHub Sponsors](https://img.shields.io/github/sponsors/captn3m0) [![Netlify Status](https://api.netlify.com/api/v1/badges/81a9df69-6c56-416e-89f4-a252dd94da1f/deploy-status)](https://app.netlify.com/sites/mf-captnemo/deploys)

Get information about Indian Mutual Funds from their ISIN numbers.

To call this API, you will need an ISIN of a valid Mutual Fund in India.

You can get ISIN data from various [sources](https://github.com/captn3m0/india-isin-data#alternative-sources), including [CAS Reports](https://mfs.kfintech.com/investor/General/ConsolidatedAccountStatement).

## API Documentation

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
  ```json5
  {
    "ISIN": "INF843K01FC8",
    "name": "Edelweiss Banking and PSU Debt Fund - Direct Plan - Growth Option",
    "nav": 20.1021,
    "date": "2022-05-31",
    "historical_nav": [
        ["2016-11-28",13.4288],
        ["2016-11-29",13.4294],
        ["2016-11-30",13.4365],
        ["2016-12-01",13.4403],
        // More rows
        ["2023-03-20",21.2381],
        ["2023-03-21",21.2344],
        ["2023-03-23",21.2544],
        ["2023-03-24",21.289]
    ]
  }
  ```
  </details>

## cors

All endpoints have CORS enabled, so you can call them directly in your website frontend.

# privacy policy

Logs are not maintained for the service. The website runs directly on the netlify free-tier, which
does not provide Analytics or request logs.

There is no tracking or analytics on the website.

Accuracy of data is not guaranteed, please create an issue on the [historical-mf-data](https://github.com/captn3m0/historical-mf-data)
repo to report any issues regarding accuracy.

## source

The API is built as a static site using Jekyll, and deployed on Netlify.
Lookup data for Kuvera-ISIN mapping is sourced from https://github.com/captn3m0/kuvera-mutual-funds-lookup