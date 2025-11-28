import Foundation

let N = Int(readLine()!)!
let ans = readLine()!.map{$0.isLowercase ? $0.uppercased() : $0.lowercased()}
print(ans.joined())