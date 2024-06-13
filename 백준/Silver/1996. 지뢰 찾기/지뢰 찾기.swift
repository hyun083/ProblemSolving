import Foundation

let N = Int(readLine()!)!
var map = [[Int]]()

for _ in 0..<N{
    let line = readLine()!.map{String($0)=="." ? 0:Int(String($0))!}
    map.append(line)
}
let dx = [-1,-1,-1,0,0,1,1,1]
let dy = [-1,0,1,-1,1,-1,0,1]
var ans = Array(repeating: Array(repeating: "", count: N), count: N)

func cnt(x:Int, y:Int) -> Int{
    var res = 0
    for i in 0..<8{
        let nx = x + dx[i]
        let ny = y + dy[i]
        if nx<0 || nx>=N || ny<0 || ny>=N { continue }
        res += map[nx][ny]
    }
    return res
}

for i in 0..<N{
    for k in 0..<N{
        if map[i][k]>0 { ans[i][k] = "*"; continue }
        let cnt = cnt(x: i, y: k)
        ans[i][k] = cnt>=10 ? "M":"\(cnt)"
    }
}
for ans in ans{
    print(ans.joined())
}