//
//  main.swift
//  2523
//
//  Created by Hyun on 2023/03/28.
//

import Foundation

let N = Int(readLine()!)!
var star = "*"

for i in 0..<2*N-1{
    print(star)
    if i < N-1{
        star += "*"
    }else{
        star.removeLast()
    }
}
