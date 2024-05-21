import Foundation

let line = readLine()!.split(separator: " ").map{Int($0)!}
let M = line[0]
let N = line[1]
var map = [[String]]()
var ans = Array(repeating: 0, count: 5)

for _ in 0..<(M*5)+1{
    let info = readLine()!.map{String($0)}
    map.append(info)
}

func type(x:Int, y:Int) -> Int{
    var cnt = 0
    for nx in x..<x+4{
        if map[nx][y] == "*"{
            cnt += 1
        }
    }
    return cnt
}

for i in 0..<M{
    for k in 0..<N{
        let nx = 1+(i*5)
        let ny = 1+(k*5)
        let idx = type(x: nx, y: ny)
        ans[idx] += 1
    }
}

for num in ans{
    print(num, terminator: " ")
}