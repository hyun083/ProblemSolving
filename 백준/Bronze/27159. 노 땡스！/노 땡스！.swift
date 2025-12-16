import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
var res = [arr[0]]
var ans = 0

for i in 1..<N{
    if arr[i]-res.last! == 1{
        res.append(arr[i])
    }else{
        ans += res[0]
        res = [arr[i]]
    }
}
ans += res[0]
print(ans)