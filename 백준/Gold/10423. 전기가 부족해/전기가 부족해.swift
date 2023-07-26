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

func union(a:Int, b:Int, c:Int){
    let rootA = root(of: a)
    let rootB = root(of: b)
    
    if rootA == rootB{ return }
    if pwr[rootA] && pwr[rootB]{ return }
    
    if pwr[rootA]{
        arr[rootA] += arr[rootB]
        cnt -= arr[rootB]
        arr[rootB] = rootA
    }else if pwr[rootB]{
        arr[rootB] += arr[rootA]
        cnt -= arr[rootA]
        arr[rootA] = rootB
    }else{
        arr[rootA] += arr[rootB]
        arr[rootB] = rootA
    }
    ans += c
}

let NMK = readInt()
let N = NMK[0]
let M = NMK[1]
let K = NMK[2]

var pwr = Array(repeating: false, count: N)
let info = readInt()
for num in info{
    pwr[num-1] = true
}

var cnt = K
var arr = Array(repeating: -1, count: N)
var edges = [(u:Int, v:Int, c:Int)]()
var ans = 0

for _ in 0..<M{
    let uvc = readInt()
    let u = uvc[0]-1
    let v = uvc[1]-1
    let c = uvc[2]
    
    edges.append((u,v,c))
}
edges.sort(by: {$0.c > $1.c})

while cnt < N{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, c: edge.c)
}
print(ans)