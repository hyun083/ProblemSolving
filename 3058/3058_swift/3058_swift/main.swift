//
//  main.swift
//  3058_swift
//
//  Created by Hyun on 2022/08/03.
//

import Foundation

let t = Int(readLine()!)!

for _ in 0..<t{
    var sum = 0
    var myMin = Int.max
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    for line in line{
        if line % 2 == 0{
            sum += line
            myMin = min(myMin, line)
        }
    }
    print(sum,myMin)
}
