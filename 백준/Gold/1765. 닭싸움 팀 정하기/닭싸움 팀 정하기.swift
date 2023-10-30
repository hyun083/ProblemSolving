import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!
var enemy = Array(repeating: [Int](), count: N)
var arr = Array(repeating: -1, count: N)
var ans = N

func root(of node:Int) -> Int{
    if arr[node]<0 {return node}
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B { return }
    arr[B] = A
    ans -= 1
}

for _ in 0..<M{
    let (r,p,q) = [readLine()!.split(separator: " ").map{String($0)}].map{($0[0], Int($0[1])!-1, Int($0[2])!-1)}[0]
    if r == "E"{
        enemy[p].append(q)
        enemy[q].append(p)
    }else{
        union(a: p, b: q)
    }
}

for i in 0..<N{
    for num in enemy[i]{
        for friend in enemy[num]{
            union(a: i, b: friend)
        }
    }
}

print(ans)