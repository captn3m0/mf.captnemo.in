require 'json'
require 'sqlite3'

# Open database for reading only
DB = SQLite3::Database.new('funds.db', :readonly => true)

def get_historical_nav(isin)
  DB.execute("SELECT date, nav from nav_by_isin WHERE isin='#{isin}' ORDER BY date")
end

def get_latest_nav(isin)
  DB.execute("SELECT nav,date from nav_by_isin WHERE isin='#{isin}' ORDER BY date DESC LIMIT 1")[0]
end

def get_mutual_fund_schemes
  DB.execute("SELECT isin,scheme_name as name,S1.scheme_code FROM securities S1
    LEFT JOIN schemes S2 ON S1.scheme_code = S2.scheme_code")
end

Jekyll::Hooks.register :site, :after_init do |site|
  get_mutual_fund_schemes.each do |isin, scheme_name|
    puts "[+] #{isin}, #{scheme_name}"
    nav = get_latest_nav(isin)

    data = {
      'ISIN'=> isin,
      'name'=> scheme_name,
    }
    if nav
      data['nav'] = nav[0]
      data['date']= nav[1]
    end

    data['historical_nav'] = get_historical_nav(data['ISIN'])
    File.write("nav/#{data['ISIN']}", data.to_json) 
  end
end