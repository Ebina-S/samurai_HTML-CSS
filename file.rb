h = { "Sho" => 25, "Ryo" => 31, "Jho" => 18 }
f = File.open("samurai_name_age.txt","w")
 
h.each do |name, age|
  f.puts "#{name}: #{age}"
end
 
f.close