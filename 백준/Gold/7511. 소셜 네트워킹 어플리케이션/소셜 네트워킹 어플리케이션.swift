import Foundation

let T = Int(readLine()!)!
var ans = ""
for i in 1...T{
    let n = Int(readLine()!)!
    let k = Int(readLine()!)!
    ans += "Scenario \(i):\n"
    var arr = Array(repeating: -1, count: n)
    func root(Of n:Int)->Int{
        if arr[n] < 0{ return n }
        arr[n] = root(Of: arr[n])
        return arr[n]
    }
    func union(a:Int, b:Int){
        let rootOfA = root(Of: a)
        let rootOfB = root(Of: b)
        if rootOfA == rootOfB{ return }
        arr[rootOfB] = rootOfA
    }
    for _ in 0..<k{
        let uv = readLine()!.split(separator: " ").map{Int(String($0))!}
        let u = uv[0]
        let v = uv[1]
        union(a: u, b: v)
    }
    for _ in 0..<Int(readLine()!)!{
        let uv = readLine()!.split(separator: " ").map{Int(String($0))!}
        let u = uv[0]
        let v = uv[1]
        ans += root(Of: u)==root(Of: v) ? "1\n":"0\n"
    }
    if i < T{
        ans += "\n"
    }
}
print(ans,terminator: "")