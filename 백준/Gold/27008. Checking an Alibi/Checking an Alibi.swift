import Foundation

let FPCM = readLine()!.split(separator: " ").map{Int($0)!}
let F = FPCM[0], P = FPCM[1], C = FPCM[2], M = FPCM[3]
var map = Array(repeating: [(node:Int, cost:Int)](), count: F)

for _ in 0..<P{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let U = info[0]-1
    let V = info[1]-1
    let C = info[2]
    
    map[U].append((V,C))
    map[V].append((U,C))
}

var cowInTheFarm = Array(repeating: [Int](), count: F)
for cow in 0..<C{
    let num = Int(readLine()!)!-1
    cowInTheFarm[num].append(cow)
}

func dijk(from DEP:Int)->[Int]{
    var q = [(node:Int, cost:Int)]()
    var minCost = Array(repeating: Int.max, count: F)
    minCost[DEP] = 0
    q.append((DEP,0))
    while !q.isEmpty{
        let curr = q.removeLast()
        if curr.cost > minCost[curr.node]{
            continue
        }
        
        for next in map[curr.node]{
            let newCost = curr.cost + next.cost
            if newCost < minCost[next.node]{
                minCost[next.node] = newCost
                q.append((next.node, newCost))
            }
        }
        
        q.sort(by: {$0.cost > $1.cost})
    }
    
    return minCost
}

let res = dijk(from: 0)
var ans = [Int]()

for i in 0..<F{
    let curr = res[i]
    if curr<=M{
        for cow in cowInTheFarm[i]{
            ans.append(cow+1)
        }
    }
}
ans.sort(by: <)
print(ans.count)
for cow in ans{
    print(cow)
}