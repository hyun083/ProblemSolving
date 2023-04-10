import Foundation

let nmk = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nmk[0]
let m = nmk[1]
let k = nmk[2]
var cost = readLine()!.split(separator:" ").map({Int(String($0))!})
var arr = Array(repeating: -1, count: n)
var totalCost = 0

func root(of n:Int) -> Int{
    if arr[n] < 0{return n}
    arr[n] = root(of: arr[n])
    return arr[n]
}
func union(a:Int, b:Int){
    let rootOfA = root(of: a)
    let rootofB = root(of: b)
    if rootOfA == rootofB{
        return
    }
    if cost[rootOfA] < cost[rootofB]{
        arr[rootofB] = rootOfA
    }else{
        arr[rootOfA] = rootofB
    }
}
for _ in 0..<m{
    let vw = readLine()!.split(separator: " ").map{Int(String($0))!}
    let v = vw[0]-1
    let w = vw[1]-1
    union(a: v, b: w)
}
for i in 0..<n{
    if arr[i] < 0{
        totalCost += cost[i]
    }
}
if totalCost <= k{
    print(totalCost)
}else{
    print("Oh no")
}