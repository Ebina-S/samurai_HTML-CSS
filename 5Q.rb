$even_num = [] #偶数
$odd_num = [] #奇数

def sort_number(num)
     if num % 2 == 0 then
        $even_num.append(num)
     else 
        $odd_num.append(num)
    
     end
end

sort_number(40)
sort_number(51)

p $even_num

p $odd_num