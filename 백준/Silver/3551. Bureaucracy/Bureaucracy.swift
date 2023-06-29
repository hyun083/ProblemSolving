import Foundation

let N = Int(readLine()!)!
var arr = Array(repeating: [Int](), count: N)
var indegree = Array(repeating: 0, count: N)
var ans = Array(repeating: true, count: N)

for i in 0..<N{
    let line = readLine()!.split(separator: " ").map{String($0)}
    if line[0] == "cancel"{
        let num = Int(line[1])!-1
        indegree[num] += 1
        arr[i].append(num)
    }
}

var q = [(Int)]()
for i in 0..<N{
    if indegree[i] == 0{
        q.append((i))
    }
}

var idx = 0
while idx < q.count{
    let curr = q[idx]
    let isActive = ans[curr]
    
    for next in arr[curr]{
        indegree[next] -= 1
        if isActive{ ans[next] = false }
        if indegree[next] == 0{
            q.append((next))
        }
    }
    
    idx += 1
}

var result = [String]()
for i in 0..<N{
    if ans[i]{
        result.append("\(i+1)")
    }
}

print(result.count)
print(result.joined(separator: " "))