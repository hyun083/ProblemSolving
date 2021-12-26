//
//  main.swift
//  2447_swift
//
//  Created by Hyun on 2021/12/26.
//

import Foundation
let N = Int(readLine()!)!
var map = Array(repeating: Array(repeating: "*", count: N), count: N)

func star(x:Int, y:Int, size:Int){
    if size == 1{
        return
    }
    for i in x+size/3..<x+2*(size/3){
        for k in y+size/3..<y+2*(size/3){
            map[i][k] = " "
        }
    }
    
    star(x: x, y: y, size: size/3)
    star(x: x, y: y+size/3, size: size/3)
    star(x: x, y: y+2*(size/3), size: size/3)
    
    star(x: x+size/3, y: y, size: size/3)
    star(x: x+size/3, y: y+2*(size/3), size: size/3)
    
    star(x: x+2*(size/3), y: y, size: size/3)
    star(x: x+2*(size/3), y: y+size/3, size: size/3)
    star(x: x+2*(size/3), y: y+2*(size/3), size: size/3)
}

star(x: 0, y: 0, size: N)
var ans = ""
for m in map{
    for i in m{
        ans += String(i)
    }
    ans += "\n"
}
print(ans)
