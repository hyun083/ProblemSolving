import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var A = Array(repeating: Array(repeating: Int(), count: M), count: N)

for n in 0..<N{
    let num = readLine()!.split(separator: " ").map{Int($0)!}
    for m in 0..<M{
        A[n][m] = num[m]
    }
}

let MK = readLine()!.split(separator: " ").map{Int($0)!}
let K = MK[1]
var B = Array(repeating: Array(repeating: Int(), count: K), count: M)

for n in 0..<M{
    let num = readLine()!.split(separator: " ").map{Int($0)!}
    for k in 0..<K{
        B[n][k] = num[k]
    }
}

var ans = Array(repeating: Array(repeating: 0, count: K), count: N)
for n in 0..<N{
    for k in 0..<K{
        for m in 0..<M{
            ans[n][k] += A[n][m] * B[m][k]
        }
    }
}

for n in 0..<N{
    for k in 0..<K{
        print(ans[n][k],terminator:" ")
    }
    print()
}