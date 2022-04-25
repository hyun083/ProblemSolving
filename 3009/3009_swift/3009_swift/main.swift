//
//  main.swift
//  3009_swift
//
//  Created by Hyun on 2022/04/25.
//

import Foundation
var points = [[Int]]()
for _ in 0..<3{
    points.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

var x = [Int:Int]()
var y = [Int:Int]()

for point in points {
    if x[point[0]] == nil{
        x[point[0]] = 1
    }else{
        x[point[0]]! += 1
    }
    if y[point[1]] == nil{
        y[point[1]] = 1
    }else{
        y[point[1]]! += 1
    }
}

for i in x{
    if i.value == 1{
        print(i.key,terminator: " ")
    }
}
for i in y{
    if i.value == 1{
        print(i.key,terminator: "")
    }
}
