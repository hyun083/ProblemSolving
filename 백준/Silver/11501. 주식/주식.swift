import Foundation

for _ in 0..<Int(readLine()!)!{
    let n = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map{Int($0)!}.reversed()
    var target = arr.first!
    var ans = 0
    for price in arr{
        if price < target{
            ans += (target-price)
        }else if price > target{
            target = price
        }
    }
    print(ans)
}