//
//  main.swift
//  D
//
//  Created by Hyun on 2022/05/14.
//

import Foundation

let n = Int(readLine()!)!
let works = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = [Int]()

func btk(day:Int, idx:Int){
    if idx == n{
        return
    }
    let temp = day + works[idx]
    if temp%7 == 5{
        dp.append(temp)
    }
    btk(day: temp, idx: idx+1)
    btk(day: day, idx: idx+1)
}
btk(day: 1, idx: 0)
if dp.isEmpty{
    print("NO")
}else{
    print("YES")
}

