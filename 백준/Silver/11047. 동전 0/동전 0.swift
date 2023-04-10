import Foundation

var count = 0
let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = inputs[0]
var K = inputs[1]

var coins = [Int]()

for _ in 1...N{
    coins.append(Int(readLine()!)!)
}

while coins.last! > K{
    coins.removeLast()
}

while K != 0{
    count += K/coins.last!
    K -= coins.last! * (K / coins.last!)
    coins.removeLast()
}
print(count)