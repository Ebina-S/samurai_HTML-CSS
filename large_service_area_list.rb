require 'net/http'
require 'json'
require "csv"

# 初期設定
KEYID = "9320b8c80175402a"
COUNT = 100
PREF = "Z011"
FREEWORD = "京都"
FORMAT = "json"
PARAMS = {"key": KEYID, "keyword":FREEWORD, "format":FORMAT}

def write_data_to_csv(params)

    restaurants = []
    uri = URI.parse("http://webservice.recruit.co.jp/hotpepper/large_area/v1/")
    uri.query = URI.encode_www_form(params)  

    json_res = Net::HTTP.get uri
    
    
    response = JSON.load(json_res)
    
    puts response #ここの出力でデータ構造を見る
    
    if response == nil or response["results"].has_key?("error") then
        puts "エラーが発生しました！"
    end
    
    #large_areaを出力（成功）
    for largerestaurant in response["results"]["large_area"] do
        rest1_info = [largerestaurant["code"], largerestaurant["name"]]
        restaurants.append(rest1_info)
    end
    
    #large_service_areaを出力
        largesrestauran1t = response["results"]["large_area"][0]["large_service_area"]["code"] 
        restaurants.append(  largesrestauran1t )
        largesrestauran2t = response["results"]["large_area"][0]["large_service_area"]["name"]
        restaurants.append(  largesrestauran2t )
    
    
    #service_areを出力
        
        servicerestauran1t = response["results"]["large_area"][0]["service_area"]["code"]
        restaurants.append( servicerestauran1t )
        servicerestauran2t = response["results"]["large_area"][0]["service_area"]["name"]
        restaurants.append( servicerestauran2t )
    
    
    
    
    File.open("large_service_area_list.csv", "w") do |file|
        file << restaurants
    end
    return puts restaurants
end

write_data_to_csv(PARAMS)