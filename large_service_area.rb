require 'net/http'
require 'json'

# 初期設定
KEYID = "9320b8c80175402a"
COUNT = 100
PREF = "Z011"
FREEWORD = "渋谷駅"
FORMAT = "json"
PARAMS = {"key": KEYID,"format":FORMAT}

def write_data_to_csv(params)
    restaurants = [["コード","名前"]]
    uri = URI.parse("http://webservice.recruit.co.jp/hotpepper/large_service_area/v1/")
    uri.query = URI.encode_www_form(params)  
    json_res = Net::HTTP.get uri
    
    response = JSON.load(json_res)
    
    puts response
    
    if response == nil or response["results"].has_key?("error") then
        puts "エラーが発生しました！"
    end
    for restaurant in response["results"]["large_service_area"] do
        rest_code= [restaurant["code"], restaurant["name"]]
        restaurants.append(rest_code)
    end
    
    File.open("large_service_area_list.csv", "w") do |file|
        file << restaurants
    end
    return puts restaurants
end

write_data_to_csv(PARAMS)