import Foundation

let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NM[0]
let M = NM[1]

var pwd:[String:String] = [:]
var ans = ""

for _ in 1...N{
    let p = readLine()!.split(separator: " ").map{String($0)}
    pwd[p[0]] = p[1]
}

for _ in 1...M{
    let site = readLine()!
    ans += pwd[site]! + "\n"
}
print(ans)