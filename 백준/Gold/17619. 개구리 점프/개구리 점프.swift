import Foundation

let (N,Q) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = Array(repeating: -1, count: N)
var nodes = [(num:Int, x1:Int, x2:Int, y:Int)]()

func root(of node:Int) -> Int{
    if arr[node] < 0 { return node }
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B { return }
    arr[B] = A
}

for num in 0..<N{
    let (x1, x2, y) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
    nodes.append((num,x1,x2,y))
}
nodes.sort(by: {$0.x1 < $1.x1})

var p = nodes[0].num
var end = nodes[0].x2

for i in 1..<N{
    let node = nodes[i]
    if node.x1<=end{
        if node.x2 <= end{
            union(a: p, b: node.num)
        }else{
            union(a: p, b: node.num)
            end = node.x2
            p = node.num
        }
    }else{
        p = node.num
        end = node.x2
    }
}

var ans = [String]()
for _ in 0..<Q{
    let (u,v) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1)}[0]
    ans.append(root(of: u)==root(of: v) ? "1":"0")
}
print(ans.joined(separator: "\n"))