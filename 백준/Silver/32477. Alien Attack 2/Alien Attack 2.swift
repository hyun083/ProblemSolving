import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var arr = Array(repeating: -1, count: N)

func rootOf(node:Int) -> Int{
    if arr[node] < 0{
        return node
    }
    arr[node] = rootOf(node: arr[node])
    return arr[node]
}

func union(node1:Int, node2:Int){
    let rootOfNode1 = rootOf(node: node1)
    let rootOfNode2 = rootOf(node: node2)
    if rootOfNode1 == rootOfNode2{
        return
    }
    
    if rootOfNode1 < rootOfNode2{
        arr[rootOfNode1] += arr[rootOfNode2]
        arr[rootOfNode2] = rootOfNode1
    }else{
        arr[rootOfNode2] += arr[rootOfNode1]
        arr[rootOfNode1] = rootOfNode2
    }
}

for _ in 0..<M{
    let UV = readLine()!.split(separator: " ").map{Int($0)!-1}
    let U = UV[0]
    let V = UV[1]
    
    union(node1: U, node2: V)
}
var ans = 0
for cnt in arr{
    if cnt < 0{
        ans = min(ans, cnt)
    }
}
print(ans * -1)