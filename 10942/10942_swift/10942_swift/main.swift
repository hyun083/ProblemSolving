//
//  main.swift
//  10942_swift
//
//  Created by Hyun on 2022/07/30.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}

for _ in 0..<Int(readLine()!)!{
    let se = readLine()!.split(separator: " ").map{Int(String($0))!-1}
    var s = se[0]
    var e = se[1]
    let temp = Array(arr[s...e])
    s = 0
    e = temp.count-1
    var flag = true
    while s <= e{
        if temp[s] != temp[e]{
            flag = false
            break
        }
        s += 1
        e -= 1
    }
    if flag{
        print(1)
    }else{
        print(0)
    }
}

