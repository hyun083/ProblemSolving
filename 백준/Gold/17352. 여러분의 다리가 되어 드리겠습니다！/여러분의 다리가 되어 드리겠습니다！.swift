import Foundation

let n = Int(readLine()!)!
var arr = [Int](0..<n)
func root(Of n:Int) -> Int{
    if arr[n] == n {return n}
    arr[n] = root(Of: arr[n])
    return arr[n]
}
func union(a:Int, b:Int){
    let rootOfA = root(Of: a)
    let rootOfB = root(Of: b)
    if rootOfB == rootOfA {return}
    arr[rootOfB] = rootOfA
}
for _ in 0..<n-2{
    let ab = readLine()!.split(separator: " ").map{Int(String($0))! - 1}
    let a = ab[0]
    let b = ab[1]
    union(a: a, b: b)
}

for i in 0..<n-1{
    if root(Of: i) != root(Of: i+1){
        print(root(Of: i)+1, root(Of: i+1)+1)
        break
    }
}
