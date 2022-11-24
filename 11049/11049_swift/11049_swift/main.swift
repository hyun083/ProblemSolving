//
//  main.swift
//  11049_swift
//
//  Created by Hyun on 2022/11/24.
//

import Foundation

let n = Int(readLine()!)!
var arr = [(x:Int,y:Int)]()
var ans = 0

for _ in 0..<n{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    arr.append((line[0],line[1]))
}

var myMin = 250001
var idx = 0
if arr.count > 1{
    while arr.count > 1{
        for i in 0..<arr.count-2{
            if myMin > arr[i].x*arr[i+1].y{
                myMin = arr[i].x*arr[i+1].y
                idx = i
            }
        }
        ans += arr[idx].x * arr[idx].y * arr[idx+1].y
        arr[idx].y = arr[idx+1].y
        arr.remove(at: idx+1)
    }
    print(ans)
}else{
    print(arr[0].x * arr[0].y)
}
