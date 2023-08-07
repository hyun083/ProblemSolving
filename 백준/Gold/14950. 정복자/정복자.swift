import Foundation

func readInt() -> [Int]{
    readLine()!.split(separator: " ").map{Int($0)!}
}

func root(of node:Int) -> Int{
    if arr[node]<0 {
        return node
    }
    
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, cost:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B { return }
    arr[B] = A
    ans += cost
    cnt -= 1
    t += T
}

let NMT = readInt()
let N = NMT[0]
let M = NMT[1]
let T = NMT[2]

var arr = Array(repeating: -1, count: N)
var map = Array(repeating: [(node:Int, cost:Int)](), count: N)
var q = [(node:Int, cost:Int)]()
var cnt = N
var ans = 0
var t = 0

for _ in 0..<M{
    let uvc = readInt()
    let u = uvc[0]-1
    let v = uvc[1]-1
    let c = uvc[2]
    
    map[u].append((v,c))
    map[v].append((u,c))
}

q.append((0,0))
while cnt>1 && !q.isEmpty{
    let curr = q.removeLast()
    union(a: 0, b: curr.node, cost: curr.cost+t)
    
    for next in map[curr.node]{
        if root(of: next.node) == root(of: 0){ continue}
        q.append((next.node, next.cost))
    }
    
    q.sort(by: {$0.cost > $1.cost})
}
print(ans)