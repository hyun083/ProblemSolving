import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
var ans = Array(repeating: Int.max, count: n)
var map = Array(repeating: [[Int]](), count: n)
for _ in 0..<m{
    let abc = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = abc[0] - 1
    let b = abc[1] - 1
    let c = abc[2]
    map[a].append([b,c])
}

ans[0] = 0
var minusLoop = false
for loop in 0..<n{
    for curr in 0..<n{
        for info in map[curr]{
            let next = info[0]
            let time = info[1]
            if ans[curr] != Int.max && ans[next] > ans[curr]+time{
                ans[next] = ans[curr]+time
                if loop == n-1 { minusLoop = true }
            }
        }
    }
}

if minusLoop{
    print(-1)
}else{
    for i in 1..<n{
        print(ans[i] != Int.max ? ans[i]:-1)
    }
}