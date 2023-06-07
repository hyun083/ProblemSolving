import Foundation

let N = Int(readLine()!)!
var numbers = [Int]()

for _ in 0..<N{
    let number = Int(readLine()!)!
    numbers.append(number)
}
if N == 0{
    print(0)
}else{
    numbers.sort()
    let detent = Int((Double(N) * 0.15) + 0.5)
    let sum = Double(numbers[detent..<N-detent].reduce(0, +))
    let ans = sum/Double(N-(2*detent))
    print(Int(ans+0.5))
}