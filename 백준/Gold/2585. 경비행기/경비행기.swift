import Foundation

let (N,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = [(x:Int, y:Int)]()
var ans = Int.max

for _ in 0..<N{
    let (X,Y) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    arr.append((X,Y))
}

func cost(from a:(x:Int, y:Int), to b:(x:Int, y:Int)) -> Int{
    let X = Double(a.x-b.x)*Double(a.x-b.x)
    let Y = Double(a.y-b.y)*Double(a.y-b.y)
    let dist = Int(ceil(sqrt(X+Y)))
    
    return dist%10==0 ? dist/10:dist/10+1
}

func bfs(limit:Int) -> Bool{
    var visited = Array(repeating: false, count: N)
    var q = [(x:Int, y:Int, cnt:Int, cost:Int)]()
    var dq = q
    
    q.append((0,0,0,0))
    
    while !q.isEmpty{
        dq = q
        q.removeAll()
        
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            if curr.cnt >= K+1{ continue }
            
            let res = cost(from: (curr.x,curr.y), to: (10000,10000))
            if  res <= limit{
                ans = max(res, curr.cost)
                return true
            }
            
            for i in 0..<arr.count{
                let newCost = cost(from: (curr.x,curr.y), to: arr[i])
                if newCost<=limit && !visited[i]{
                    visited[i] = true
                    q.append((arr[i].x,arr[i].y,curr.cnt+1, max(newCost,curr.cost)))
                }
            }
        }
    }
    return false
}

var lo = 0
var hi = Int.max/2

while lo<=hi{
    let mid = (lo+hi)/2
    if bfs(limit: mid){
        hi = mid-1
    }else{
        lo = mid+1
    }
}
print(ans)