import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var map = Array(repeating: Array(repeating: 0, count: M), count: N)
for i in 0..<N{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    for k in 0..<M{
        map[i][k] = line[k]
    }
}

for i in 0..<N{
    for k in 0..<M{
        if i==0 && k==0 { continue }
        else if i==0 {
            map[i][k] += map[i][k-1]
        }else if k==0{
            map[i][k] += map[i-1][k]
        }else{
            map[i][k] += max(map[i-1][k], map[i][k-1])
        }
    }
}
print(map[N-1][M-1])