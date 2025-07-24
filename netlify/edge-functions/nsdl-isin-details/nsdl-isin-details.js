import { fetchWithCache } from '@netlify/cache'
import * as cheerio from "https://esm.sh/v135/cheerio"

export default async (request, context) => {
  let isin = (new URL(request.url)).pathname.split('/')[3]
  // @docs https://docs.netlify.com/build/caching/cache-api/#fetchwithcache
  let url = `https://nsdl.co.in/master_search_detail_res.php?isin=${isin}`
  const res = await fetchWithCache(url, {
      headers: {
        "user-agent": "Mozilla/Gecko/Firefox/113.0"
      }
    },{
    // This would share the cache between regions
    // Does not work with Edge Functions, hence commented
    // durable: true,
    // TTL to 1d
    // Cache response for a day
    ttl: 84600,
    // We don't want cache to be invalidated if a new deploy is made
    overrideDeployRevalidation: "nsdl-single-isin-html",
    // Stale-While-Revalidate - 300 seconds after the response has expired
    // during which it can still be served while it’s revalidated in the
    // background
    swr: 300
  })

  if (!res.ok) {
    new Response({"error": "Failed to fetch ISIN Details from NSDL"})
  }

  function jsonresponse(obj, status, headers = {
        'Content-Type': 'application/json',
        'Cache-Control': 'public, max-age=84600'
      }){
    return new Response(JSON.stringify(obj), {
      status: status,
      headers:  headers
    });
  }

  let body = await res.text()
  const $ = cheerio.load(body)

  // Search for table id="printTable" and if not found, return a 404
  if ($('#printTable').length === 0) {
    return new jsonresponse({"error": "ISIN Details not found"})
  }
  function makeSelectorCallback(headerText) {
    return (el, key) => {
      if ($(el).find('.tableheader').text().trim() === headerText) {
        return $(el).find('.tablecontent1').text().trim()
      }
    }
  }

  const data = $.extract({rows:[{
    selector: 'table#printTable tr',
    value: {
      key: '.tableheader',
      value: '.tablecontent1',
    }
  }]})['rows']
  const SUBSTRING_TO_KEY_LABELS = {
    'ISIN:': 'isin',
    'ISIN Description': 'description',
    'Name Of Issuer': 'issuer',
    'Former': 'formerName',
    'Security': 'type',
    'Status': 'status',
    'Face': 'faceValue',
    'Address Of Issuer': 'issuerAddress',
    'Contact': 'contactPersonDetails',
    'Registrar': 'registrarName',
    'Business': 'RTA',
    'Services': 'serviced'
  }
  
  // Map Key/Value to an Object
  const result = {}
  data.forEach(item => {
    if (item.key && item.value) {
      let newKey = Object.keys(SUBSTRING_TO_KEY_LABELS).find(substring => item.key.includes(substring))

      if (newKey) {

        result[SUBSTRING_TO_KEY_LABELS[newKey]] = item.value.length>0 ? item.value : null
      }
    }
  })


  return jsonresponse({
    issuer: {
      name: result.issuer || null,
      formerName: result.formerName || null,
      address: result.issuerAddress || null,
      contact: result.contactPersonDetails || null
    },
    description: result.description || null,
    isin: result.isin || null,
    type: result.type || null,
    status: result.status || null,
    faceValue: result.faceValue || null,
    registrar: {
      name: result.registrarName || null,
      id: result.RTA || null
    },
    // Field is called "Services stopped by RTA"
    serviced: result.serviced == "NO" ? true : false
  }, 200, {
    'Content-Type': 'application/json',
    'Cache-Control': 'public, max-age=84600',
    'Link': `<${url}>; ; rel=alternate;type=text/html`
 });
}