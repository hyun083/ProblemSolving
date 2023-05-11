import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let INF = 50000001
    let NMT = readLine()!.split(separator: " ").map{Int($0)!}
    let N = NMT[0]
    let M = NMT[1]
    let T = NMT[2]
    
    let SGH = readLine()!.split(separator: " ").map{Int($0)!}
    let S = SGH[0]-1
    let G = SGH[1]-1
    let H = SGH[2]-1
    
    var arr = Array(repeating: [(node:Int, cost:Int)](), count: N)
    for _ in 0..<M{
        let info = readLine()!.split(separator: " ").map{Int($0)!}
        let a = info[0]-1
        let b = info[1]-1
        let d = info[2]
        
        arr[a].append((b,d))
        arr[b].append((a,d))
    }
    
    var dest = [Int]()
    for _ in 0..<T{
        dest.append(Int(readLine()!)!-1)
    }
    dest.sort(by: <)
    
    func dijk(from:Int) -> [Int]{
        var res = Array(repeating: INF, count: N)
        var visited = Array(repeating: false, count: N)
        var q = [(node:Int, cost:Int)]()
        
        q.append((from,0))
        res[from] = 0
        
        while !q.isEmpty{
            q.sort(by: {$0.cost > $1.cost})
            
            let curr = q.removeLast()
            visited[curr.node] = true
            
            for next in arr[curr.node]{
                if visited[next.node]{ continue }
                let newCost = curr.cost + next.cost
                
                if res[next.node] > newCost{
                    res[next.node] = newCost
                    q.append((next.node, newCost))
                }
            }
        }
        return res
    }
    
    let minCost_S = dijk(from: S)
    let minCost_G = dijk(from: G)
    let minCost_H = dijk(from: H)
    
    var ans = [String]()
    for target in dest{
        if minCost_S[target] == minCost_S[G] + minCost_G[H] + minCost_H[target] ||
        minCost_S[target] == minCost_S[H] + minCost_H[G] + minCost_G[target]{
            ans.append("\(target+1)")
        }
    }
    
    print(ans.joined(separator: " "))
}