import Foundation

let LNT = readLine()!.split(separator: " ").map{Int($0)!}
let L = LNT[0]
let N = LNT[1]
let T = LNT[2]
var ans = 0

var balls = [(idx:Int, dir:Int)]()
for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{String($0)}
    balls.append((Int(info[0])!,info[1]=="R" ? 1:-1))
}

for _ in 0..<T{
    var tmp = Array(repeating: Set<Int>(), count: L+1)
    for i in 0..<N{
        balls[i].idx += balls[i].dir
        tmp[balls[i].idx].insert(i)
        if balls[i].idx == 0 || balls[i].idx == L{
            balls[i].dir *= -1
        }
    }
    for i in 0...L{
        if tmp[i].isEmpty || tmp[i].count==1{
            continue
        }else{
            ans += 1
            for idx in tmp[i]{
                balls[idx].dir *= -1
            }
        }
    }
}
print(ans)