import Foundation

let N = Int(readLine()!)!
var tmp = String(repeating: "*", count: N)
var ans = [String]()

for _ in 0..<N{
    ans.append(tmp)
    tmp.removeLast()
}
print(ans.joined(separator: "\n"))