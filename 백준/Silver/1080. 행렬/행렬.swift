import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var map = [[Int]]()
var target = [[Int]]()
var ans = 0

func flip(x:Int, y:Int){
    ans += 1
    for i in x..<x+3{
        for k in y..<y+3{
            map[i][k] = map[i][k]==1 ? 0:1
        }
    }
}

for _ in 0..<N{
    let info = readLine()!.map{Int(String($0))!}
    map.append(info)
}

for _ in 0..<N{
    let info = readLine()!.map{Int(String($0))!}
    target.append(info)
}

if N>=3 && M>=3{
    for i in 0..<N-2{
        for k in 0..<M-2{
            if map[i][k] != target[i][k]{
                flip(x: i, y: k)
            }
        }
    }
}
print(map==target ? ans:-1)