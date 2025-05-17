import Foundation

let N = Int(readLine()!)!
let atk = readLine()!.split(separator: " ").map{Int($0)!}
let mov = readLine()!.split(separator: " ").map{Int($0)!}
let offset = readLine()!.split(separator: " ").map{Float($0)!}
var ans = 0

for i in 0..<N{
    let A = atk[i]
    let B = mov[i]
    let K = offset[i]
    
    if K < 1{
        let tmp = B*(Int(K*10))/10
        ans += A-tmp
    }else{
        let tmp = A*(Int(K*10))/10
        ans += tmp-B
    }
}
print(ans)