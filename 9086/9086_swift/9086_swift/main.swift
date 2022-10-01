//
//  main.swift
//  9086_swift
//
//  Created by Hyun on 2022/10/01.
//

import Foundation

let n = Int(readLine()!)!
for _ in 0..<n{
    let str = readLine()!.map{String($0)}
    print(str.first!,terminator: "")
    print(str.last!)
}

