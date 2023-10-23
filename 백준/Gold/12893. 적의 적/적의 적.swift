import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var enemy = Array(repeating: -1, count: n)
var arr = Array(repeating: -1, count: n)
var ans = 1

func root(of a:Int)->Int{
    if arr[a]<0 {return a}
    arr[a] = root(of: arr[a])
    return arr[a]
}

func union(a:Int,b:Int){
    let rootA = root(of: a)
    let rootB = root(of: b)
    if rootA == rootB{
        return
    }
    arr[rootA] = rootB
}

var edges = [(u:Int, v:Int)]()
for _ in 0..<m{
    let info = readLine()!.split(separator: " ").map{Int($0)!-1}
    edges.append((info[0], info[1]))
}

for edge in edges{
    let A = root(of: edge.u)
    let B = root(of: edge.v)
    
    if A == B {
        ans = 0
        break
    }
    
    let ea = enemy[A]
    let eb = enemy[B]
    
    if ea<0{
        enemy[A] = B
    }else{
        union(a: ea, b: edge.v)
    }
    
    if eb<0{
        enemy[B] = A
    }else{
        union(a: eb, b: edge.u)
    }
}

print(ans)