import Foundation

let n = Int(readLine()!)!
var arr = Array(repeating: [Int](), count: n)
var degree = Array(repeating: 0, count: n)
var visited = Array(repeating: false, count: n)

for i in 0..<n{
    let info = readLine()!.split(separator: " ").map{Int($0)!-1}
    arr[i] = info
    degree[info[0]] += 1
    degree[info[1]] += 1
}

var q = [Int]()
for i in 0..<n{
    if degree[i] < 2{
        q.append(i)
        visited[i] = true
    }
}

var idx = 0
while idx < q.count{
    let curr = q[idx]
    
    for next in arr[curr]{
        degree[next] -= 1
        if degree[next] < 2 && !visited[next]{
            visited[next] = true
            q.append(next)
        }
    }
    
    idx += 1
}

var ans = [String]()
for i in 0..<n{
    if degree[i] > 0{
        ans.append(String(i+1))
    }
}

if ans.count > 0{
    print(ans.count)
    print(ans.joined(separator: " "))
}else{
    print(0)
}