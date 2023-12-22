import Foundation

let N = Int(readLine()!)!
var map = readLine()!.split(separator: " ").map{Int($0)!}
var S = Int(readLine()!)!-1

var visited = Array(repeating: false, count: N)
var q = [S]
var idx = 0
var ans = 1

while idx<q.count{
    let curr = q[idx]
    
    var next = curr+map[curr]
    if next<N && !visited[next]{
        visited[next] = true
        ans += 1
        q.append(next)
    }
    
    next = curr-map[curr]
    if 0<=next && !visited[next]{
        visited[next] = true
        ans += 1
        q.append(next)
    }
    idx += 1
}
print(ans)