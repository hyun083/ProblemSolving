//
//  main.swift
//  14912_swift
//
//  Created by Hyun on 2022/08/11.
//

import Foundation

let line = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = line[0]
let target = String(line[1])
var ans = 0

for number in 1...n{
    let number = String(number).map{String($0)}
    for n in number{
        if n == target{
            ans += 1
        }
    }
}
print(ans)
