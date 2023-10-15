import Foundation

var ans = Array(repeating: Array(repeating: 1, count: 201), count: 201)
let (N,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]

for k in 2...200{
    for n in 1...200{
        ans[k][n] = (ans[k][n-1] + ans[k-1][n])%1000000000
    }
}
print(ans[K][N])