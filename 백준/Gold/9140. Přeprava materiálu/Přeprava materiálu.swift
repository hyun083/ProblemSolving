import Foundation

while let line = readLine(){
    if line == "0 0 0 0" { break }
    let NMSC = line.split(separator: " ").map{Int($0)!}
    let N = NMSC[0], M = NMSC[1], S = NMSC[2]-1, C=NMSC[3]-1
    var map = Array(repeating: [(node:Int, cost:Int)](), count: N)

    for _ in 0..<M{
        let UVC = readLine()!.split(separator: " ").map{Int($0)!}
        let U = UVC[0]-1, V = UVC[1]-1, C = UVC[2]
        map[U].append((V,C))
    }
    
    func dijkstra(from DEP:Int)->[Int]{
        var minCost = Array(repeating: Int.max, count: N)
        
        var queue: [(node:Int, cost:Int)] = [(DEP,0)]
        minCost[DEP] = 0
        
        while !queue.isEmpty{
            let curr = queue.removeLast()
            if curr.cost > minCost[curr.node]{ continue }
            
            for next in map[curr.node]{
                let newCost = curr.cost + next.cost
                if newCost < minCost[next.node]{
                    minCost[next.node] = newCost
                    queue.append((next.node, newCost))
                }
            }
            queue.sort(by: { $0.cost > $1.cost })
        }
        return minCost
    }
    
    let minCost = dijkstra(from: S)
    print(minCost[C])
}