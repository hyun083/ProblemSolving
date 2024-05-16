import Foundation

let (N,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var edges = [(u:Int, v:Int, cost:Int)]()
var arr = Array(repeating: -1, count: N)
var ans = 0
var comp = N
var map = [[Int]]()

func cost(a:[Int], b:[Int]) -> Int{
    var res = 0
    
    for i in 0..<K{
        res += abs(a[i]-b[i])
    }
    return res
}

func rootOf(node:Int) -> Int{
    if arr[node] < 0 { return node }
    arr[node] = rootOf(node: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, cost:Int) {
    let ra = rootOf(node: a)
    let rb = rootOf(node: b)
    if ra == rb { return }
    
    arr[rb] = ra
    ans = max(ans, cost)
    comp -= 1
}

for _ in 0..<N{
    let word = readLine()!.map{Int(exactly: Character(String($0)).asciiValue!)!}
    map.append(word)
}

for i in 0..<N-1{
    for k in i+1..<N{
        edges.append((i,k,cost(a: map[i], b: map[k])))
    }
}
edges.sort(by: {$0.cost > $1.cost})

while comp>1 && !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, cost: edge.cost)
}
print(ans)