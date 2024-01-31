import Foundation

let S = readLine()!.map{String($0)}
let set:Set<String> = ["a","e","i","o","u"]
var ans = 0

for s in S{
    ans += set.contains(s) ? 1:0
}
print(ans)