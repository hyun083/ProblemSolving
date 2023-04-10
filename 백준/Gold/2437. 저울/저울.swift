import Foundation

let N = Int(readLine()!)!
let weights = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
var number = 1

for weight in weights {
    if weight > number{
        break
    }
    number += weight
}
print(number)