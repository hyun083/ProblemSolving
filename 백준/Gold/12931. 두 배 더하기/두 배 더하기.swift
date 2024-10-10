import Foundation

let N = Int(readLine()!)!
var B = readLine()!.split(separator: " ").map{Int($0)!}
var ans = 0

while true{
    var cnt = 0
    for i in 0..<N{
        if B[i]%2 == 1{
            B[i] -= 1
            ans += 1
        }
        if B[i]==0{
            cnt += 1
        }
    }
    if cnt == N{ break }
    for i in 0..<N{
        if B[i] > 0{
            B[i] /= 2
        }
    }
    ans += 1
}
print(ans)