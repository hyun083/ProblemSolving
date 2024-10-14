import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var ans = 0

var arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
var tmp = [Int]()
var swp = tmp

for _ in 0..<min(M,N) {
    tmp.append(arr.removeLast())
}

while !arr.isEmpty {
    let min = tmp.removeLast()
    ans += min
    while !tmp.isEmpty{
        let num = tmp.removeLast()-min
        if num > 0 {
            swp.append(num)
        }
    }
    while swp.count<M && !arr.isEmpty{
        swp.append(arr.removeLast())
    }
    swp.sort(by: >)
    tmp = swp
    swp = [Int]()
}
ans += tmp.max() ?? 0
print(ans)