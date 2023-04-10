import Foundation

let t = Int(readLine()!)!
var ans = Array(repeating: 0, count: t)
for testcase in 0..<t{
    let wh = readLine()!.split(separator: " ").map{Int(String($0))!}
    let h = wh[0]
    let w = wh[1]
    var map = Array(repeating: Array(repeating: ".", count: w+2), count: h+2)
    var visited = Array(repeating: Array(repeating: false, count: w+2), count: h+2)
    var doors = Array(repeating: [[Int]](), count: 26)
    var keys = Array(repeating: false, count: 26)
    var cnt = 0
    
    for i in 1...h{
        let line = ["."]+readLine()!.map{String($0)}+["."]
        for k in 0..<w+2{
            map[i][k] = line[k]
            if map[i][k] == "*"{
                visited[i][k] = true
            }
        }
    }
    let key = readLine()!.map{String($0)}
    
    for key in key{
        if key == "0" { continue }
        let idx = Int(key.first!.asciiValue!)-97
        keys[idx] = true
    }
    
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    func bfs(a:Int, b:Int){
        var q = [[a,b]]
        var dq = [[Int]]()
        while !q.isEmpty{
            dq = q.reversed()
            q.removeAll()
            for _ in 0..<dq.count{
                let curr = dq.removeLast()
                let x = curr[0]
                let y = curr[1]
                for i in 0..<4{
                    let nx = x+dx[i]
                    let ny = y+dy[i]
                    if nx<0 || nx>=h+2 || ny<0 || ny>=w+2 || map[nx][ny]=="*"{ continue }
                    
                    if map[nx][ny]=="." && !visited[nx][ny]{
                        visited[nx][ny] = true
                        q.append([nx,ny])
                        continue
                    }
                    if map[nx][ny]=="$" && !visited[nx][ny]{
                        visited[nx][ny] = true
                        cnt += 1
                        q.append([nx,ny])
                        continue
                    }
                    
                    let idx = Int(map[nx][ny].first!.asciiValue!)
                    if (65<=idx && idx<=90) && !visited[nx][ny]{
                        if keys[idx-65]{
                            visited[nx][ny] = true
                            q.append([nx,ny])
                        }else{
                            doors[idx-65].append([nx,ny])
                        }
                        continue
                    }
                    if (97<=idx && idx<=122) && !visited[nx][ny]{
                        visited[nx][ny] = true
                        q.append([nx,ny])
                        if !keys[idx-97] {
                            keys[idx-97] = true
                        }
                        //문 확인
                        for door in doors[idx-97]{
                            let nnx = door[0]
                            let nny = door[1]
                            visited[nnx][nny] = true
                            q.append([nnx,nny])
                        }
                        doors[idx-97].removeAll()
                    }
                }
            }
        }
    }
    
    bfs(a: 0, b: 0)
    ans[testcase] = cnt
    print(cnt)
}