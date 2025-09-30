import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let num = Int(readLine()!)!
    let res = num.isMultiple(of: 2) ? "even" : "odd"
    print("\(num) is \(res)")
}