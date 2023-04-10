import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]

var arr = [Int](0..<n)
func root(Of n:Int)->Int{
    if arr[n]==n{return n}
    arr[n] = root(Of: arr[n])
    return arr[n]
}
func union(a:Int, b:Int){
    let rootOfA = root(Of: a)
    let rootOfB = root(Of: b)
    if rootOfA != rootOfB{
        arr[rootOfA] = rootOfB
    }
}
var ans = 0
for i in 1...m{
    let ab = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = ab[0]
    let b = ab[1]
    if root(Of: a) == root(Of: b){
        ans = i
        break
    }else{
        union(a: a, b: b)
    }
}
print(ans)