import Foundation

let N = Int(readLine()!)!
var arr = Array(repeating: -1, count: N)

var edges = [(u:Int, v:Int, cost:Int)]()
var totalCost = 0
var ans = [(u:Int, v:Int)]()
var comp = N

func root(of node:Int) -> Int{
    if arr[node] < 0{
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
    comp -= 1
    totalCost += cost
    ans.append((a,b))
}

for i in 0..<N{
    let cost = readLine()!.split(separator: " ").map{Int($0)!}
    
    for k in i+1..<N{
        if cost[k] < 0{
            totalCost -= cost[k]
            let u = root(of: i)
            let v = root(of: k)
            
            if u != v{
                arr[u] = v
                comp -= 1
            }
        }else{
            edges.append((i,k,cost[k]))
        }
    }
}

edges.sort(by: {$0.cost > $1.cost})

while comp>1 && !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, cost: edge.cost)
}
print(totalCost, ans.count)
for ans in ans{
    print(ans.u+1, ans.v+1)
}