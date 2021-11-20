//
//  main.swift
//  10026_swift
//
//  Created by Hyun on 2021/11/20.
//

import Foundation

var nx = [1,-1,0,0]
var ny = [0,0,-1,1]

func dfs(_ x:Int,_ y:Int,_ c:Character){
    visited[x][y] = c
    for i in 0..<4{
        let X = x+nx[i]
        let Y = y+ny[i]
        if(X<0 || X >= N || Y<0 || Y >= N){
            continue
        }
        if(rgb[X][Y] == c && visited[X][Y] == "A"){
            dfs(X, Y, c)
        }
    }
}
func dfs2(_ x:Int,_ y:Int,_ c:Character){
    visited[x][y] = c
    for i in 0..<4{
        let X = x+nx[i]
        let Y = y+ny[i]
        if(X<0 || X >= N || Y<0 || Y >= N){
            continue
        }
        if(rb[X][Y] == c && visited[X][Y] == "A"){
            dfs2(X, Y, c)
        }
    }
}

var N = Int(readLine()!)!
var rgb = Array(repeating: Array(repeating: Character("A"), count: N), count: N)
var rb = Array(repeating: Array(repeating: Character("A"), count: N), count: N)
var visited = Array(repeating: Array(repeating: Character("A"), count: N), count: N)

for i in 0..<N{
    var colors = readLine()!
    for k in 0..<N{
        rgb[i][k] = colors.removeFirst()
        if(rgb[i][k] == "G"){
            rb[i][k] = "R"
        }else{
            rb[i][k] = rgb[i][k]
        }
    }
}

var cnt = 0
for x in 0..<N{
    for y in 0..<N{
        if(rgb[x][y] == "R" && visited[x][y] == "A"){
            cnt += 1
            dfs(x, y, "R")
        }
        if(rgb[x][y] == "G" && visited[x][y] == "A"){
            cnt += 1
            dfs(x, y, "G")
        }
        if(rgb[x][y] == "B" && visited[x][y] == "A"){
            cnt += 1
            dfs(x, y, "B")
        }
    }
}
print(cnt, terminator: " ")

visited = Array(repeating: Array(repeating: Character("A"), count: N), count: N)

cnt = 0
for x in 0..<N{
    for y in 0..<N{
        if(rb[x][y] == "R" && visited[x][y] == "A"){
            cnt += 1
            dfs2(x, y, "R")
        }

        if(rb[x][y] == "B" && visited[x][y] == "A"){
            cnt += 1
            dfs2(x, y, "B")
        }
    }
}
print(cnt)
