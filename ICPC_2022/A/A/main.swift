//
//  main.swift
//  A
//
//  Created by Hyun on 2022/08/22.
//

import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = line[0]
    let b = line[1]
    let c = line[2]
    var cnt = 0
    for x in 1...a{
        for y in 1...b{
            for z in 1...c{
                if x%y == y%z && y%z == z%x{
                    cnt += 1
                }
            }
        }
    }
    print(cnt)
}

