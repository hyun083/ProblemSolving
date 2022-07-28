//
//  main.swift
//  1913_swift
//
//  Created by Hyun on 2022/07/29.
//

import Foundation

let n = Int(readLine()!)!
let target = Int(readLine()!)!
var map = Array(repeating: Array(repeating: 0, count: n), count: n)
var number = 1

var x = n/2
var y = n/2
map[x][y] = number
number+=1

var targetX = x
var targetY = y

for i in 1..<n{
    if i%2 == 0{
        for _ in 0..<i{
            x+=1
            map[x][y]=number
            if number == target{
                targetX = x
                targetY = y
            }
            number+=1
        }
        for _ in 0..<i{
            y-=1
            map[x][y]=number
            if number == target{
                targetX = x
                targetY = y
            }
            number+=1
        }
    }else{
        for _ in 0..<i{
            x-=1
            map[x][y]=number
            if number == target{
                targetX = x
                targetY = y
            }
            number+=1
        }
        for _ in 0..<i{
            y+=1
            map[x][y]=number
            if number == target{
                targetX = x
                targetY = y
            }
            number+=1
        }
    }
}
for _ in 0..<n-1{
    x-=1
    map[x][y]=number
    if number == target{
        targetX = x
        targetY = y
    }
    number+=1
}
for map in map{
    for m in map{
        print(m,terminator: " ")
    }
    print()
}
print(targetX+1,targetY+1)
