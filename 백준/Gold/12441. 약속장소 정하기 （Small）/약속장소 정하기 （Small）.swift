import Foundation

let T = Int(readLine()!)!
let MAX = 2147483648

for num in 1...T{
    let NPM = readLine()!.split(separator: " ").map{Int($0)!}
    let N = NPM[0]
    let P = NPM[1]
    let M = NPM[2]
    var friends = [(DEP:Int, TIME:Int)]()
    var map = Array(repeating: [(node:Int, cost:Int)](), count: N)
    
    for _ in 0..<P{
        let XV = readLine()!.split(separator:  " ").map{Int($0)!}
        let X = XV[0]-1
        let V = XV[1]
        friends.append((X,V))
    }
    
    for _ in 0..<M{
        let info = readLine()!.split(separator:  " ").map{Int($0)!}
        let cost = info[0]
        let cnt = info[1]
        for i in 2..<cnt+1{
            let u = info[i]-1
            let v = info[i+1]-1
            map[u].append((v, cost))
            map[v].append((u,cost))
        }
    }
    
    func dijk(from DEP:Int , time:Int) -> [Int]{
        var res = Array(repeating: MAX, count: N)
        var q = [(node:Int, cost:Int)]()
        
        q.append((DEP,0))
        res[DEP] = 0
        
        while !q.isEmpty{
            let curr = q.removeLast()
            if res[curr.node] < curr.cost{ continue }
            
            for next in map[curr.node]{
                let newCost = curr.cost + (next.cost*time)
                if res[next.node] > newCost{
                    res[next.node] = newCost
                    q.append((next.node, newCost))
                }
            }
            
            q.sort { $0.cost > $1.cost }
        }
        
        return res
    }
    var ans = Array(repeating: 0, count: N)
    for friend in friends{
        let res = dijk(from: friend.DEP, time: friend.TIME)
        for i in 0..<N{
            ans[i] = max(ans[i],res[i])
        }
    }
    print("Case #\(num): \(ans.min()! == MAX ? -1:ans.min()!)")
}