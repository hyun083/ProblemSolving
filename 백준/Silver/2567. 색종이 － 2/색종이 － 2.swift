import Foundation

var arr = Array(repeating: Array(repeating: 0, count: 102), count: 102)

let N = Int(readLine()!)!
for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!+1}
    let y = info[0]
    let x = info[1]
    for i in x..<x+10{
        for k in y..<y+10{
            arr[i][k] = 1
        }
    }
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
var ans = 0

for x in 1...100{
    for y in 1...100{
        if arr[x][y] == 1{
            for i in 0..<4{
                let nx = x+dx[i]
                let ny = y+dy[i]
                
                if nx<0 || nx>101 || ny<0 || ny>101{ continue }
                
                if arr[nx][ny] == 0{ ans += 1 }
            }
        }
    }
}
print(ans)