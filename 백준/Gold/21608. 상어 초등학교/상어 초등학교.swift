import Foundation

let n = Int(readLine()!)!
var map = Array(repeating: Array(repeating: -1, count: n), count: n)
var lovers = Array(repeating: [Int](), count: n*n)
var happy = [0,1,10,100,1000]
var ans = 0

func cntLovers(of x:Int, y:Int, lovers:[Int]) -> (Int,Int){
    var heart = 0
    var blank = 0
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    for i in 0..<4{
        let nx = x+dx[i]
        let ny = y+dy[i]
        if nx<0 || nx>=n || ny<0 || ny>=n{continue}
        if lovers.contains(map[nx][ny]){heart+=1}
        if map[nx][ny] == -1 {blank+=1}
    }
    return (heart,blank)
}

for _ in 0..<n*n{
    let line = readLine()!.split(separator: " ").map{Int($0)!-1}
    let num = line[0]
    lovers[num] = [line[1], line[2], line[3], line[4]]
    
    var maxLove = -1
    var maxBlank = -1
    var x = 0
    var y = 0
    
    for i in 0..<n{
        for k in 0..<n{
            if map[i][k] == -1{
                let info = cntLovers(of: i, y: k, lovers: lovers[num])
                let love = info.0
                let blank = info.1
                
                if maxLove < love{
                    maxLove = love
                    maxBlank = blank
                    x = i
                    y = k
                }else if maxLove==love && maxBlank<blank{
                    maxLove = love
                    maxBlank = blank
                    x = i
                    y = k
                }
            }
        }
    }
    map[x][y] = num
}

for i in 0..<n{
    for k in 0..<n{
        let info = cntLovers(of: i, y: k, lovers: lovers[map[i][k]])
        ans += happy[info.0]
    }
}
print(ans)