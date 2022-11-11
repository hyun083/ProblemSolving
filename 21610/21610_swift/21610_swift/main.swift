//
//  main.swift
//  21610_swift
//
//  Created by Hyun on 2022/11/11.
//

import Foundation

let line = readLine()!.split(separator: " ").map{Int($0)!}
let n = line[0]
let m = line[1]

var map = Array(repeating: Array(repeating: 0, count: n), count: n)
for i in 0..<n{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    for k in 0..<n{
        map[i][k] = line[k]
    }
}

var clouds = [(x:Int,y:Int)]()
clouds.append((n-1,0))
clouds.append((n-1,1))
clouds.append((n-2,0))
clouds.append((n-2,1))

let dx = [0,-1,-1,-1,0,1,1,1]
let dy = [-1,-1,0,1,1,1,0,-1]
for _ in 0..<m{
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    let direction = line[0] - 1
    let distanse = line[1]
    
    //구름이동, 비내림
    for i in 0..<clouds.count{
        clouds[i].x += (dx[direction]*distanse)%n
        clouds[i].y += (dy[direction]*distanse)%n

        if clouds[i].x < 0{
            clouds[i].x += n
        }else if clouds[i].x >= n{
            clouds[i].x -= n
        }
        if clouds[i].y < 0{
            clouds[i].y += n
        }else if clouds[i].y >= n{
            clouds[i].y -= n
        }
        
        let nx = clouds[i].x
        let ny = clouds[i].y
        map[nx][ny] += 1
    }

    //물복사버그
    for _ in 0..<clouds.count{
        let cloud = clouds.removeLast()
        let x = cloud.x
        let y = cloud.y
        
        for i in stride(from: 1, to: 8, by: +2){
            let nx = x+dx[i]
            let ny = y+dy[i]
            if nx<0 || nx>=n || ny<0 || ny>=n{ continue }
            if map[nx][ny]>0{ map[x][y]+=1 }
        }
        visited[x][y] = true
    }
    
    //구름생성
    for i in 0..<n{
        for k in 0..<n{
            if map[i][k]>1 && !visited[i][k]{
                map[i][k] -= 2
                clouds.append((i,k))
            }
        }
    }
}
var ans = 0
for m in map{
    ans += m.reduce(0, +)
}
print(ans)
