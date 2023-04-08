import Foundation

let N = Int(readLine()!)!

var grade = Array(repeating: [Int](), count: N)
var arr = Array(repeating: [Int](), count: N)
var time = Array(repeating: Int(), count: N)
var indegree = Array(repeating: 0, count: N)
var ans = Array(repeating: 0, count: N)

for i in 0..<N{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    let g = line[0]-1
    time[i] = line[1]
    grade[g].append(i)
}

for i in 0..<N-1{
    let curr = grade[i]
    let next = grade[i+1]
    
    for k in 0..<curr.count{
        let U = curr[k]
        
        for p in 0..<next.count{
            let V = next[p]
            arr[U].append(V)
            indegree[V] += 1
        }
    }
}

var q = [(num:Int, time:Int)]()
for i in 0..<N{
    if indegree[i] == 0{
        q.append((i,time[i]))
        ans[i] = time[i]
    }
}

var idx = 0
while idx < q.count{
    let currNum = q[idx].num
    let currTime = q[idx].time
    
    for next in arr[currNum]{
        let transTime = (currNum-next)*(currNum-next)+currTime+time[next]
        ans[next] = max(ans[next], transTime)
        
        indegree[next] -= 1
        if indegree[next] == 0{
            q.append((next,ans[next]))
        }
    }
    
    idx += 1
}
print(ans.max()!)