import Foundation

let N = Int(readLine()!)!
var arr = [(price: Int, ship:Int)]()
var total =  Int.min
var ans = 0

for _ in 0..<N{
    let PS = readLine()!.split(separator: " ").map{Int($0)!}
    let P = PS[0]
    let S = PS[1]
    arr.append((P,S))
}

arr.sort {$0.price < $1.price}

for i in 0..<N{
    let price = arr[i].price
    var sum = 0
    for k in 0..<N{
        if arr[k].price < price{ continue }
        let income = price - arr[k].ship
        if income < 0 { continue }
        sum += income
    }
    if total < sum{
        total = sum
        ans = price
    }
}
print(total<=0 ? 0:ans)