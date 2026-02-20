import Foundation

let str = readLine()!.map{String($0)}
var pre = ""
var ans = 1

for curr in str {
    if curr == pre {
        ans *= curr=="d" ? 9:25
    } else {
        ans *= curr=="d" ? 10:26
    }
    pre = curr
}
print(ans)