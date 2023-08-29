import Foundation

let t = Int(readLine()!)!

for _ in 0..<t{
    let n = Int(readLine()!)!
    var output = Array(repeating: "=", count: n).joined(separator: "")
    print(output)
}