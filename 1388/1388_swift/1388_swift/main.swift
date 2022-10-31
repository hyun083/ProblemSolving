//
//  main.swift
//  1388_swift
//
//  Created by Hyun on 2022/10/31.
//

import Foundation

let xy = readLine()!.split(separator: " ").map{Int(String($0))!}
let x = xy[0]
let y = xy[1]

var map = Array(repeating: Array(repeating: "", count: y), count: x)
var flag = false
var cnt = 0

for i in 0..<x{
    let woods = readLine()!.map{String($0)}
    flag = false
    for k in 0..<y{
        map[i][k] = woods[k]
        if map[i][k]=="-" && !flag{
            cnt += 1
            flag = true
        }else if map[i][k]=="|"{
            flag = false
        }
    }
}
for k in 0..<y{
    flag = false
    for i in 0..<x{
        if map[i][k]=="|" && !flag{
            cnt += 1
            flag = true
        }else if map[i][k]=="-"{
            flag = false
        }
    }
}
print(cnt)
