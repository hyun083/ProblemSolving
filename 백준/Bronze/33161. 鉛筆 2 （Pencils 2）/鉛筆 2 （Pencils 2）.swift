let A = Int(readLine()!)!
var ans = 0
var price = 0

while true {
    if price + 5 <= A{
        price += 5
        ans += 1
    }else{
        break
    }
}

print(ans)