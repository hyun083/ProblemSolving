//
//  main.swift
//  9328_swift
//
//  Created by Hyun on 2022/10/20.
//

import Foundation

let t = Int(readLine()!)!
var ans = Array(repeating: 0, count: t)
for testcase in 0..<t{
    let wh = readLine()!.split(separator: " ").map{Int(String($0))!}
    let h = wh[0]
    let w = wh[1]
    var map = Array(repeating: Array(repeating: "", count: w), count: h)
    var visited = Array(repeating: Array(repeating: false, count: w), count: h)
    var door = Array(repeating: [[Int]](), count: 26)
    var keys = Set<String>()
    var cnt = 0
    for i in 0..<h{
        let line = readLine()!.map{String($0)}
        for k in 0..<w{
            map[i][k] = line[k]
            if map[i][k] == "*"{
                visited[i][k] = true
            }else{
                let idx = Int(map[i][k].first!.asciiValue!) - 65
                if 0<=idx && idx<26{
                    door[idx].append([i,k])
                }
            }
        }
    }
    let key = readLine()!.map{String($0)}
    
    for key in key{
        if key == "0" { continue }
        if !keys.contains(key){
            keys.insert(key)
        }
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
                    if nx<0 || nx>=h || ny<0 || ny>=w || map[nx][ny]=="*"{ continue }
                    if map[nx][ny]=="." && !visited[nx][ny]{
                        visited[nx][ny] = true
                        q.append([nx,ny])
                    }
                    let value = Int(map[nx][ny].first!.asciiValue!)
                    if (65<=value && value<91) && !visited[nx][ny]{
                        let key = map[nx][ny].lowercased()
                        if keys.contains(key){
                            visited[nx][ny] = true
                            q.append([nx,ny])
                        }
                    }else if (97<=value && value<123) && !visited[nx][ny]{
                        visited[nx][ny] = true
                        q.append([nx,ny])
                        keys.insert(map[nx][ny])
                        //문 확인
                        let idx = value-32-65
                        var temp = door[idx]
                        door[idx].removeAll()
                        for _ in 0..<temp.count{
                            let next = temp.removeLast()
                            var check = ""
                            for i in 0..<4{
                                let nnx = next[0] + dx[i]
                                let nny = next[1] + dy[i]
                                if nnx<0 || nnx>=h || nny<0 || nny>=w{ continue }
                                check += map[nnx][nny]
                                if map[nnx][nny] != "*" && visited[nnx][nny]{
                                    visited[next[0]][next[1]] = true
                                    q.append([next[0],next[1]])
                                    break
                                }
                            }
                            if !(check == "*" || check == "**" || check == "***" || check == "****"){
                                door[idx].append([next[0],next[1]])
                            }
                        }
                    }else if map[nx][ny]=="$" && !visited[nx][ny]{
                        visited[nx][ny] = true
                        cnt += 1
                        q.append([nx,ny])
                    }
                }
            }
        }
    }
    for x in 0..<h{
        var y = [Int]()
        if x==0 || x==h-1{
            y = [Int](0..<w)
        }else{
            y = [0,w-1]
        }
        for y in y{
            if map[x][y] == "*" { continue }
            if map[x][y]=="." && !visited[x][y]{
                visited[x][y] = true
                bfs(a: x, b: y)
            }else if map[x][y]=="$" && !visited[x][y]{
                visited[x][y] = true
                cnt += 1
                bfs(a: x, b: y)
            }else{
                let value = Int(map[x][y].first!.asciiValue!)
                if (97<=value && value<122) && !visited[x][y]{
                    visited[x][y] = true
                    let idx = value-32-65
                    var temp = door[idx]
                    door[idx].removeAll()
                    for _ in 0..<temp.count{
                        let next = temp.removeLast()
                        var check = ""
                        for i in 0..<4{
                            let nnx = next[0] + dx[i]
                            let nny = next[1] + dy[i]
                            if nnx<0 || nnx>=h || nny<0 || nny>=w{ continue }
                            check += map[nnx][nny]
                            if map[nnx][nny] != "*" && visited[nnx][nny]{
                                visited[next[0]][next[1]] = true
                                bfs(a: next[0], b: next[1])
                                break
                            }
                        }
                        if !(check == "*" || check == "**" || check == "***" || check == "****"){
                            door[idx].append([next[0],next[1]])
                        }
                    }
                    bfs(a: x, b: y)
                    keys.insert(map[x][y])
                }else if 65<=value && value<91 && !visited[x][y]{
                    let key = map[x][y].lowercased()
                    if keys.contains(key){
                        visited[x][y] = true
                        bfs(a: x, b: y)
                    }
                }
            }
        }
    }
    ans[testcase] = cnt
    print(cnt)
}



