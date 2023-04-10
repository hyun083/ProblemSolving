import Foundation

var row = Array(repeating: Array(repeating: false, count: 10), count: 9)
var col = Array(repeating: Array(repeating: false, count: 10), count: 9)
var rect = Array(repeating: Array(repeating: false, count: 10), count: 9)
var map = Array(repeating: Array(repeating: 0, count: 9), count: 9)
var flag = false

for i in 0..<9{
    let line = readLine()!.map{Int(String($0))!}
    for k in 0..<9{
        map[i][k] = line[k]
        let num = map[i][k]
        row[i][num] = true
        col[k][num] = true
        rect[(i/3)*3 + (k/3)][num] = true
    }
}

func bfs(cnt:Int){
    if flag { return }
    if cnt == 81{
        flag = true
        for numbers in map{
            for number in numbers{
                print(number,terminator: "")
            }
            print()
        }
        return
    }
    let x = cnt/9
    let y = cnt%9
    
    if map[x][y]>0{
        bfs(cnt: cnt+1)
    }else{
        for num in 1...9{
            if !row[x][num] && !col[y][num] && !rect[(x/3)*3+(y/3)][num]{
                row[x][num] = true
                col[y][num] = true
                rect[(x/3)*3 + (y/3)][num] = true
                map[x][y] = num
                bfs(cnt: cnt+1)
                map[x][y] = 0
                row[x][num] = false
                col[y][num] = false
                rect[(x/3)*3 + (y/3)][num] = false
            }
        }
    }
}
bfs(cnt: 0)