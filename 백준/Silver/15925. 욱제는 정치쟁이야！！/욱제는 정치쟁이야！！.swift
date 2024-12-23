import Foundation

let NT = readLine()!.split(separator: " ").map{Int($0)!}
let N = NT[0]
let T = NT[1]

var map = [[Int]]()

for _ in 0..<N{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(line)
}

for i in 0..<N{
    var cnt = 0
    for k in 0..<N{
        cnt += map[i][k]==T ? 1:0
    }
    if cnt > N/2{
        map[i] = Array(repeating: T, count: N)
    }
}

for i in 0..<N{
    var cnt = 0
    for k in 0..<N{
        cnt += map[k][i]==T ? 1:0
    }
    if cnt > N/2{
        for k in 0..<N{
            map[k][i] = T
        }
    }
}

for i in 0..<N{
    var cnt = 0
    for k in 0..<N{
        cnt += map[i][k]==T ? 1:0
    }
    if cnt > N/2{
        map[i] = Array(repeating: T, count: N)
    }
}

for i in 0..<N{
    var cnt = 0
    for k in 0..<N{
        cnt += map[k][i]==T ? 1:0
    }
    if cnt > N/2{
        for k in 0..<N{
            map[k][i] = T
        }
    }
}

var ans = 0
for i in 0..<N{
    for k in 0..<N{
        ans += map[i][k]==T ? 1:0
    }
}
print(ans==N*N ? 1:0)