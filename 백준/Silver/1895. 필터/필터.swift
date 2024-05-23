import Foundation

let (R,C) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var map = [[Int]]()
var ans = 0

for _ in 0..<R{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(info)
}
let T = Int(readLine()!)!

func avg(x:Int, y:Int) -> Int{
    var res = [Int]()
    for i in 0..<3{
        for k in 0..<3{
            let nx = x+i
            let ny = y+k
            res.append(map[nx][ny])
        }
    }
    res.sort(by: <)
    return res[4]
}

for i in 0..<R-2{
    for k in 0..<C-2{
        if avg(x: i, y: k) >= T{
            ans += 1
            
        }
    }
}

print(ans)