import Foundation

let N = Int(readLine()!)!
let AB = readLine()!.split(separator: " ").map{Int($0)!}
let A = AB[0]
let B = AB[1]
var price = A
var cal = Int(readLine()!)!
var arr = [Int]()

for _ in 0..<N{
    let D = Int(readLine()!)!
    arr.append(D)
}
arr.sort(by: >)

for topping in arr{
    let curr = cal/price
    let next = (cal+topping)/(price+B)
    if next >= curr{
        cal += topping
        price += B
    }
}

print(cal/price)