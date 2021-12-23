//
//  main.swift
//  1780_swift
//
//  Created by Hyun on 2021/12/23.
//

import Foundation

let N = Int(readLine()!)!
var arr = [[Int]]()
var z = 0
var o = 0
var m = 0

for _ in 1...N{
    arr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

func dfs(x:Int, y:Int, size:Int){
    var zero = true
    var one = true
    var minus = true
    
    for i in x..<x+size{
        for k in y..<y+size{
            if arr[i][k] == 0{
                one = false
                minus = false
            }else if arr[i][k] == 1{
                zero = false
                minus = false
            }else if arr[i][k] == -1{
                one = false
                zero = false
            }
        }
    }
    
    if zero == true {
        z += 1
        return
    }
    if one == true{
        o += 1
        return
    }
    if minus == true{
        m += 1
        return
    }
    
    dfs(x: x, y: y, size: size/3)
    dfs(x: x, y: y+size/3, size: size/3)
    dfs(x: x, y: y+2*(size/3), size: size/3)
    
    dfs(x: x+size/3, y: y, size: size/3)
    dfs(x: x+size/3, y: y+size/3, size: size/3)
    dfs(x: x+size/3, y: y+2*(size/3), size: size/3)
    
    dfs(x: x+2*(size/3), y: y, size: size/3)
    dfs(x: x+2*(size/3), y: y+size/3, size: size/3)
    dfs(x: x+2*(size/3), y: y+2*(size/3), size: size/3)
    
}
dfs(x: 0, y: 0, size: N)
print(m)
print(z)
print(o)
