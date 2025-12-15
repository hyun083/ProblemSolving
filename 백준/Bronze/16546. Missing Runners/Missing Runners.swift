import Foundation

let N = Int(readLine()!)!
var ans = Set<Int>(1...N)
let winner = readLine()!.split(separator: " ").map{Int($0)!}
for num in winner{
    ans.remove(num)
}
print(ans.first!)