import Foundation

let N = Int(readLine()!)!
var ans = Set<Dictionary<String,Int>>()

for _ in 0..<N{
    let line = readLine()!.map{String($0)}
    var res = Dictionary<String,Int>()
    line.forEach({ key in
        res[key, default: 0] += 1
    })
    ans.insert(res)
}
print(ans.count)