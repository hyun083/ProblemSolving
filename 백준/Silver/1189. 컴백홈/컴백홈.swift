import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let R = inputs[0]
let C = inputs[1]
let K = inputs[2]

var map = Array(repeating: [String](), count: R)
var visited = Array(repeating: Array(repeating: false, count: C), count: R)

for i in 0..<R{
    let inputs = readLine()!
    for txt in inputs{
        map[i].append(String(txt))
    }
}

let nx = [1,-1,0,0]
let ny = [0,0,-1,1]
var res = 0
func dfs(x:Int, y:Int, cnt:Int){
    if x==0 && y==C-1{
        if cnt == K{
            res += 1
        }
        return
    }
    
    for i in 0...3{
        let X = x + nx[i]
        let Y = y + ny[i]
        
        if X<0 || Y<0 || X>=R || Y>=C || map[X][Y]=="T"{
            continue
        }
        if visited[X][Y] == false{
            visited[X][Y] = true
            dfs(x: X, y: Y, cnt: cnt+1)
            visited[X][Y] = false
        }
    }
}

visited[R-1][0] = true
dfs(x: R-1, y: 0, cnt: 1)
print(res)