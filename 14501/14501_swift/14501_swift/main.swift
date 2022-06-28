//
//  main.swift
//  14501_swift
//
//  Created by Hyun on 2022/06/28.
//

import Foundation

struct Work{
    let t:Int
    let p:Int
}
let n = Int(readLine()!)!
var works = [Work]()
var ans = [Int]()
for _ in 0..<n{
    let tp = readLine()!.split(separator: " ").map{Int(String($0))!}
    works.append(Work(t: tp[0], p: tp[1]))
}
func result(from day:Int)->Int{
    var total = 0
    if day + works[day].t <= n{
        total += works[day].p
    }
    if day + works[day].t < n{
        var temp = 0
        for i in day + works[day].t..<n{
            temp = max(temp, result(from: i))
        }
        total += temp
    }
    return total
}
for i in 0..<n{
    ans.append(result(from: i))
}
print(ans.max()!)
