require 'csv'
require 'json'

module AMFI
  class Generator < Jekyll::Generator
    def generate(site)
      Dir.mkdir("nav") if !Dir.exist?('nav')
      data = CSV.read('_data/nav.csv', col_sep: ';', headers: ['code', 'isin', 'reinvestment_isin', 'name', 'nav', 'date'])[1..]
      data.each do |nav_data|
        date = Date.parse(nav_data['date']).strftime('%Y-%m-%d')
        data = {
          'ISIN'=> nav_data['isin'],
          'name'=> nav_data['name'],
          'nav' => nav_data['nav'],
          'date'=> date
        }
        File.write("nav/#{data['ISIN']}.json", data.to_json) if data['ISIN'].length == 12
        if nav_data['reinvestment_isin'].length == 12
          data = {
            'ISIN'=> nav_data['reinvestment_isin'],
            'name'=> nav_data['name'] + " (Reinvestment)",
            'nav' => nav_data['nav'],
            'date'=> date
          }
          File.write("nav/#{data['ISIN']}.json", data.to_json)
        end
      end
    end
  end
end