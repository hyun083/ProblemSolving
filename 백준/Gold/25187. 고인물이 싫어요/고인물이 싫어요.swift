import Foundation

let nmq = readLine()!.split(separator: " ").map{Int($0)!}
let n = nmq[0]
let m = nmq[1]
let q = nmq[2]

var arr = Array(repeating: (-1,0,0), count: n)
let info = readLine()!.split(separator: " ").map{Int($0)!}
for i in 0..<n{
    if info[i]>0{
        arr[i].2 += 1
    }else{
        arr[i].1 += 1
    }
}

func root(of a:Int)->Int{
    if arr[a].0<0 {return a}
    arr[a].0 = root(of: arr[a].0)
    return arr[a].0
}

func union(a:Int, b:Int){
    let rootA = root(of: a)
    let rootB = root(of: b)
    if rootA == rootB {return}
    arr[rootB].0 = rootA
    arr[rootA].1 += arr[rootB].1
    arr[rootA].2 += arr[rootB].2
}

for _ in 0..<m{
    let info = readLine()!.split(separator: " ").map{Int($0)!-1}
    union(a: info[0], b: info[1])
}

for _ in 0..<q{
    let idx = Int(readLine()!)!-1
    let root = root(of: idx)
    if arr[root].2 > arr[root].1{
        print(1)
    }else{
        print(0)
    }
}