//
//  main.swift
//  3190_swift
//
//  Created by Hyun on 2022/11/13.
//

import Foundation

let n = Int(readLine()!)!
let k = Int(readLine()!)!

var map = Array(repeating: Array(repeating: ".", count: n), count: n)

var snake = [(x:Int,y:Int)]()
snake.append((0,0))
map[0][0] = "S"

for _ in 0..<k{
    let apple = readLine()!.split(separator: " ").map{Int($0)! - 1}
    map[apple[0]][apple[1]] = "A"
}

let dx = [0,1,0,-1]
let dy = [1,0,-1,0]
var dir = 0

let l = Int(readLine()!)!
var directions = Array(repeating: " ", count: 10001)
for _ in 0..<l{
    let line = readLine()!.split(separator: " ").map{String($0)}
    let x = Int(line[0])!
    let c = line[1]
    directions[x] = c
}

var time = 0
while true{
    time += 1
    
    let head = snake.first!
    let nx = head.x + dx[dir]
    let ny = head.y + dy[dir]
    
    if nx<0 || nx>=n || ny<0 || ny>=n || map[nx][ny]=="S"{break}
    
    snake.insert((nx,ny), at: 0)
    if map[nx][ny] == "."{
        let tail = snake.removeLast()
        map[tail.x][tail.y] = "."
    }
    map[nx][ny] = "S"
    
    if directions[time] == "L"{
        dir -= 1
        if dir == -1{dir = 3}
    }else if directions[time] == "D"{
        dir += 1
        if dir == 4 {dir = 0}
    }
}
print(time)
