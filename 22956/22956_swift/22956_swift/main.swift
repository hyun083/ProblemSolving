//
//  main.swift
//  22956_swift
//
//  Created by Hyun on 2022/12/27.
//

import Foundation

let nmq = readLine()!.split(separator: " ").map{Int($0)!}
let n = nmq[0]
let m = nmq[1]
let q = nmq[2]

var arr = Array(repeating: (-1,false,0), count: n*m)
var map = Array(repeating: [Int](), count: n)

for i in 0..<n{ map[i] = readLine()!.split(separator: " ").map{Int($0)!} }
for i in 0..<n*m{ arr[i].0 = i }

func root(of a:Int)->Int{
    if arr[a].0 == a {return a}
    arr[a].0 = root(of: arr[a].0)
    return arr[a].0
}

func union(a:Int, b:Int){
    let ax = a/m; let ay = a%m
    let bx = b/m; let by = b%m
    
    let rootA = root(of: a)
    let rootB = root(of: b)
    
    if rootA == rootB{
        if map[ax][ay] < map[bx][by]{
            arr[b].0 = a
        }else if map[ax][ay]==map[bx][by]{
            if arr[a].2 <= arr[b].2{
                arr[b].0 = a
            }else{
                arr[a].0 = rootB
            }
        }else{
            arr[a].0 = rootB
        }
        return
    }
    
    if map[ax][ay] < map[bx][by]{
        arr[b].0 = rootA
    }else if map[ax][ay]==map[bx][by]{
        if arr[a].2 <= arr[b].2{
            arr[b].0 = rootA
        }else{
            arr[a].0 = rootB
        }
    }else{
        arr[a].0 = rootB
    }
    
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
var time = 1
for _ in 0..<q{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let x = info[0]-1
    let y = info[1]-1
    let rain = info[2]
    
    let curr = (x*m)+y
    map[x][y] -= rain
    arr[curr].1 = true
    arr[curr].2 = time
    
    for i in 0..<4{
        let nx = x+dx[i]
        let ny = y+dy[i]
        let next = (nx*m)+ny
        if nx<0 || nx>=n || ny<0 || ny>=m{ continue }
        if arr[next].1{
            union(a: curr, b: next)
        }
    }
    
    let ans = root(of: curr)
    let tx = ans/m; let ty = ans%m
    print(tx+1,ty+1)
    time += 1
}
