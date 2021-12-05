//
//  main.swift
//  1987_swift
//
//  Created by Hyun on 2021/12/05.
//

import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
let R = inputs[0]
let C = inputs[1]

var map = Array(repeating: [Int](), count: R)

for i in 0..<R{
    let txt = readLine()!
    for t in txt{
        map[i].append(Int(t.asciiValue!) - 65)
    }
}

var result = 0
var used = 0

let nx = [1,-1,0,0]
let ny = [0,0,-1,1]

func backtracking(x:Int, y:Int, cnt:Int){
    result = result>cnt ? result:cnt
    used = used | (1 << map[x][y])
    for i in 0...3{
        let X = x + nx[i]
        let Y = y + ny[i]
        if X<0 || Y<0 || X>=R || Y>=C || used&(1<<map[X][Y]) != 0{
            continue
        }
        if used&(1<<map[X][Y]) == 0{
            backtracking(x: X, y: Y, cnt: cnt+1)
        }
    }
    used = used & ~(1 << map[x][y])
}

backtracking(x: 0, y: 0, cnt: 1)
print(result)
