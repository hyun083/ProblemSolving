import Foundation

let N = Int(readLine()!)!
var map = [[String]]()
var ans = [[String]]()
var live = true

for _ in 0..<N{
    let info = readLine()!.map{String($0)}
    map.append(info)
}

for _ in 0..<N{
    let info = readLine()!.map{String($0)}
    ans.append(info)
}

func check(x:Int, y:Int) -> String{
    if map[x][y] == "*"{ return "*" }
    let dx = [-1,-1,-1,0,0,1,1,1]
    let dy = [-1,0,1,-1,1,-1,0,1]
    var cnt = 0
    
    for i in 0..<8{
        let nx = x+dx[i]
        let ny = y+dy[i]
        
        if nx<0 || nx>=N || ny<0 || ny>=N { continue }
        if map[nx][ny] == "*"{
            cnt += 1
        }
    }
    return String(cnt)
}

for i in 0..<N{
    for k in 0..<N{
        if ans[i][k]=="x"{
            ans[i][k] = check(x: i, y: k)
        }
        live = ans[i][k]=="*" ? false:live
    }
}

if !live{
    for i in 0..<N{
        for k in 0..<N{
            if map[i][k] == "*"{
                ans[i][k] = "*"
            }
        }
    }
}

for line in ans{
    print(line.joined())
}