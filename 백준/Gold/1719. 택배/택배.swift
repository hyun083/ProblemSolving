import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]

var arr = Array(repeating: [(node:Int, cost:Int)](), count: N)
var ans = Array(repeating: Array(repeating: "-", count: N), count: N)

for _ in 0..<M{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    let U = line[0]-1
    let V = line[1]-1
    let C = line[2]
    
    arr[U].append((V,C))
    arr[V].append((U,C))
}

func dijk(from:Int){
    var visited = Array(repeating: false, count: N)
    var res = Array(repeating: Int.max, count: N)
    
    res[from] = 0
    var q = [(node:Int, cost:Int, origin:Int)]()
    
    for next in arr[from]{
        res[next.node] = next.cost
        q.append((next.node,next.cost,next.node))
        ans[from][next.node] = "\(next.node+1)"
    }
    
    while !q.isEmpty{
        q.sort(by: { $0.cost > $1.cost})
        let curr = q.removeLast()
        
        visited[curr.node] = true
        
        for next in arr[curr.node]{
            let newCost = curr.cost + next.cost
            if visited[next.node] { continue }
            if res[next.node] > newCost{
                res[next.node] = newCost
                q.append((next.node,newCost,curr.origin))
                ans[from][next.node] = "\(curr.origin+1)"
            }
        }
    }
}

for i in 0..<N{
    dijk(from: i)
}

for ans in ans{
    print(ans.joined(separator: " "),terminator: "\n")
}