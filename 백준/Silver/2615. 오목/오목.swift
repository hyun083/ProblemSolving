import Foundation

var arr = Array(repeating: Array(repeating: 0, count: 19), count: 19)
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 4), count: 19), count: 19)

func checkH(x:Int, y:Int) -> Int{
    let color = arr[x][y]
    var cnt = 0
    
    for ny in y..<19{
        if visited[x][ny][0] || arr[x][ny] != color { break }
        visited[x][ny][0] = true
        cnt += 1
    }
    return cnt
}

func checkV(x:Int, y:Int) -> Int{
    let color = arr[x][y]
    var cnt = 0
    
    for nx in x..<19{
        if visited[nx][y][1] || arr[nx][y] != color { break }
        visited[nx][y][1] = true
        cnt += 1
    }
    return cnt
}

func checkD1(x:Int, y:Int) -> Int{
    let color = arr[x][y]
    var cnt = 0
    
    for next in 0..<19{
        let nx = x+next
        let ny = y+next
        
        if nx>=19 || ny>=19 { break }
        if visited[nx][ny][2] || arr[nx][ny] != color { break }
        visited[nx][ny][2] = true
        cnt += 1
    }
    return cnt
}

func checkD2(x:Int, y:Int) -> Int{
    let color = arr[x][y]
    var cnt = 0
    
    for next in 0..<19{
        let nx = x+next
        let ny = y-next
        
        if nx>=19 || ny<0 { break }
        if visited[nx][ny][3] || arr[nx][ny] != color { break }
        visited[nx][ny][3] = true
        cnt += 1
    }
    return cnt
}

for i in 0..<19{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    for k in 0..<19{
        arr[i][k] = line[k]
    }
}

var winner = 0
var winX = -1
var winY = -1

for i in 0..<19{
    for k in 0..<19{
        if arr[i][k] == 0 { continue }
        var h = 0
        var v = 0
        var d1 = 0
        var d2 = 0
        if !visited[i][k][0]{
            h = checkH(x: i, y: k)
        }
        if !visited[i][k][1]{
            v = checkV(x: i, y: k)
        }
        if !visited[i][k][2]{
            d1 = checkD1(x: i, y: k)
        }
        if !visited[i][k][3]{
            d2 = checkD2(x: i, y: k)
        }
        
        if h==5 || v==5 || d1==5 || d2==5{
            if d2 == 5{
                winner = arr[i+4][k-4]
                winX = i+4
                winY = k-4
            }else{
                winner = arr[i][k]
                winX = i
                winY = k
            }
        }
    }
}

print(winner)
if winner>0{
    print(winX+1, winY+1)
}