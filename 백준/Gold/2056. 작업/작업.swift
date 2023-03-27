import Foundation

let n = Int(readLine()!)!
var map = Array(repeating: [Int](), count: n)
var time = Array(repeating: 0, count: n)
var ans = Array(repeating: 0, count: n)
var degree = Array(repeating: 0, count: n)
var q = [Int]()

for i in 0..<n{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    time[i] = info[0]
    degree[i] = info[1]
    if info[1]==0{
        q.append(i)
    }else{
        for k in 2..<info.count{
            map[info[k]-1].append(i)
        }
    }
}
ans = time

while !q.isEmpty{
    var dq = q
    q.removeAll()
    
    for _ in 0..<dq.count{
        let curr = dq.removeLast()

        for next in map[curr]{
            degree[next] -= 1
            ans[next] = max(ans[next], ans[curr]+time[next])
            if degree[next]==0{
                q.append((next))
            }
        }
    }
}
print(ans.max()!)