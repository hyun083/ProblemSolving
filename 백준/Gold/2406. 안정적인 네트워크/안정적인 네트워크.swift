import Foundation

func readInt() -> [Int]{
    readLine()!.split(separator: " ").map{Int($0)!}
}

func root(of node:Int) -> Int{
    if arr[node]<0{
        return node
    }
    
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, cost:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B{return}
    arr[B] = A
    cnt -= 1
    sum += cost
    ans.append((a+2,b+2))
}

let NM = readInt()
let N = NM[0]
let M = NM[1]

var arr = Array(repeating: -1, count: N-1)
var cnt = N-1
var ans = [(u:Int, v:Int)]()
var sum = 0
var q = [(u:Int, v:Int, cost:Int)]()

for _ in 0..<M{
    let xy = readInt()
    let x = xy[0]-2
    let y = xy[1]-2
    union(a: x, b: y, cost: 0)
}

sum = 0
ans.removeAll()

for i in 0..<N{
    let cost = readInt()
    if i == 0 { continue }
    
    for k in i+1..<N{
        q.append((i-1,k-1,cost[k]))
    }
}
q.sort(by: {$0.cost > $1.cost})

while cnt > 1{
    let curr = q.removeLast()
    union(a: curr.u, b: curr.v, cost: curr.cost)
}
print(sum, ans.count)
for ans in ans{
    print(ans.u,ans.v)
}