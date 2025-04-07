import Foundation

var arr = 0
var ans = arr
for _ in 0..<4{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let exit = info[0]
    let stay = info[1]
    arr -= exit
    arr += stay
    ans = max(ans, arr)
}
print(ans)