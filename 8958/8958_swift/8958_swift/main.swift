//
//  main.swift
//  8958_swift
//
//  Created by Hyun on 2022/04/02.
//

//import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    var score = 1
    var sum = 0
    let str = readLine()!
    for ch in str{
        if ch == "O"{
            sum += score
            score += 1
        }else{
            score = 1
        }
    }
    print(sum)
}

