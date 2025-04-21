import Foundation

let NMX = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMX[0]
let M = NMX[1]
let X = NMX[2]

var arr = readLine()!.split(separator: " ").map{Int($0)!}
var map = Array(repeating: Array(repeating: ".", count: M), count: N)

for i in 0..<M{
    let height = arr[i]
    for k in stride(from: N-1, to: N-1-height, by: -1){
        map[k][i] = "#"
    }
    map[N-X][i] = map[N-X][i]=="#" ? "*":"-"
    if (i+1)%3==0{
        for k in (N-X+1)..<N{
            if map[k][i]=="."{
                map[k][i] = "|"
            }
        }
    }
}

for n in map{
    print(n.joined())
}