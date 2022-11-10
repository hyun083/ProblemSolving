//
//  main.swift
//  14499_swift
//
//  Created by Hyun on 2022/11/10.
//

import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
var n = info[0], m = info[1], x = info[2], y = info[3], k = info[4]
var map = Array(repeating: Array(repeating:0, count:m) ,count:n)
var dice = [0,0,0,0,0,0]

for i in 0..<n{
    let numbers = readLine()!.split(separator: " ").map{Int($0)!}
    for k in 0..<m{
        map[i][k] = numbers[k]
    }
}

func move(dir:Int){
    switch dir{
    case 1:
        if y+1 < m{
            y += 1
            let temp = dice[0]
            dice[0] = dice[3]
            dice[3] = dice[5]
            dice[5] = dice[2]
            dice[2] = temp
            
            if map[x][y] == 0{
                map[x][y] = dice[5]
            }else{
                dice[5] = map[x][y]
                map[x][y] = 0
            }
            print(dice[0])
        }
    case 2:
        if y-1 >= 0{
            y -= 1
            let temp = dice[5]
            dice[5] = dice[3]
            dice[3] = dice[0]
            dice[0] = dice[2]
            dice[2] = temp
            
            if map[x][y] == 0{
                map[x][y] = dice[5]
            }else{
                dice[5] = map[x][y]
                map[x][y] = 0
            }
            print(dice[0])
        }
    case 3:
        if x-1 >= 0{
            x -= 1
            let temp = dice[5]
            dice[5] = dice[1]
            dice[1] = dice[0]
            dice[0] = dice[4]
            dice[4] = temp
            
            if map[x][y] == 0{
                map[x][y] = dice[5]
            }else{
                dice[5] = map[x][y]
                map[x][y] = 0
            }
            print(dice[0])
        }
    case 4:
        if x+1 < n{
            x += 1
            let temp = dice[0]
            dice[0] = dice[1]
            dice[1] = dice[5]
            dice[5] = dice[4]
            dice[4] = temp
            
            if map[x][y] == 0{
                map[x][y] = dice[5]
            }else{
                dice[5] = map[x][y]
                map[x][y] = 0
            }
            print(dice[0])
        }
    default:
        break
    }
}
let dirs = readLine()!.split(separator: " ").map{Int($0)!}
for dir in dirs{
    move(dir: dir)
}
