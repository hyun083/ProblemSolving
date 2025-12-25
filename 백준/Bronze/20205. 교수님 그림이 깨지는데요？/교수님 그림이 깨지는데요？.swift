import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]

var img = [[String]]()
var res = Array(repeating: Array(repeating: "", count: N*K), count: N*K)

for _ in 0..<N{
    img.append(readLine()!.split(separator: " ").map{String($0)})
}
var num = Array(img.flatMap({$0}).reversed())

for i in stride(from: 0, to: N*K, by: +K){
    for k in stride(from: 0,to: N*K, by: +K){
        let data = num.removeLast()
        for p in i..<i+K{
            for o in k..<k+K{
                res[p][o] = data
            }
        }
    }
}

for row in res{
    print(row.joined(separator: " "))
}