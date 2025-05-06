import Foundation

let PN = readLine()!.split(separator: " ").map{Int($0)!}
var P = PN[0]
let N = PN[1]
var arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
var ans = 0

for i in 0..<N{
    if P < 200{
        P += arr[i]
        ans += 1
    }else{
        break
    }
}
print(ans)